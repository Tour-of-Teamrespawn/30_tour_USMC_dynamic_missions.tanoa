/*
	Rescue Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
*/

private ["_mkr", "_side", "_pos", "_prob", "_string", "_iedbool"];

_mkr = _this select 0;
_side = _this select 1;
_prob = _this select 2;
_iedbool = _this select 3;

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
TDMC_MIS_clearao_completed = false;

_positions = [];
_information = call TDMC_fnc_rescueBuilding;
_buildingType = _information select 0;
_pos = (_information select 1) call BIS_fnc_selectRandom;

{
	if ((_x inArea "TDMC_mkr_AO_1") && (((0 boundingBox _x) select 2) > 2)) then 
	{
		_positions set [count _positions, _x];
	}
}forEach (nearestObjects [[worldSize / 2, worldSize / 2, 0], [_buildingType], worldSize]);

_building = _positions call BIS_fnc_selectRandom;

["TDMC_tsk_rescue", {"Rescue Captive"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_rescue"", {""Rescue the captive from the %3 and return him to base before he is executed. He is located somewhere within the <marker name=""""%1"""">area</marker>.<br/><br/>%2""}, {""Rescue Captive""}, {""Rescue Captive""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_rescue" call A2S_taskCommit;
"TDMC_tsk_rescue" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_rescue";

[_building, _pos]spawn TDMC_fnc_captive;

waitUntil {!isNil "TDMC_captiveUnit"};
sleep 5;
execVM "scripts\TDMC\missions\rescue\rescuecheck.sqf";
TDMC_mission_running = true;

