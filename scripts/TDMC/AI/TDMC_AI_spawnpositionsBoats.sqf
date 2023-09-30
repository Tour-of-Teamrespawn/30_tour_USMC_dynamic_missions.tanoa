private ["_mkr", "_checkdistance", "_positions", "_listsafeBoats", "_blacklist", "_possiblepos", "_found", "_listsafeinf", "_mkrDB", "_count"];

_listsafeBoats = [];
_listsafeinf = [];

if ((count _this) == 2) then
{
	// spawn points for standard mission

	_mkr = _this select 0;
	_positions = (_this select 1);

	_checkdistance = 1000;

	if (((markerSize _mkr) select 0) > ((markerSize _mkr) select 1)) then
	{
		_checkdistance = (markerSize _mkr) select 0;
	}else
	{
		_checkdistance = (markerSize _mkr) select 1;
	};

	_blacklist = [];
	_possiblepos = [];
	_found = false;

	for "_a" from 1 to _positions do
	{
		_found = false;
		for "_b" from 1 to 10 do
		{
			_possiblepos = [];
			_possiblepos = [(getMarkerPos _mkr), 0, _checkdistance, 7, 2, 1, 0, _blacklist] call BIS_fnc_findSafePos;
			if (count _possiblepos > 1) then
			{
				if ((str _possiblepos != "[0,0,0]")&&(_possiblepos inArea _mkr)&& (((ASLToATL [_possiblePos select 0, _possiblePos select 1, 0]) select 2) > 2) &&((_possiblepos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
				{
					_possiblepos set [2, 0];
					_listsafeBoats set [count _listsafeBoats, _possiblepos];
					_blacklist set [count _blacklist, [[(_possiblepos select 0) - 5, (_possiblepos select 1) + 5], [(_possiblepos select 0) + 5, (_possiblepos select 1) - 5]]];
					_found = true;
				};
			};

			if (_found) exitWith
			{

			};
		};
	};

}else
{
	// spawn points for river patrol
	

	_positionsInf = _this select 0;
	_positionsBoats = (_this select 1);
	_array = (_this select 2);

	_blacklist = [];
	
	{

		_checkdistance = 150;

		_possiblepos = [];
		_found = false;

		for "_a" from 1 to _positionsBoats do
		{
			_found = false;
			for "_b" from 1 to 10 do
			{
				
				_possiblepos = [];
				_possiblepos = [_x, 0, _checkdistance, 10, 2, 1, 0, _blacklist] call BIS_fnc_findSafePos;

				if (count _possiblepos > 1) then
				{
					if ((str _possiblepos != "[0,0,0]")&& (((ASLToATL [_possiblePos select 0, _possiblePos select 1, 0]) select 2) > 2) && ((_possiblepos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
					{
						_possiblepos set [2, 0];
						_listsafeBoats set [count _listsafeBoats, _possiblepos];
						_blacklist set [count _blacklist, [[(_possiblepos select 0) - 5, (_possiblepos select 1) + 5], [(_possiblepos select 0) + 5, (_possiblepos select 1) - 5]]];
						_found = true;
					};
				};

				if (_found) exitWith
				{

				};
			};
		};
	}forEach _array;
	
	_possiblepos = [];

	for "_a" from 1 to _positionsInf do
	{
		if (count _array == 0) exitWith {};
		_pos = _array call BIS_fnc_selectRandom;
		_array = _array - [_pos];
	
		_count = 0;
		for "_b" from 1 to 15 do
		{
			_possiblepos = [];
			_possiblepos = [_pos, 0, _checkdistance, 5, 0, 1, 1, _blacklist] call BIS_fnc_findSafePos;

			if (count _possiblepos > 1) then
			{
				if ((str _possiblepos != "[0,0,0]")&&((_possiblepos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
				{
					_possiblepos set [2, 0];
					_listsafeinf set [count _listsafeinf, _possiblepos];
					_blacklist set [count _blacklist, [[(_possiblepos select 0) - 5, (_possiblepos select 1) + 5], [(_possiblepos select 0) + 5, (_possiblepos select 1) - 5]]];
				};
			};
		};
	};
/*
	{
		_mkrDB = createMarkerLocal [(format ["TDMC_positionsselectormarker_%1", (_foreachindex + 1)]), _x];
		_mkrDB setMarkertype "hd_dot";
		_mkrDB setmarkercolor "colorred";
	}forEach (_listsafeinf + _listsafeBoats);
*/
};

TDMC_spawnpositionsSea = [_listsafeBoats, _listsafeinf];