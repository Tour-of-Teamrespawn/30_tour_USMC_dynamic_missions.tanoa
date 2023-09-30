private ["_trigger", "_pos", "_groups", "_civs", "_posArray", "_buildings", "_buildingsnew", "_presence"];

_number = (_this select 0);
_trigger = call compile format ["TDMC_trg_civSpawn_%1", _number];
_sectorSize = (_this select 1);

_presence = 0;
_posArray = [];
_buildings = [];
_buildingsnew = [];
_groups = [];
_civs = [];
_array =  call compile format ["TDMC_array_%1_CIV", worldName];
_animals = call compile format ["TDMC_array_%1_animal", worldName];

{
	if ((_x inArea _trigger) && ((_x distance (getMarkerPos TDMC_friendlybase)) > TDMC_safeDistance)) then
	{
		_buildings set [count _buildings, _x];
	};
}forEach (nearestObjects [getPos _trigger,["Building","House"], (_sectorSize * 1.5)]);

if (count _buildings > 0) then 
{
	{
		
		if ((getposATL _x) inArea _trigger) then 
		{
			_buildingsnew set [count _buildingsnew, _x];
		};
	}forEach _buildings;
};

_posArray = [];

if (count _buildingsnew > 0) then
{
	{
		if ((count ([(_buildingsnew select _forEachIndex)] call BIS_fnc_buildingPositions)) > 5) then {_posArray = _posArray + [(([(_buildingsnew select _forEachIndex)] call BIS_fnc_buildingPositions) call BIS_fnc_selectRandom)];};
	}forEach _buildingsnew;
};

if (TDMC_civSpawnGlobalCivs) then
{
	for "_i" from 1 to TDMC_civCountSectorMax do
	{
			
		call compile format ["waitUntil {_pos = (_posArray call BIS_fnc_selectRandom);((({((_pos distance _x) < 500) or (((vehicle _x) isKindof ""Air"") && ((speed vehicle _x > 50)))}count (switchableUnits + playableUnits) == 0) && (TDMC_civCountGlobalTotal < TDMC_civCountGlobalMax)) or !TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalEnable or !TDMC_civSpawnGlobalCivs)};", _number];
		call compile format ["if (!TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalEnable or !TDMC_civSpawnGlobalCivs) exitWith {};", _number];
		
		_posArray = _posArray - [_pos];
		_type = _array call BIS_fnc_selectRandom;
		_grp = createGroup CIVILIAN;
		_groups = _groups + [_grp];
		_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
		_civs = _civs + [_unit];
		TDMC_civCountGlobalTotal = TDMC_civCountGlobalTotal + 1;
		_unit call TDMC_fnc_garbageEH;
		[_unit, _posArray] execFSM "scripts\TDMC\ambientLife\civilianControl.fsm";
/*		
		_wp1 = _grp addWaypoint [_pos, 3];
		_wp1 setWaypointSpeed "LIMITED";
		_wp1 setWaypointBehaviour "SAFE";
		_wp1 setWaypointCompletionRadius 15;
		
		_pos = (_posArray call BIS_fnc_selectRandom);
		_wp2 = _grp addWaypoint [_pos, 0];
		_wp2 setWaypointStatements ["true", format ["this moveTo %1;", _pos]];
		_wp2 setWaypointCompletionRadius 15;

		_pos = (_posArray call BIS_fnc_selectRandom);
		_wp3 = _grp addWaypoint [_pos, 0];
		_wp3 setWaypointStatements ["true", format ["this moveTo %1", _pos]];
		_wp3 setWaypointCompletionRadius 15;
		
		//Cycle back to the first position.
		_pos = (_posArray call BIS_fnc_selectRandom);
		_wp4 = _grp addWaypoint [_pos, 0];
		_wp4 setWaypointStatements ["true", format ["this moveTo %1", _pos]];
		_wp4 setWaypointType "CYCLE";
		_wp4 setWaypointCompletionRadius 15;
*/
	};
};
if (TDMC_civSpawnGlobalAnimal && TDMC_civSpawnGlobalCivs) then
{
	//animals and civs
	TDMC_civCountAnimalCalcMax = TDMC_civSpawnGlobalAnimal;
	_presence = 3;
}else
{
	if (TDMC_civSpawnGlobalAnimal && !TDMC_civSpawnGlobalCivs) then
	{
		// animals and no civs
		TDMC_civCountAnimalCalcMax = TDMC_civCountSectorMax;
		_presence = 2;
	}else
	{
		//no animals and civs
		_presence = 1;
	};
};

if (TDMC_civSpawnGlobalAnimal) then
{
	for "_i" from 1 to TDMC_civCountAnimalCalcMax do
	{
		_time = time;
		while {(count _posArray < 20) && (time < _time + 2)} do
		{
			_pos = ([(getpos _trigger), 0, _sectorSize, 7, 0, 5, 0, []] call BIS_fnc_findSafePos);
			if (({((_pos distance _x) < 500) or (((vehicle _x) isKindof "Air") && ((speed vehicle _x > 50)))}count (switchableUnits + playableUnits) == 0) && (_pos inArea _trigger)) then
			{
				_posArray = _posArray + [_pos];
			};
		};

		if (count _posArray == 0) exitWith {};
		
		_pos = _posArray call BIS_fnc_selectRandom;
								
		call compile format ["if (!TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalEnable or !TDMC_civSpawnGlobalAnimal) exitWith {};", _number];

		_grp = createGroup CIVILIAN;
		_unit = _grp createUnit [_animals call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];
		_civs = _civs + [_unit];
		TDMC_civCountGlobalTotal = TDMC_civCountGlobalTotal + 1;
		_unit call TDMC_fnc_garbageEH;
		
		call compile format ["if (!TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalEnable) exitWith {};", _number];

	};
};

if (_presence == 3) then
{
	call compile format ["waitUntil {!TDMC_civSpawnGlobalEnable or !TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalCivs or !TDMC_civSpawnGlobalAnimal};", _number];
}else
{
	if (_presence == 2) then
	{
		call compile format ["waitUntil {!TDMC_civSpawnGlobalEnable or !TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalAnimal};", _number];
	}else
	{
		call compile format ["waitUntil {!TDMC_civSpawnGlobalEnable or !TDMC_civSpawnEnable_%1 or !TDMC_civSpawnGlobalCivs};", _number];
	};
};

call compile format ["TDMC_civSpawnDebounce_%1 = true;", _number];

sleep 5;

if (count _civs > 0) then
{
	while {{!isNull _x}count _civs > 0} do
	{
		{
			_civ = _x;
			if ({(!isNull _civ) && ((_civ distance _x) < 500)}count playableUnits + switchableUnits == 0) then
			{
				deleteVehicle _civ;
				TDMC_civCountGlobalTotal = TDMC_civCountGlobalTotal - 1;
			};
		}forEach _civs;
	};
};

if (count _groups > 0) then
{
	{
		if (!isNull _x) then
		{
			deleteGroup _x;
		};
	}forEach _groups;
};

call compile format ["TDMC_civSpawnDebounce_%1 = false;", _number];