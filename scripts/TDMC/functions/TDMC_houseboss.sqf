/*
	ASSASSINATE HOUSE POSITION SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	0 = _skill;

*/

private ["_max", "_marker", "_array_type", "_skill", "_size", "_test", "_posarray", "_pos", "_building", "_buildings", "_buildingsnew", "_grp", "_unit", "_type", "_positions", "_centrepos", "_newposarray", "_count"];

_marker = _this select 0;
_skill = _this select 1;
_pos = [0,0,0];
_test = 0;
_posarray = [];
_array_type =  call compile format ["TDMC_array_%1_units", TDMC_enemytype];

if ((markerSize _marker) select 0 > (markerSize _marker) select 1) then
{
	_size = (markerSize _marker) select 0;
}else
{
	_size = (markerSize _marker) select 1;
};

_positions = [];
_buildings = [];

{
	if (_x inArea _marker) then
	{
		_buildings set [count _buildings, _x];
	};
}forEach (nearestObjects [(getMarkerPos _marker),["House", "Building"], _size]);

_buildingsnew = [];

if ((count _buildings) == 0) exitWith
{
	_pos
};

{
	if ((getPosATL _x) inArea _marker) then 
	{
		_buildingsnew set [count _buildingsnew, _x];
	};
}forEach _buildings;

if (count _buildingsnew == 0) exitWith
{
	_pos
};

{
	_building = _buildingsnew select _forEachIndex;
	while { format ["%1", _building buildingPos _test] != "[0,0,0]" } do {_posarray set [count _posarray, (_building buildingPos _test)]; _test = _test + 1;};
	_test = 0;
}forEach _buildingsnew;

if (count _posarray == 0) exitWith {_pos};

_pos = _posarray call BIS_fnc_selectRandom;
_posarray  = _posarray - [_pos];
_type = call compile format ["TDMC_array_%1_boss", TDMC_enemytype];
_grp = createGroup TDMC_currentside;
waitUntil {!isNull _grp};
TDMC_MIS_boss = _grp createUnit [_type, _pos, [], (ceil (random 360)), "NONE"];
TDMC_MIS_boss setPos _pos;
TDMC_MIS_boss call TDMC_fnc_loadouts;
TDMC_MIS_boss addEventHandler ["KILLED", {_this call TDMC_fnc_bosskilled}];
TDMC_MIS_boss allowFleeing 0;  
TDMC_MIS_boss setVariable ["lambs_danger_disableAI", true];
//TDMC_MIS_boss setVehicleInit "TDMC_MIS_boss = this; this addAction [""Confirm Identity"", ""scripts\TDMC\missions\assassinate\confirmkill.sqf"", 1, 1, false, true, """", ""(_this distance _target < 4)""];";
TDMC_mission_units set [count TDMC_mission_units, TDMC_MIS_boss];
TDMC_mission_groups set [count TDMC_mission_groups, _grp];
//[nil, nil, rSPAWN, TDMC_MIS_boss, { waitUntil {!isNil "TOUR_fnc_bossaction"}; _this call TOUR_fnc_bossaction }] call RE;
[TDMC_MIS_boss, {waitUntil {!isNil "TDMC_fnc_bossaction"}; _this call TDMC_fnc_bossaction; }] remoteExec ["BIS_fnc_spawn", 0, true]; 

_newposarray = [];
{
	if ((_pos distance _x) < 20) then
	{
		_newposarray set [count _newposarray, _x];
	};
}forEach _posarray;

if (count _newposarray == 0) exitWith {};

if (count _newposarray < 4) then
{
	_count = (count _newposarray) - 1;
}else
{
	_count = ceil (random 4) -1;
};

if (_count > 0) then
{
	for "_i" from 1 to _count do
	{
		_pos = _newposarray call BIS_fnc_selectRandom;
		_newposarray  = _newposarray - [_pos];
		_type = _array_type call BIS_fnc_selectRandom;
		_grp = createGroup TDMC_currentside;
		waitUntil {!isNull _grp};
		_unit = _grp createUnit [_type, _pos, [], (ceil (random 360)), "NONE"];
		_unit setPos _pos;
		_unit call TDMC_fnc_garbageEH;
		_unit call TDMC_fnc_loadouts;
		_unit addEventHandler ["Firednear",{_this call TDMC_fnc_houseunitactive;}]; 
		_unit addEventHandler ["HIT",{_this call TDMC_fnc_houseunitactive;}];
		TDMC_mission_units set [count TDMC_mission_units, _unit];
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];
	};
};

_pos
