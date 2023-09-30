/*
	Defend FOB Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = enemy array, array [1,4,7,3]
	2 = DMC player, obj
	3 = IED presence, boolean
*/

private ["_patRadius", "_skill", "_milMarker", "_posMilitary", "_mkr", "_dirmkr", "_prob", "_string", "_iedbool", "_width", "_height", "_storedpos", "_pos", "_text1", "_scudcunt", "_safepos", "_diameter", "_name", "_type", "_enemy", "_positions2", "_listsafeinf", "_listsafe", "_returnpositions", "_debug", "_abort"];

_mkr = _this select 0;
_prob = _this select 1;
_player = _this select 2;
_iedbool = _this select 3;
_enemy = _this select 4;
_patRadius = _this select 5;
_skill = _this select 6;
_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

_diameter = 300;

_time = time + 5;

private ["_worldarea"];

_worldarea = createMarkerLocal ["TDMC_worldareamarker", [(worldSize / 2), (worldSize / 2), 0]];
_worldarea setMarkerShapeLocal "RECTANGLE";
_worldarea setMarkerSizeLocal [(worldSize / 2), (worldSize / 2)];

_positions = [];

{
	if !(_x isEqualTo [0,0,0]) then
	{
		if ((((_x select 5) distance (getMarkerPos _mkr)) < 300) && ((_x select 5) inArea _mkr)) exitWith
		{
			_posMilitary = (_x select 5);
			_milMarker = createMarkerLocal ["TDMC_defend_milMarker", (_x select 5)];
			_milMarker setMarkerTypeLocal (_x select 1);
			_milMarker setMarkerColorLocal "colorGreen";
			_milMarker setMarkerDirLocal (_x select 3);
			_milMarker setMarkerTextLocal (_x select 4);
			_milMarker setMarkerSizeLocal (_x select 6);
			_milMarker setMarkerShapeLocal (_x select 7);
			_milMarker setMarkerBrushLocal "Border";
			_pos = [0,0,1];
		};
	};
}forEach (["military", "map"] call TDMC_fnc_locations);

