if (count _this == 2) then
{
	// spawn points for standard mission
	private ["_mkr", "_checkdistance", "_positions", "_listsafe", "_blacklist", "_possiblepos", "_found", "_listsafeinf", "_mkrDB"];

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

	_listsafe = [];
	_blacklist = [];
	_possiblepos = [];
	_found = false;

	for "_a" from 1 to _positions do
	{
		_found = false;
		for "_b" from 1 to 10 do
		{
			
			_possiblepos = [];
			_possiblepos = [(getMarkerPos _mkr), 0, _checkdistance, 7, 0, 1, 0, _blacklist] call BIS_fnc_findSafePos;

			if (count _possiblepos > 1) then
			{
				if ((str _possiblepos != "[0,0,0]")&&(_possiblepos inArea _mkr)&&((_possiblepos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
				{
					_possiblepos set [2, 0];
					_listsafe set [count _listsafe, _possiblepos];
					_blacklist set [count _blacklist, [[(_possiblepos select 0) - 5, (_possiblepos select 1) + 5], [(_possiblepos select 0) + 5, (_possiblepos select 1) - 5]]];
					_found = true;
				};
			};

			if (_found) exitWith
			{

			};
		};
	};
	_listsafeinf = [];
	{
		if (((_x select 0) inArea _mkr)&&(((_x select 0) distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
		{
			_listsafeinf set [count _listsafeinf, (_x select 0)];
		};
	}forEach (selectBestPlaces [(getMarkerPos _mkr), _checkdistance,"(1 - houses) * (1 - sea)", 1, _positions]);

/*
	{
		_mkrDB = createMarkerLocal [(format ["TDMC_positionsselectormarker_%1", (_foreachindex + 1)]), _x];
		_mkrDB setMarkertype "hd_dot";
		_mkrDB setmarkercolor "colorred";
	}forEach _listsafe + _listsafeinf;
*/
	TDMC_spawnpositions = [_listsafe, _listsafeinf];

}else
{
	//spawn points for defend mission.
	private ["_mkr", "_startdistance", "_enddistance", "_positions", "_listsafe", "_blacklist", "_possiblepos", "_found", "_listsafeinf", "_mkrDB"];

	_mkr = _this select 0;
	_positions = (_this select 1);
	_startdistance = (_this select 2);
	_enddistance = (_this select 3);

	_listsafe = [];
	_blacklist = [];
	_possiblepos = [];
	_found = false;

	for "_a" from 1 to _positions do
	{
		_found = false;
		for "_b" from 1 to 10 do
		{
			
			_possiblepos = [];
			_possiblepos = [(getMarkerPos _mkr), _startdistance, _enddistance, 7, 0, 10, if (count _this == 3) then {1}else{0}, _blacklist] call BIS_fnc_findSafePos;
			if (count _possiblepos > 1) then
			{
				if (_possiblepos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance) then
				{
					_possiblepos set [2, 0];
					_listsafe set [count _listsafe, _possiblepos];
					_blacklist set [count _blacklist, [[(_possiblepos select 0) - 5, (_possiblepos select 1) + 5], [(_possiblepos select 0) + 5, (_possiblepos select 1) - 5]]];
					_found = true;
				};
			};

			if (_found) exitWith
			{
			};
		};
	};

	_listsafeinf = [];
	{
		if ((((_x select 0) distance (getMarkerPos _mkr)) > _startdistance)&&(((_x select 0) distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance))) then
		{
			_listsafeinf set [count _listsafeinf, (_x select 0)];
		};
	}forEach (selectBestPlaces [(getMarkerPos _mkr), _enddistance,"(1 - houses) * (1 - sea)", 10, _positions]);

/*
	{
		_mkrDB = createMarkerLocal [(format ["TDMC_positionsselectormarker_%1", (_foreachindex + 1)]), _x];
		_mkrDB setMarkertype "hd_dot";
		_mkrDB setmarkercolor "colorred";
	}forEach _listsafe + _listsafeinf;
*/
	TDMC_spawnpositions = [_listsafe, _listsafeinf];	

};