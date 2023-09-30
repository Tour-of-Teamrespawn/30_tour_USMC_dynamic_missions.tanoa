/*
	Clear AO Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
*/

private ["_mkr", "_side", "_pos", "_prob", "_string", "_shape", "_iedbool"];

_mkr = _this select 0;
_side = _this select 1;
_prob = _this select 2;
_iedbool = _this select 3;
if (markerShape _mkr == "ELLIPSE") then
{
	_shape = false;
}else
{
	_shape = true;
};

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
TDMC_MIS_clearao_completed = false;

["TDMC_tsk_clearao", {"Eliminate Hostiles"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_clearao"", {""Eliminate all %3 forces within the <marker name=""""%1"""">area</marker>, in order to complete the task.<br/><br/>%2""}, {""Eliminate Hostiles""}, {""Eliminate Hostiles""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_clearao" call A2S_taskCommit;
"TDMC_tsk_clearao" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_clearao";

_value = (floor ((count TDMC_mission_units) / 2));
if ((count TDMC_mission_units) > 5) then
{
	_value = 5;
};

waitUntil {count TDMC_mission_units > 0};
_side = if (str TDMC_currentSide == "GUER") then
{	
	"resistance"
}else
{
	(str TDMC_currentSide)
};

TDMC_MIS_clearao_trigger = createTrigger["EmptyDetector", getMarkerPos _mkr]; 
TDMC_MIS_clearao_trigger setTriggerArea[((getmarkerSize _mkr) select 0)*1.3,((getmarkerSize _mkr) select 1)*1.3,(markerDir _mkr), _shape];
TDMC_MIS_clearao_trigger setTriggerActivation["ANY", "PRESENT", false];
TDMC_MIS_clearao_trigger setTriggerStatements[(format ["({side _x == %1}count thisList < %2)&& ({(side _x == %1) && !((vehicle _x) isKindOf ""man"")}count thisList == 0)", _side, _value]), "TDMC_MIS_clearao_completed = true;", ""];
sleep 1;
execVM "scripts\TDMC\missions\clearao\clearaocheck.sqf";
TDMC_mission_running = true;

