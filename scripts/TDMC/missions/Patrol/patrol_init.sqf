/*
	Patrol Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
*/

private ["_mkr", "_side", "_pos1", "_pos2", "_pos3", "_pos4", "_pos5", "_dirmkr", "_prob", "_string", "_iedbool", "_inc", "_trigsize", "_distance", "_distanceInc", "_posToStart", "_dir"];

_mkr = _this select 0;
_side = _this select 1;
_prob = _this select 2;
_iedbool = _this select 3;

_dirmkr = createMarkerLocal ["TDMC_pat_dirmkr", getMarkerPos _mkr];
"TDMC_pat_dirmkr" setMarkerTypeLocal "mil_arrow2";
"TDMC_pat_dirmkr" setMarkerColorLocal "colorRed";
"TDMC_pat_dirmkr" setMarkerDirLocal (markerDir _mkr);

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_pat_dirmkr", getMarkerType _dirmkr, getMarkerColor _dirmkr, markerDir _dirmkr, MarkerText _dirmkr, getMarkerPos _dirmkr, markerSize _dirmkr, markerShape _dirmkr, markerBrush _dirmkr]];

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;

["TDMC_tsk_patrol", {"Patrol Area"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_patrol"", {""Patrol through the <marker name=""""%1"""">area</marker>, on the ground, in order to complete the task. Be on the look out for %3 forces within the area.<br/><br/>%2""}, {""Patrol Area""}, {""Patrol Area""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_patrol" call A2S_taskCommit;
"TDMC_tsk_patrol" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_patrol";

TDMC_MIS_pat_point_1 = false;
TDMC_MIS_pat_point_2 = false;
TDMC_MIS_pat_point_3 = false;
TDMC_MIS_pat_point_4 = false;
TDMC_MIS_pat_point_5 = false;

_trigsize = 50;
_distance = (((getmarkersize _mkr) select 1) - _trigsize) *2;
_centre = (getMarkerPos _mkr);
_dir = (markerDir _mkr);
_inc = (_distance) / 4;
_distanceInc = 0;
_posToStart = [_centre, ((_distance) / 2), (_dir - 180)]call BIS_fnc_relPos;

for "_i" from 1 to 5 do
{
	call compile format ["_pos%1 = ([_PosToStart, _distanceInc, (_posToStart getDir _centre)]call BIS_fnc_relPos)", _i];
	
	_distanceInc = _distanceInc + _inc;
};	

_p1 = [_mkr, 30] call TDMC_fnc_mis_pat_trigpos;
_width1 = _p1 select 1;
_p2 = [_mkr, 65] call TDMC_fnc_mis_pat_trigpos;
_width2 = _p2 select 1;
_p3 = [_mkr, 90] call TDMC_fnc_mis_pat_trigpos;
_width3 = _p3 select 1;
_p4 = [_mkr, 115] call TDMC_fnc_mis_pat_trigpos;
_width4 = _p4 select 1;
_p5 = [_mkr, 150] call TDMC_fnc_mis_pat_trigpos;
_width5 = _p5 select 1;

/*
_marker = createMarkerLocal ["mmm1", _pos1];
_marker setmarkerdirlocal (markerDir _mkr);
_marker setMarkershape (markerShape _mkr);
_marker setmarkercolor "COLORGREEN";
_marker setMarkersize [_width1, 50];

_marker = createMarkerLocal ["mmm2", _pos2];
_marker setmarkerdirlocal (markerDir _mkr);
_marker setMarkershape (markerShape _mkr);
_marker setmarkercolor "COLORGREEN";
_marker setMarkersize [_width2, 50];

_marker = createMarkerLocal ["mmm3", _pos3];
_marker setmarkerdirlocal (markerDir _mkr);
_marker setMarkershape (markerShape _mkr);
_marker setmarkercolor "COLORGREEN";
_marker setMarkersize [_width3, 50];

_marker = createMarkerLocal ["mmm4", _pos4];
_marker setmarkerdirlocal (markerDir _mkr);
_marker setMarkershape (markerShape _mkr);
_marker setmarkercolor "COLORGREEN";
_marker setMarkersize [_width4, 50];

_marker = createMarkerLocal ["mmm5", _pos5];
_marker setmarkerdirlocal (markerDir _mkr);
_marker setMarkershape (markerShape _mkr);
_marker setmarkercolor "COLORGREEN";
_marker setMarkersize [_width5, 50];
*/

TDMC_MIS_pat_trigger_1 = createTrigger["EmptyDetector", _pos1]; 
TDMC_MIS_pat_trigger_1 setTriggerArea[_width1,50,(MarkerDir _mkr),false];
TDMC_MIS_pat_trigger_1 setTriggerActivation[(format ["%1",_side]),"PRESENT",false];
TDMC_MIS_pat_trigger_1 setTriggerStatements[format ["this && ({!(_x isKindOf ""Air"")&&(side _x == TDMC_playerside)}count thisList) > 0", _side], "TDMC_MIS_pat_point_1 = true;", ""];

TDMC_MIS_pat_trigger_2 = createTrigger["EmptyDetector", _pos2]; 
TDMC_MIS_pat_trigger_2 setTriggerArea[_width2,50,(MarkerDir _mkr),false];
TDMC_MIS_pat_trigger_2 setTriggerActivation[(format ["%1",_side]),"PRESENT",false];
TDMC_MIS_pat_trigger_2 setTriggerStatements[format ["this && ({!(_x isKindOf ""Air"")&&(side _x == TDMC_playerside)}count thisList) > 0", _side], "TDMC_MIS_pat_point_2 = true;", ""];

TDMC_MIS_pat_trigger_3 = createTrigger["EmptyDetector", _pos3]; 
TDMC_MIS_pat_trigger_3 setTriggerArea[_width3,50,(MarkerDir _mkr),false];
TDMC_MIS_pat_trigger_3 setTriggerActivation[(format ["%1",_side]),"PRESENT",false];
TDMC_MIS_pat_trigger_3 setTriggerStatements[format ["this && ({!(_x isKindOf ""Air"")&&(side _x == TDMC_playerside)}count thisList) > 0", _side], "TDMC_MIS_pat_point_3 = true;", ""];

TDMC_MIS_pat_trigger_4 = createTrigger["EmptyDetector", _pos4]; 
TDMC_MIS_pat_trigger_4 setTriggerArea[_width4,50,(MarkerDir _mkr),false];
TDMC_MIS_pat_trigger_4 setTriggerActivation[(format ["%1",_side]),"PRESENT",false];
TDMC_MIS_pat_trigger_4 setTriggerStatements[format ["this && ({!(_x isKindOf ""Air"")&&(side _x == TDMC_playerside)}count thisList) > 0", _side], "TDMC_MIS_pat_point_4 = true;", ""];

TDMC_MIS_pat_trigger_5 = createTrigger["EmptyDetector", _pos5]; 
TDMC_MIS_pat_trigger_5 setTriggerArea[_width5,50,(MarkerDir _mkr),false];
TDMC_MIS_pat_trigger_5 setTriggerActivation[(format ["%1",_side]),"PRESENT",false];
TDMC_MIS_pat_trigger_5 setTriggerStatements[format ["this && ({!(_x isKindOf ""Air"")&&(side _x == TDMC_playerside)}count thisList) > 0", _side], "TDMC_MIS_pat_point_5 = true;", ""];

sleep 3;

TDMC_mission_running = true;
execVM "scripts\TDMC\missions\patrol\patrolcheck.sqf";
