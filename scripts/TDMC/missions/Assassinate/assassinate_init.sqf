/*
	Assassinate Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
	2 = max number of IEDs
	3 = min number of IEDs
*/

private ["_mkr", "_side", "_max", "_min", "_width", "_height", "_diameter", "_s", "_iedbool"];

_mkr = _this select 0;
_side = _this select 1;
_player = _this select 2;
_skill = _this select 3;
_probabilities = _this select 4;
_iedbool = _this select 5;

_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

if (_height > _width) then
{
	_diameter = _height;
}else
{
	_diameter = _width;
};

_return = [_mkr, _skill] call TDMC_fnc_houseboss;
if (str _return == "[0,0,0]") exitWith
{
	[["warning", "There are no houses in the AO, suitable for this mission"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];	
	sleep 1;
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;	
};

_randomPos = createMarkerLocal ["TDMC_randombossmarker", (TDMC_MIS_boss getpos [50, (random 360)])];
_randomPos setmarkerTypeLocal "hd_unknown";
_randomPos setMarkerColorLocal "ColorRed";

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_randombossmarker", getMarkerType _randomPos, getMarkerColor _randomPos, markerDir _randomPos, MarkerText _randomPos, getMarkerPos _randomPos, markerSize _randomPos, markerShape _randomPos, markerBrush _randomPos]];
publicVariable "TDMC_PV_JIPmarkers";


TDMC_MIS_assassinatecomplete = false;
TDMC_mission_complete = false;
TDMC_current_mission = "TDMC_tsk_assassinate";

_probabilities set [count _probabilities, _iedbool];
_string = _probabilities call TDMC_fnc_probstring;
["TDMC_tsk_assassinate", {"Assassinate Leader"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_assassinate"", {""Assassinate a %4 leader, who is believed to be currently hiding within this <marker name=""""%1"""">AO</marker>. The target was last seen around these <marker name=""""%3"""">buildings</marker>. You can confirm your kill by using the action on the targets corpse.<br/><br/>%2""}, {""Assassinate Leader""}, {""Assassinate Leader""}] call A2S_setSimpleTaskDescription;", _mkr, _string, _randomPos, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_assassinate" call A2S_taskCommit;
"TDMC_tsk_assassinate" call A2S_taskhint;

TDMC_mission_running = true;
execVM "scripts\TDMC\missions\assassinate\assassinatecheck.sqf";