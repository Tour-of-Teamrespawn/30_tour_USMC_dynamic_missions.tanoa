/*
	Clear AO Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
*/

private ["_mkr", "_side", "_pos", "_prob", "_string", "_iedbool", "_position"];

_mkr = _this select 0;
_side = _this select 1;
_prob = _this select 2;
_iedbool = _this select 3;

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
TDMC_MIS_cleartunnels_completed = false;

_time = time + 30;
while {_time > time} do
{
	_pos = [(getMarkerPos _mkr), 0, ((markersize _mkr select 0) max (markersize _mkr select 1)), 3, 0, 0.5, 0, []] call BIS_fnc_findSafePos;
	if ((count _pos == 2) && (_pos inArea _mkr)) exitWith {};
};
if (time > _time) exitWith {};
enableDynamicSimulationSystem false;
_rnd = floor random 6;
TDMC_tunnelpad = "land_helipadempty_f" createVehicle _pos;
TDMC_mission_objects set [count TDMC_mission_objects, TDMC_tunnelpad];
TDMC_tunnelpad setVariable ["garrison_size", 3 + (ceil random 3)]; 
TDMC_tunnelpad setVariable ["tunnel_position", _rnd]; 
TDMC_tunnelpad setVariable ["garrison_classnames_preselection", "[""custom""]"];
TDMC_tunnelpad setVariable ["garrison_classnames_custom", (str (call compile format ["TDMC_array_%1_units", TDMC_enemytype]))];
["", [TDMC_tunnelpad, true]] call vn_fnc_module_tunnel_init;

sleep 2;
_position = ([[393.346,16979.3,0],[253.172,18696.2,0],[540.936,20206.0,0],[2730.52,20066.4,0],[4252.47,20084.8,0],[5769.42,20088.9,0]] select _rnd);
Testpos = _position;

["TDMC_tsk_cleartunnels", {"Clear Tunnels"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_cleartunnels"", {""Search for a tunnel entrance within the <marker name=""""%1"""">area</marker>. Once found, enter the tunnel and eliminate all enemies within the complex in order to complete the task.<br/><br/>%2""}, {""Clear Tunnels""}, {""Clear Tunnels""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_cleartunnels" call A2S_taskCommit;
"TDMC_tsk_cleartunnels" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_cleartunnels";

_side = if (str TDMC_currentSide == "GUER") then
{	
	"resistance"
}else
{
	(str TDMC_currentSide)
};

[_side, _position]execVM "scripts\TDMC\missions\tunnels\tunnelscheck.sqf";
TDMC_mission_running = true;
