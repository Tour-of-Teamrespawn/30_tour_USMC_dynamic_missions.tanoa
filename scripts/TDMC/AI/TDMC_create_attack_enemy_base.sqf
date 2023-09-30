/*
	ENMEY HOUSE SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	1 = side, side

*/

private ["_centrepos", "_marker", "_array_type", "_skill", "_side", "_pos", "_test", "_buildingsnew", "_buildings", "_building", "_grp", "_unit", "_size", "_type", "_posarray", "_count", "_min", "_max"];

_centrePos = _this select 0;
_side = _this select 1;
_min = _this select 2;
_max = _this select 3;

_array_type = call compile format ["TDMC_array_%1_units", TDMC_enemytype];
_posarray = [];

_test = 0;
while {str (getMarkerPos (format ["TDMC_Mkr_Base_Pos_%1", _test])) != "[0,0,0]"} do 
{
	_posarray = _posarray + [[getMarkerPos (format ["TDMC_Mkr_Base_Pos_%1",_test]), markerDir (format ["TDMC_Mkr_Base_Pos_%1",_test])]]; 
	_test = _test + 1;
};

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

if (count _posarray == 0) exitWith 
{
	[["error", "Sorry! There are not enough internal markers for enemies to spawn within the base."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call"];
};

for "_i" from 1 to (_min + (ceil (random (_max - _min)))) do
{
	_pos = [[0,0,0],0];
	_pos = (_posarray call BIS_fnc_selectRandom);
	_posarray = _posarray - [_pos];
	_type = _array_type call BIS_fnc_selectRandom;
	_type = _array_type call BIS_fnc_selectRandom;
	if (typeName _type == "ARRAY") then
	{
		_type = _type select 1;
	};
	_grp = createGroup _side;
	waitUntil {!isNull _grp};
	_unit = _grp createUnit [_type, (_pos select 0), [], (_pos select 1), "NONE"];
	waitUntil {!isNull _unit};
	_unit call TDMC_fnc_garbageEH;
	_unit call TDMC_fnc_loadouts;
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit addEventHandler ["Firednear",{_this call TDMC_fnc_houseunitactive;}]; 
	_unit addEventHandler ["HIT",{_this call TDMC_fnc_houseunitactive;}];
	TDMC_mission_units set [count TDMC_mission_units, _unit];
	TDMC_mission_groups set [count TDMC_mission_groups, _grp];
	_unit setPos (_pos select 0);
};
