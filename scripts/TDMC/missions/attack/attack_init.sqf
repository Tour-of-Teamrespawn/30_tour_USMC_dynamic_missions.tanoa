/*
	Attack FOB Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = enemy array, array [1,4,7,3]
	2 = DMC player, obj
	3 = IED presence, boolean
*/

private ["_mkr", "_dirmkr", "_prob", "_string", "_iedbool", "_width", "_height", "_storedpos", "_pos", "_text1", "_scudcount", "_safepos", "_diameter", "_scud", "_name", "_type", "_enemy", "_posmkr", "_milArray", "_milMarker", "_dir"];

_mkr = _this select 0;
_prob = _this select 1;
_player = _this select 2;
_iedbool = _this select 3;
_enemy = _this select 4;

_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

if (_height > _width) then
{
	_diameter = _height;
}else
{
	_diameter = _width;
};

/*
_center = [(worldSize / 2), (worldSize / 2), 0];
_size = sqrt 2 * _a;
*/
_time = time + 5;

private ["_worldarea", "_posMilitary"];

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
			_milMarker = createMarkerLocal ["TDMC_attack_milMarker", (_x select 5)];
			_milMarker setMarkerTypeLocal (_x select 1);
			_milMarker setMarkerColorLocal (_x select 2);
			_milMarker setMarkerDirLocal (_x select 3);
			_milMarker setMarkerTextLocal (_x select 4);
			_milMarker setMarkerSizeLocal (_x select 6);
			_milMarker setMarkerShapeLocal (_x select 7);
			_milMarker setMarkerBrushLocal (_x select 8);
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
sleep 1;

if ((str _pos == "[0,0,0]") && (isNil "_posMilitary")) exitWith
{
	[["warning", "There are no suitable positions in the AO, for this mission"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];	
	sleep 1;
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;
	_pos = [0,0,0];
	_pos
};
 

/*
[_pos]spawn
{
	{
		[_x, TDMC_playerside, 600 + (ceil (random 200))] execFSM "scripts\TDMC\AI\TOUR_artilleryhunter.fsm";
		sleep 10;
	}forEach (nearestObjects [(_this select 0), ["StaticMortar"], 100]);
};
*/

if (isNil "_posMilitary") then
{
	_basetype = format ["Base_comp_%1", ceil Random 6];
	_pos = [_pos select 0, _pos select 1, 0];
	_return = [ _basetype, _pos, [0,0,0], random 360 ] call LARs_fnc_spawnComp;
	_objects = _return call LARS_fnc_getCompObjects;

	TDMC_mission_objects = TDMC_mission_objects + _objects;

	_milMarker = createMarkerLocal ["TDMC_attack_milMarker", _pos];
	_milMarker setMarkerTypeLocal "Empty";
	_milMarker setMarkerColorLocal "colorRed";
	_milMarker setMarkerDirLocal 0;
	_milMarker setMarkerTextLocal "Military Outpost";
	_milMarker setMarkerSizeLocal [100,100];
	_milMarker setMarkerShapeLocal "ELLIPSE";
	_milMarker setMarkerBrushLocal "Border";

};

_pos = [getMarkerPos "TDMC_attack_milMarker" select 0, getMarkerPos "TDMC_attack_milMarker" select 1, 0];

_posmkr = createMarkerLocal ["TDMC_attack_posmkr", _pos];
"TDMC_attack_posmkr" setMarkerTypeLocal "hd_flag";
"TDMC_attack_posmkr" setMarkerColorLocal "colorRed";
"TDMC_attack_posmkr" setMarkerDirLocal 0;
//"TDMC_attack_posmkr" setMarkerTextLocal "Stronghold";

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_attack_posmkr", getMarkerType _posmkr, getMarkerColor _posmkr, markerDir _posmkr, MarkerText _posmkr, getMarkerPos _posmkr, markerSize _posmkr, markerShape _posmkr, markerBrush _posmkr]];

TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_attack_milMarker", getMarkerType _milMarker, getMarkerColor _milMarker, markerDir _milMarker, MarkerText _milMarker, getMarkerPos _milMarker, markerSize _milMarker, markerShape _milMarker, markerBrush _milMarker]];

if (isNil "_posMilitary") then
{
	_enemy1 = ["TDMC_attack_milMarker", TDMC_currentside, 3, 5, "attack"] execVM "scripts\TDMC\AI\TDMC_create_AO_enemyhouse.sqf";
	waituntil {scriptDone _enemy1};
	_enemy2 = ["TDMC_attack_milMarker", TDMC_currentside, 8, 14] execVM "scripts\TDMC\AI\TDMC_create_attack_enemy_base.sqf";
	waituntil {scriptDone _enemy2};
}else
{
	_enemy1 = ["TDMC_attack_milMarker", TDMC_currentside, 10, 18] execVM "scripts\TDMC\AI\TDMC_create_attack_enemy_mapbase.sqf";
	waituntil {scriptDone _enemy1};
};


_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;
["TDMC_tsk_capture", {"Capture Stronghold"}] call A2S_createSimpleTask;
if (isNil "_posMilitary") then
{ 
	call compile format ["[""TDMC_tsk_capture"", {""Assault and capture the enemy stronghold, located in the <marker name=""""%2"""">AO</marker>, in order to complete the task.<br/><br/>%1""}, {""Capture Stronghold""}, {""Capture Stronghold""}] call A2S_setSimpleTaskDescription;", _string, "TDMC_mkr_AO_1"];
}else
{
	call compile format ["[""TDMC_tsk_capture"", {""The %5 have taken <marker name=""""%3"""">%4</marker>. Assault and retake the military stronghold, located in the <marker name=""""%2"""">AO</marker>, in order to complete the task.<br/><br/>%1""}, {""Retake Stronghold""}, {""Retake Stronghold""}] call A2S_setSimpleTaskDescription;", _string, "TDMC_mkr_AO_1", "TDMC_attack_milMarker", markerText "TDMC_attack_milMarker", (TDMC_enemyType call TDMC_fnc_factionToText)];
};
"TDMC_tsk_capture" call A2S_taskCommit;
"TDMC_tsk_capture" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_capture";
TDMC_mission_running = true;
[_pos] execVM "scripts\TDMC\missions\attack\attackcheck.sqf";