if (isNil "_posMilitary") then
{

	while {time < _time} do
	{
		_pos = [getMarkerPos _mkr, 0, _diameter, 50, 0, 0.15, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos; 
		
		if ((str _pos != "[0,0,0]") && (_pos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance) && ((count (_pos nearRoads 50)) == 0) && (_pos inArea _worldarea) && (_pos inArea _mkr)) then 
		{
			if !((_pos isFlatEmpty [50, -1, 0.15, 50, 0, false]) isEqualTo []) then
			{
				_positions = _positions + [_pos];
			};
		};
	};	
	if (count _positions > 0) then
	{
		_pos = _positions call BIS_fnc_selectRandom;
	}else
	{
		_pos = [0,0,0];
	};

};

deleteMarkerLocal _worldarea;

if ((str _pos == "[0,0,0]") && (isNil "_posMilitary")) exitWith
{
	[["warning", "There are no suitable positions in the AO, for this mission"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
	sleep 1;
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;
	_pos = [0,0,0];
	_pos
};

_positions2 = 2 * TDMC_MIS_enemycount;
_debug = "spawn search (defend)";
_returnpositions = [_mkr, _positions2, 500, _width] execVM "scripts\TDMC\AI\TDMC_AI_spawnpositions.sqf";
_time = time + TDMC_MIS_enemycount;

waitUntil {(_time < time) or (!isNil "TDMC_spawnpositions")};

if (!isNil "TDMC_spawnpositions") then
{
	_listsafe = (TDMC_spawnpositions select 0);
	_listsafeinf = (TDMC_spawnpositions select 1);
		
	if ((count _listsafe) < TDMC_MIS_enemycount) exitWith
	{
		[["warning", "There are no suitable positions in the AO, for enemy to spawn, for this mission"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
		sleep 3;
		_abort = true;
	};
}else
{
	if (_time < time) exitWith
	{
		terminate _returnpositions;
		_abort = true;
	};
};

if (!isNil "_abort") exitWith 
{
	[_debug, _player] call TDMC_fnc_cleanbuggedmission;
	_terminated = true;		
};

if (isNil "_posMilitary") then
{
	_basetype = format ["Base_comp_%1", ceil Random 6];
	_pos = [_pos select 0, _pos select 1, 0];
	_return = [ _basetype, _pos, [0,0,0], random 360 ] call LARs_fnc_spawnComp;
	_objects = _return call LARS_fnc_getCompObjects;
	
	TDMC_mission_objects = TDMC_mission_objects + _objects;
	
	_milMarker = createMarkerLocal ["TDMC_defend_milMarker", _pos];
	_milMarker setMarkerTypeLocal "Empty";
	_milMarker setMarkerColorLocal "colorGreen";
	_milMarker setMarkerDirLocal 0;
	_milMarker setMarkerTextLocal "Military Outpost";
	_milMarker setMarkerSizeLocal [100,100];
	_milMarker setMarkerShapeLocal "ELLIPSE";
	_milMarker setMarkerBrushLocal "Border";
};

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_defend_milMarker", getMarkerType _milMarker, getMarkerColor _milMarker, markerDir _milMarker, MarkerText _milMarker, getMarkerPos _milMarker, markerSize _milMarker, markerShape _milMarker, markerBrush _milMarker]];
_pos = [getMarkerPos "TDMC_defend_milMarker" select 0, getMarkerPos "TDMC_defend_milMarker" select 1, 0];

_posmkr = createMarkerLocal ["TDMC_defend_posmkr", _pos];
"TDMC_defend_posmkr" setMarkerTypeLocal "hd_flag";
"TDMC_defend_posmkr" setMarkerColorLocal "colorGreen";
"TDMC_defend_posmkr" setMarkerDirLocal 0;
"TDMC_defend_posmkr" setMarkerTextLocal (MarkerText _milMarker);

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_defend_posmkr", getMarkerType _posmkr, getMarkerColor _posmkr, markerDir _posmkr, MarkerText _posmkr, getMarkerPos _posmkr, markerSize _posmkr, markerShape _posmkr, markerBrush _posmkr]];

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
["TDMC_tsk_basePatrol", {"Patrol From Base"}] call A2S_createSimpleTask; 
if (isNil "_posMilitary") then
{ 
	call compile format ["[""TDMC_tsk_basePatrol"", {""Intel reports sightings of %5 around <marker name=""""%3"""">%4</marker>. Move the military installation, and the patrol to the outer rim in order to complete the task. All players must be in the military installation to start and to complete the mission.<br/><br/>%1""}, {""Patrol From Base""}, {""Patrol From Base""}] call A2S_setSimpleTaskDescription;", _string, "TDMC_mkr_AO_1", "TDMC_defend_posmkr", "Military Outpost", (TDMC_enemyType call TDMC_fnc_factionToText)];
}else
{
	call compile format ["[""TDMC_tsk_basePatrol"", {""Intel reports sightings of %5 around <marker name=""""%3"""">%4</marker>. Move the military installation, and the patrol to the outer rim in order to complete the task. All players must be in the military installation to start and to complete the mission.<br/><br/>%1""}, {""Patrol From Base""}, {""Patrol From Base""}] call A2S_setSimpleTaskDescription;", _string, "TDMC_mkr_AO_1", "TDMC_defend_posmkr", markerText "TDMC_defend_milMarker", (TDMC_enemyType call TDMC_fnc_factionToText)];
};
"TDMC_tsk_basePatrol" call A2S_taskCommit;
"TDMC_tsk_basePatrol" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_basePatrol";
TDMC_mission_running = true;
[_enemy, "TDMC_defend_milMarker", _listsafe, _listsafeinf, _patRadius, _skill] execVM "scripts\TDMC\missions\basePatrol\basepatrolcheck.sqf";