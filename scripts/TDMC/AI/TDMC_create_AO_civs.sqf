/*
	CIVILIAN CREATION AND ACTIVITY SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = marker name, string
	1 = ambient type

*/

private ["_marker", "_number", "_size", "_count", "_rndpos", "_world", "_array", "_type", "_grp", "_unit", "_amount"];

_marker = _this select 0;
_civsnumber = _this select 1;

if (_civsnumber == 3) then
{
	_amount = 5;
}else
{
	_amount = 7;
};

if ((markerSize _marker) select 0 > (markerSize _marker) select 1) then
{
	_size = (markerSize _marker) select 0;
}else
{
	_size = (markerSize _marker) select 1;
};

if ((_civsnumber == 1)or(_civsnumber == 3)) then
{
	_array =  call compile format ["TDMC_array_%1_CIV", worldName];
	for "_i" from 0 to _amount do
	{
		_count = 0;
		_rndpos = [0,0,0];
		while {_count < 5} do
		{
			_rndpos = [(getMarkerPos _marker), _size] call TDMC_fnc_rndhousepos;
			if !((str _rndpos) == "[0,0,0]") then
			{
				if ([_rndpos select 0, _rndpos select 1, 0] inArea _marker) then
				{
					_count = 5;
				}else
				{
					if (_count == 4) then
					{
						//force position
						_rndpos = [_marker] call TDMC_fnc_rndmarkerpos;
					};
				};
			};
			_count = _count + 1;
		};

		_type = _array call BIS_fnc_selectRandom;
		_grp = createGroup CIVILIAN;
		waitUntil {!isNull _grp};
		_unit = _grp createUnit [_type, _rndpos, [], 0, "NONE"];
		_unit call TDMC_fnc_garbageEH;	
		[_grp, _rndpos, (20 + (ceil (random 30)))] call TDMC_fnc_rndpatrol;
		TDMC_mission_units set [count TDMC_mission_units, _unit];
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];
	};
};

if ((_civsnumber == 2)or(_civsnumber == 3)) then
{
	_array =  call compile format ["TDMC_array_%1_animal", worldName];

	for "_i" from 0 to 5 do
	{
		_count = 0;
		_rndpos = [_marker] call TDMC_fnc_rndmarkerpos;
		player setpos _rndpos;
		_type = _array call BIS_fnc_selectRandom;
		_grp = createGroup CIVILIAN;
		waitUntil {!isNull _grp};
		_unit = _grp createUnit [_type, _rndpos, [], (ceil (random 360)), "NONE"];
		waitUntil {count units _grp > 0};
		_unit call TDMC_fnc_garbageEH;
		TDMC_mission_units set [count TDMC_mission_units, _unit];
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];
	};
};