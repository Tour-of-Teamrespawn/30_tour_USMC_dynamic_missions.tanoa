/*
	ENEMY CREATION FOR CONVOY
	by Mr.Ben
	
	params passed to script through an array:
	0 = types of groups and numbers. array of arrays. [["Infantry",7],["Motorized",2],["Mechanized",0],["Armored",3],["Air",5]];
	1 = position centre, markername, string, e.g. "markername"	
*/

private ["_positions", "_roads", "_usedroads", "_faction", "_marker", "_types_array", "_class_type", "_group_type", "_group_array", "_grp", "_creationarray", "_dir", "_number", "_convoy", "_start", "_veh", "_convoynew", "_grp2", "_guy", "_units", "_crews", "_unit"];


_types_array = _this select 0;
_positions = _this select 1;
_roads = _this select 2;
_skill = _this select 3;

_infantry = _types_array select 0;
_cars = _types_array select 1;
_mechanized = _types_array select 2;
_armor = _types_array select 3;
_helicoptors = _types_array select 4;
_planes = _types_array select 5;

_convoy = [];
_creationarray = [];
TDMC_MIS_convoy_crews = [];
{
	if ((_x select 1) > 0) then
	{
		for "_i" from 1 to (_x select 1) do
		{
			_creationarray set [count _creationarray, (_x select 0)];
		};
	};
}forEach [_infantry, _cars, _mechanized, _armor, _helicoptors, _planes];

sleep 2;
for "_i" from 0 to ((count _creationarray) - 1) do
{
	_number = floor (random (count _creationarray));
	_class_type = _creationarray select _number;
	_creationarray set [_number, "deleted"];
	_creationarray = _creationarray - ["deleted"];
	_group_array = switch (toLower _class_type) do
	{
		case "motorized":
		{
			call compile format ["TDMC_array_%1_cars", TDMC_enemytype];
		};
		case "mechanized":
		{
			call compile format ["TDMC_array_%1_APCs", TDMC_enemytype];
		};	
		case "armored":
		{
			call compile format ["TDMC_array_%1_Tanks", TDMC_enemytype];
		};	
	};
		
	if (count _group_array > 0) then 
	{
		_grp = createGroup TDMC_currentside;
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];
		_start = getPosATL (_roads select _i);
		_group_type = (_group_array call BIS_fnc_selectRandom);
	//	_veh = createVehicle [_group_type, _start, [], 0, "CAN_COLLIDE"];
		_veh = [_start,([_start, (_positions select 1)]call BIS_fnc_dirTo), _group_type, _grp] call BIS_fnc_spawnVehicle;
		(_veh select 0) setDir ([_start, (_positions select 1)]call BIS_fnc_dirTo);
		(_veh select 0) setPosATL _start;
		(_veh select 0) setVelocity [0,0,-1];
		(_veh select 0) call TDMC_fnc_garbageEH;
		_convoy set [count _convoy, (_veh select 0)];
		TDMC_mission_units set [count TDMC_mission_units, (_veh select 0)];
	//	[_veh, _grp] call BIS_fnc_spawnCrew;
		waitUntil {(count units _grp > 0)};
		{
			//sort out accuracy and skill and loadouts if needed
			_x call TDMC_fnc_garbageEH;
			_x call TDMC_fnc_loadouts;
			TDMC_mission_units set [count TDMC_mission_units, _x];
		}forEach units _grp;

		if (_class_type != "armored") then
		{
			if (((_veh select 0) emptyPositions "cargo") > 4) then
			{
				_grp2 = createGroup TDMC_currentside;
				TDMC_mission_groups set [count TDMC_mission_groups, _grp2];
				TDMC_MIS_convoy_crews set [count TDMC_MIS_convoy_crews, _grp2];
				for "_p" from 1 to (((_veh select 0) emptyPositions "cargo") - 1) do
				{
					if (_p > 7) exitWith {};
					_units = call compile format ["TDMC_array_%1_units", TDMC_enemytype];
					_unit = (_units call BIS_fnc_selectRandom);
					if (typeName _unit == "ARRAY") then
					{
						_unit = _unit select 1;
					};
					_guy = _grp2 createUnit [_unit, getPosATL (_veh select 0), [], 0, "CAN_COLLIDE"];
					_guy call TDMC_fnc_garbageEH;
					_guy call TDMC_fnc_loadouts;
					_guy assignAsCargo (_veh select 0);
					_guy moveInCargo (_veh select 0);
				};
			};
		};
	};
};

if (count TDMC_MIS_convoy_crews > 0) then
{
	{
		(vehicle (leader _x)) setVariable ["TOUR_convoyVehicleCargo", _grp];
	}forEach TDMC_MIS_convoy_crews;
};

_convoynew = [];
_counter = (count _convoy) - 1;
{
	_veh = _x;
	_distance = 999999;
	{
		if (((_x distance (_positions select 1)) < _distance)&& !(_x in _convoynew)) then
		{
			_distance = (_x distance (_positions select 1));
			_veh = _x;
		};
	}forEach _convoy;
	_convoynew set [count _convoynew, _veh];
}forEach _convoy;
_convoy = _convoynew;

/*
{
	_mkr = createMarkerLocal [format ["mrben%1", _foreachindex], getposATL _x];
	_mkr setmarkertypelocal "DOT";
	_mkr setMarkerTEXTLOCAL (format ["c%1", (_foreachindex + 1)]);
}foreach _convoy;
*/
[_convoy, _positions]
