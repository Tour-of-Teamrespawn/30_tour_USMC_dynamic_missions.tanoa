if (!isServer) exitwith {};

private ["_side", "_faction", "_grp", "_type_array", "_pat_spawn", "_safepos", "_nearestpos", "_nextpos", "_time", "_posarray", "_count", "_array", "_extra", "_type", "_class_type"];
_side = _this select 0;
_faction = _this select 1;
_type_array = _this select 2;
_area = _this select 3;
_extra = "";
_type = (_type_array call BIS_fnc_selectRandom);

if (typeName _type == "ARRAY") then
{
	_class_type = _type select 0;
	_type = _type select 1;
}else
{
	_class_type = "infantry";
};

while {true} do
{
	_pat_spawn = (["patrolpoints", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	if ((({_x in playableUnits} count nearestObjects [_pat_spawn, ["landvehicle", "man"], 1000]) == 0)) exitWith {};
};

_safepos = [_pat_spawn, 0, 100, 5, 0, 50, 0] call BIS_fnc_findSafePos;
if (([(_safepos select 0), (_safepos  select 1)] distance [(_pat_spawn select 0), (_pat_spawn select 1)]) >= 100) then
{
	_safepos = _pat_spawn;
};

_grp = [_safepos, _side, (configFile >> "CfgGroups" >> if (TDMC_currentside == RESISTANCE) then {"Indep"}else{(format ["%1", _side])} >> _faction >> _class_type >> _type)] call TDMC_fnc_spawnGroup;
waitUntil {(count units _grp > 0)};
{
	//sort out accuracy and skill and loadouts if needed
	_x call TDMC_fnc_garbageEH;
	_x call TDMC_fnc_loadouts;
}forEach units _grp;	
TDMC_AI_EOA_array set [count TDMC_AI_EOA_array, _grp];

//patrol to next position
_nearestpos = [];
{
	if (_x distance _pat_spawn < 4000) then
	{
		_nearestpos set [count _nearestpos, _x];
	};
}forEach (["patrolpoints", _area] call TDMC_fnc_locations);

_nextpos = _nearestpos call BIS_fnc_selectRandom;

_wp1 = _grp addWaypoint [_nextpos, 0];
_wp1 setWaypointFormation (["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"]call BIS_fnc_selectRandom);
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointCombatmode "YELLOW";
_wp1 setWaypointBehaviour "SAFE";
{
	_x setSpeedMode "LIMITED";
	_x setCombatMode "YELLOW";
	_x setBehaviour "SAFE";
}forEach units _grp;

_time = time + 1800;
waitUntil {({(_x distance _nextpos > 100)}count units _grp == 0)or(time > _time)or({(alive _x)}count units _grp == 0)};
_pos = _nextpos;
_pos = getPosATL leader _grp;
TDMC_AI_EOA_array = TDMC_AI_EOA_array - [_grp];
waitUntil {((({(side _x == TDMC_playerside)} count (nearestObjects [_pos, ["landvehicle", "man"], 1000])) == 0))};
if (!isNull _grp) then
{
	if (({alive _x}count units _grp) > 0) then
	{
		{
			deleteVehicle _x;
		}forEach units _grp;
	};
	deleteGroup _grp;
};
call compile format ["TDMC_AI_AEP_count_%1 = TDMC_AI_AEP_count_%1 - 1;", _area];