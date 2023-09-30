/*
	IED Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
	2 = max number of IEDs
	3 = min number of IEDs
	4 = probability of enemies
*/

private ["_mkr", "_side", "_max", "_min", "_width", "_height", "_diameter", "_s", "_prob", "_string", "_iedbool"];

_mkr = _this select 0;
_side = _this select 1;
_max = _this select 3;
_min = _this select 2;
_prob = _this select 4;
_player = _this select 5;
_iedbool = _this select 6;

_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

if (_height > _width) then
{
	_diameter = _height;
}else
{
	_diameter = _width;
};

TDMC_IED_detonated = false;
_s = [_mkr, _min, _max, TDMC_core, _side] execVM "scripts\TOUR_IED\bombsCreateArea.sqf";
waitUntil {scriptDone _s};

waitUntil {!isNil {TDMC_core getVariable "TOUR_IEDs"}};

if ((count (TDMC_core getVariable "TOUR_IEDs")) == 0) exitWith
{
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;
	[["error", "Sorry! IEDs were not able to be created."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
	TDMC_mission_complete = false;
	TDMC_mission_running = false;
};

publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
_string = (_prob + [_iedbool]) call TDMC_fnc_probstring;

["TDMC_tsk_ied", {"Defuse IEDs"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_ied"", {""%3 forces have been planting IEDs, resulting in high friendly and civilian losses. Defuse all IEDs in this <marker name=""""%1"""">area</marker>.<br/><br/>%2""}, {""Defuse IEDs""}, {""Defuse IEDs""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_ied" call A2S_taskCommit;
"TDMC_tsk_ied" call A2S_taskHint;

TDMC_current_mission = "TDMC_tsk_ied";

TDMC_mission_running = true;
execVM "scripts\TDMC\missions\IED\iedcheck.sqf";