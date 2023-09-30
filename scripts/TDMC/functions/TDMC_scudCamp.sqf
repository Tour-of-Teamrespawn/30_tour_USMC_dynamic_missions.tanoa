/*
Create camps with Scud missiles.
By Mr.Ben.

Usage:
_this select 0 = Position [x, z, y]
_this select 1 = Optional, number of camp guards, accepted numbers between 0 and 2

Returns the spawned SCUD objects in an array.

Example:
[(getMarkerPos "CAMPSITE"), (round (random 2))] call TDMC_fnc_scudcamp;
*/

private ["_pos", "_guards", "_camp", "_units", "_colour", "_unit", "_group", "_dir", "_scud"];
_pos = (_this select 0);

_guards = 0;
if ((count _this) > 1) then { _guards = (_this select 1); } else { _guards = (ceil (random 2)); };

_colour = switch (toLower worldname) do
{
	case "takistan": {"sand"};
	case "lythium": {"sand"};
	default {"green"};
};

_dir = (random 360);
_camp = [ format ["SCUD_%1", _colour] , _pos, [0,0,0], _dir ] call LARs_fnc_spawnComp;
_scud = {
			if ((typeOf _x) in ["UK3CB_TKA_O_MAZ_543_SCUD", "UK3CB_CW_SOV_O_LATE_MAZ_543_SCUD", "UK3CB_CW_SOV_O_EARLY_MAZ_543_SCUD", "UK3CB_TKA_I_MAZ_543_SCUD"]) exitWith {_x};
		}forEach (_camp call LARs_fnc_getCompObjects);
//	player setpos getposATL _scud;
TDMC_mission_objects = TDMC_mission_objects + (_camp call LARs_fnc_getCompObjects);

private ["_createUnit", "_rank"];
_unitArray = [];
_groupArray = [];

_group = createGroup TDMC_currentside;

for "_i" from 0 to _guards do
{
	_rank = "PRIVATE";
	if (_i == 0) then { _rank = "SERGEANT"; };
	_version = (call compile format ["TDMC_array_%1_units", TDMC_enemytype]) call BIS_fnc_selectRandom;
	_p = (_scud getPos [15, (random 360)]);
	_unit = _group createUnit [_version, _p, [], (ceil (random 360)), "NONE"];
	_unit call TDMC_fnc_loadouts;
	_unit call TDMC_fnc_garbageEH;
	TDMC_mission_units set [count TDMC_mission_units, _unit];
};
[_group, (getPosATL (leader _group))] call BIS_fnc_taskDefend;
TDMC_mission_groups set [count TDMC_mission_groups, _group];

_scud