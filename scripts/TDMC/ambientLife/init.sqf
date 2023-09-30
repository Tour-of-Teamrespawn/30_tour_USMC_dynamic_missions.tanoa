private ["_debug", "_buildingReq", "_gridPosC", "_sectorR", "_worldwidth", "_count", "_buildings", "_buildingsNew", "_positions", "_posarray", "_sectorSize", "_gridPosX", "_gridPosY","_confirmed", "_proceed"];

TDMC_civCountGlobalMax = _this select 0;
TDMC_civCountSectorMax = _this select 1;
TDMC_civCountCivMax = _this select 2;
TDMC_civCountAnimalMax = _this select 2;
TDMC_civCountAnimalCalcMax = _this select 2;
TDMC_civCountGlobalTotal = 0;
TDMC_civSpawnGlobalEnable = true;

_debug = false;
_buildingReq = 6;
_sectorSize = 1000;
_gridPosX = 0;
_gridPosY = 0;
_gridPosC = [0,0,0];
_sectorR = _sectorSize/2;
_worldWidth = switch (toLower worldName) do 
{	
	case "lythium": {worldSize + (_sectorSize / 2)};
	case "cam_lao_nam": {worldSize + (_sectorSize / 2)};
	default {worldSize};
};
_gridPosX = 0 + _sectorR;
_gridPosY = 0 + _sectorR;
_count = 0;
_confirmed = [];
_proceed = false;

while {_gridPosY <= _worldWidth} do
{
	_gridPosX = 0 + _sectorR;
	
	for "_w" from (_gridPosX) to (_worldWidth) step (_sectorSize) do
	{
		_mkr = createMarkerLocal [(format ["TDMC_mkr_civSpawn_%1", _count]), [_gridPosX, _gridPosY]];
		_mkr setMarkerSizeLocal [_sectorR, _sectorR];
		_mkr setMarkerShapeLocal "RECTANGLE";

		if (_debug) then 
		{
			_mkr setMarkerBrushLocal "FDiagonal";
		};

		_positions = [];
		_buildings = [];
		_buildingsnew = [];

		{
			if ((_x inArea _mkr) && ((_x distance (getMarkerPos TDMC_friendlybase)) > TDMC_safeDistance)) then
			{
				_buildings set [count _buildings, _x];
			};
		}forEach (nearestObjects [[_gridPosX, _gridPosY],["Building","House"], (_sectorSize * 1.5)]);

		if (count _buildings > 0) then 
		{
			{
				if ((getposATL _x) inArea _mkr) then 
				{
					_buildingsnew set [count _buildingsnew, _x];
				};
			}forEach _buildings;
		};
		
		_posarray = [];
		
		if (count _buildingsnew > 0) then
		{
			{
				_building = _buildingsnew select _forEachIndex;
				_test = 1;
				while {(format ["%1", _building buildingPos _test] != "[0,0,0]")} do {_test = _test + 1};
				if (_test > 5) then {_posarray set [count _posarray, _building buildingPos _test]};
			}forEach _buildingsnew;
		};

		if ((count _posarray) > _buildingReq) then
		{
			_confirmed = _confirmed + [_count];
		
			call compile format ["TDMC_civSpawnEnable_%1 = false;", _count];
			call compile format ["TDMC_civSpawnDebounce_%1 = false;", _count];
			
			call compile format ["TDMC_trg_civSpawn_%1 = createTrigger [""EmptyDetector"", getMarkerPos ""%2""];", _count, _mkr];
			call compile format ["TDMC_trg_civSpawn_%1 setTriggerArea [((getMarkerSize ""%2"") select 0),((getMarkerSize ""%2"") select 1),(markerDir ""%2""), if ((markerShape ""%2"")== ""RECTANGLE"") then {true} else {false}];", _count, _mkr];
			call compile format ["TDMC_trg_civSpawn_%1 setTriggerActivation [""%2"",""PRESENT"",true];", _count, TDMC_playerside];
			call compile format ["TDMC_trg_civSpawn_%1 setTriggerStatements [""(({(_x in thisList) && !(((vehicle _x) isKindof """"Air"""") && ((speed vehicle _x > 50)))}count (switchableUnits + playableUnits)) > 0) && !TDMC_civSpawnDebounce_%1 "", ""TDMC_civSpawnEnable_%1 = true; [%1, %2] execVM """"scripts\TDMC\ambientLife\sector_active.sqf"""";"", ""TDMC_civSpawnEnable_%1 = false;""]", _count, _sectorSize];

			if (_debug) then 
			{
				_mkr setMarkerColorLocal "COLORGREEN";
			}else
			{
				deleteMarkerLocal _mkr;
			};
		}else
		{
			if (_debug) then 
			{
				_mkr setMarkerColorLocal "COLORRED";
			}else
			{
				deleteMarkerLocal _mkr;
			};
		};
		_count = _count + 1;
		_gridPosX = _gridPosX + _SectorSize;
	};
	
	_gridPosY = _gridPosY + _SectorSize;
};

if (count _confirmed == 0) then {hint "no positions for AI Civ spawn";};

