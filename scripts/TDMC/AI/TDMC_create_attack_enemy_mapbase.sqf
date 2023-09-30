/*
	CREATE ENEMIES TO LOITER OR PATROL THE BASE
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	1 = side, side
	2 = minimum groups of 2 men
	3 = maximum groups of 2 men

*/

private ["_posInit", "_mkr", "_centrepos", "_marker", "_array_type", "_skill", "_side", "_pos", "_test", "_buildingsnew", "_buildings", "_building", "_grp", "_unit", "_size", "_type", "_posarray", "_count", "_min", "_max"];

_mkr = _this select 0;
_side = _this select 1;
_min = _this select 2;
_max = _this select 3;

_radius = (selectMax (getMarkerSize _mkr)) * 1.5;

_array_type = call compile format ["TDMC_array_%1_units", TDMC_enemytype];

for "_i" from 1 to (_min + (ceil (random (_max - _min)))) do
{
	_mkr = _this select 0;
	_posInit = [(getMarkerPos _mkr) select 0, (getMarkerPos _mkr) select 1, 0];
	_list = [];
	while {true} do
	{
		_pos = [_posInit, 0, _radius, 1, 0, 2, 0, _list] call BIS_fnc_findSafePos;
		if (_pos inArea _mkr) exitWith {};
	};
	if ((str _pos) != "[0,0,0]") then
	{
		_type = _array_type call BIS_fnc_selectRandom;
		if (typeName _type == "ARRAY") then
		{
			_type = _type select 1;
		};
		_grp = createGroup _side;
		waitUntil {!isNull _grp};
		for "_g" from 1 to 2 do
		{
			_unit = _grp createUnit [_type, _pos, [], ((getMarkerPos _mkr) getDir _pos), "NONE"];
			_unit setPos _pos;
			_unit setDir ((getMarkerPos _mkr) getDir _pos);
			_unit call TDMC_fnc_garbageEH;
			_unit call TDMC_fnc_loadouts;
			_unit setVariable ["lambs_danger_disableAI", true];
			TDMC_mission_units set [count TDMC_mission_units, _unit];
		};
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];
		if (random 3 < 1) then
		{
			[_grp, _pos, 100] call TDMC_fnc_rndpatrol;
		}else
		{
			[_grp, _pos] call BIS_fnc_taskDefend;
		};
	};
};
