/*
	ENMEY HOUSE SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	1 = side, side

*/

private ["_centrepos", "_marker", "_array_type", "_skill", "_side", "_pos", "_test", "_buildingsnew", "_buildings", "_building", "_grp", "_unit", "_size", "_type", "_posarray", "_count", "_min", "_max", "_mindistance"];

_marker = _this select 0;
_centrepos = getMarkerPos _marker;
_side = _this select 1;
_min = _this select 2;
_max = _this select 3;
_mission = _this select 4;

_array_type = call compile format ["TDMC_array_%1_units", TDMC_enemytype];
_pos = [0,0,0];
_test = 0;
_buildingsnew = [];
_posarray = [];

if ((markerSize _marker) select 0 > (markerSize _marker) select 1) then
{
	_size = (markerSize _marker) select 0;
}else
{
	_size = (markerSize _marker) select 1;
};

_positions = [];
_buildings = [];
_mindistance = if (toLower _mission == "patrol from base") then
{
	500
}else
{
	0
};

{
	if (
			(_x inArea _marker)
			&&
			((_x distance (getmarkerPos _marker)) > _mindistance)
			&& 
			!(_x isKindOf "Land_vn_o_prop_cong_cage_01")
		) then
	{
		_buildings set [count _buildings, _x];
	};
}forEach (nearestObjects [_centrepos,["Building","House"], _size]);

if ((count _buildings) == 0) exitWith
{
	_pos
};

{
	if ((getposATL _x) inArea _marker) then 
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
	_test = 0;
	while {_test < 50} do {if (format ["%1", _building buildingPos _test] != "[0,0,0]") then {_posarray set [count _posarray, _building buildingPos _test];};_test = _test + 1};

}forEach _buildingsnew;

if ((count _posarray) < _max) then
{
	_max = count _posarray;
};

if (_min > _max) then
{
	_min = _max;
};

if (_max < 1) then
{
	_max = 1;
	_min = 1;
};

if (count _posarray == 0) exitWith {};

for "_i" from 1 to (_min + (ceil (random (_max - _min)))) do
{
	_pos = [0,0,0];
	_pos = (_posarray call BIS_fnc_selectRandom);
	_posarray = _posarray - [_pos];
	_type = _array_type call BIS_fnc_selectRandom;
	if (typeName _type == "ARRAY") then
	{
		_type = _type select 1;
	};
	_grp = createGroup _side;
	waitUntil {!isNull _grp};
	_unit = _grp createUnit [_type, _pos, [], (_centrepos getDir _pos), "NONE"];
	_unit setPos _pos;
	_unit setDir (_centrepos getDir _pos);
	_unit call TDMC_fnc_garbageEH;
	_unit call TDMC_fnc_loadouts;
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit addEventHandler ["Firednear",{_this call TDMC_fnc_houseunitactive;}]; 
	_unit addEventHandler ["HIT",{_this call TDMC_fnc_houseunitactive;}];
	TDMC_mission_units set [count TDMC_mission_units, _unit];
	TDMC_mission_groups set [count TDMC_mission_groups, _grp];
};
