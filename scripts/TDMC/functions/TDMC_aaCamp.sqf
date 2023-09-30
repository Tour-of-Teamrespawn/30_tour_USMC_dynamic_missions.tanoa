/*
Create camps with AA.
By Mr.Ben.

Usage:
_this select 0 = Position [x, z, y]
_this select 1 = Optional, number of camp guards, accepted numbers between 0 and 2

Returns the spawned AA objects in an array.

Example:
[(getMarkerPos "CAMPSITE"), (round (random 2))] call TDMC_fnc_AAcamp;
*/

private ["_pos", "_guards", "_camp", "_units", "_colour", "_unit", "_group", "_direction", "_aa", "_spawn"];
_pos = (_this select 0);

_guards = 0;
if ((count _this) > 1) then { _guards = (_this select 1); } else { _guards = (ceil (random 2)); };

_direction = ceil (random 360);
_camp = [ format ["arty_%1", (ceil random 3)] , _pos, [0,0,0], _direction ] call LARs_fnc_spawnComp;
TDMC_mission_objects = TDMC_mission_objects + (_camp call LARs_fnc_getCompObjects);

private ["_createUnit", "_rank"];
_unitArray = [];
_groupArray = [];

_group = createGroup TDMC_currentside;
_version = (call compile format ["TDMC_array_%1_AA", TDMC_enemytype]) call BIS_fnc_selectRandom;

{
	if (typeOf _x == "Land_HelipadEmpty_F") exitWith {_spawn = _x};
}forEach (_camp call LARs_fnc_getCompObjects);

_aa =  createvehicle [_version, getPosATL _spawn, [], (getDir _spawn), "NONE"];
_aa setDir (getDir _spawn);
_aa setPos (getPosATL _spawn);
//deleteVehicle _spawn;
//player setpos _pos;
_crew = [_aa, _group] call BIS_fnc_spawnCrew;
{
	_x call TDMC_fnc_loadouts;
	_x call TDMC_fnc_garbageEH;
	_x disableAI "MOVE";
}forEach units _group;
TDMC_mission_units set [count TDMC_mission_units, _unit];
TDMC_mission_groups set [count TDMC_mission_groups, _group];
TDMC_mission_objects set [count TDMC_mission_objects, _aa];
hint "done!!!";
_group2 = createGroup TDMC_currentside;

for "_i" from 0 to _guards do
{
	_rank = "PRIVATE";
	if (_i == 0) then { _rank = "SERGEANT"; };
	_version = (call compile format ["TDMC_array_%1_units", TDMC_enemytype]) call BIS_fnc_selectRandom;
	_p = (_aa getPos [25, (random 360)]);
	_unit = _group2 createUnit [_version, _p, [], (ceil (random 360)), "NONE"];
	_unit call TDMC_fnc_loadouts;
	_unit call TDMC_fnc_garbageEH;
	TDMC_mission_units set [count TDMC_mission_units, _unit];
};
[_group2, _pos] call BIS_fnc_taskDefend;
TDMC_mission_groups set [count TDMC_mission_groups, _group2];

_aa