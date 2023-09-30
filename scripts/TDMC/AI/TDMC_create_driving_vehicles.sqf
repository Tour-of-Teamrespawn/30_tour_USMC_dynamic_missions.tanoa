if (!isServer) exitwith {};

private ["_arraymidpos", "_type_array","_type_array2","_side","_faction","_chance","_vehicle_spawn","_vehicle_end","_grp","_wp1","_detinationreached","_veh","_time", "_new", "_area"];

_type_array = _this select 0;
_side = _this select 1;
_chance = _this select 2;
_faction = _this select 3;
_area = _this select 4;
_arraymidpos = ["PatrolPoints", _area] call TDMC_fnc_locations;

if ((floor (random 101)) <= _chance) then
{
	_vehicle_spawn = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	_vehicle_end = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;			

	while {((str _vehicle_end) == (str _vehicle_spawn))} do
	{
		_vehicle_end = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	};
	waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};

	_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
	_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
	_veh setPosATL _vehicle_spawn;
	_veh setVelocity [0,0,-1];

	_grp = createGroup _side;
	[_veh, _grp] call BIS_fnc_spawnCrew;
	{
		_x call TDMC_fnc_loadouts;
	}forEach units _grp;
	TDMC_AI_EOA_array set [count TDMC_AI_EOA_array, _grp];
	_wpmid = _grp addWaypoint [(_arraymidpos call BIS_fnc_selectRandom), 0];
	_wpmid setWaypointSpeed "NORMAL";
	_wpmid setWaypointCombatMode "RED";	
	_wp1 = _grp addWaypoint [_vehicle_end, 0];
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointCombatMode "RED";
	_time = time + 100;
	_detinationreached = false;
	while {(({alive _x} count units _grp) > 0)} do 
	{
		if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
		if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};	
		if (!canMove _veh) exitWith {};				
		sleep 2;
	};
	TDMC_AI_EOA_array = TDMC_AI_EOA_array - [_grp];
	_time = time + 300;
	while {!_detinationreached} do
	{
		if ((({(side _x == TDMC_playerside)} count nearestObjects [_veh, ["landvehicle", "man"], 2500]) == 0)or(_time < time)) exitWith {};
		sleep 2;
	};
	if (!isNull _veh) then 
	{
		deleteVehicle _veh;
	};
	if (!isNull _grp) then
	{
		{
			deleteVehicle _x;
		}foreach units _grp;
		deleteGroup _grp;
	};
}else
{
	_type_array2 =  call compile format ["TDMC_array_%1_cars", (toLower worldname)];

	_vehicle_spawn = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	_vehicle_end = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	while {((str _vehicle_end) == (str _vehicle_spawn))} do
	{
		_vehicle_end = (["BorderCrossings", _area] call TDMC_fnc_locations) call BIS_fnc_selectRandom;
	};
	waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};
	_veh = createVehicle [_type_array2 call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
	_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
	_veh setPosATL _vehicle_spawn;
	_veh setVelocity [0,0,-1];
	_veh call TDMC_fnc_garbageEH;

	_grp = createGroup CIVILIAN;
	_type = call compile format ["TDMC_array_%1_CIV", worldname];
	_man = _grp createUnit [(_type call BIS_fnc_selectRandom), _vehicle_spawn, [], 0, "NONE"];
	_man assignAsDriver _veh;
	_man moveInDriver _veh;
	
	{
		_x call TDMC_fnc_loadouts;
		_x setVariable ["BIS_noCoreConversations",true];
	}forEach units _grp;
	
	_wpmid = _grp addWaypoint [(_arraymidpos call BIS_fnc_selectRandom), 0];
	_wpmid setWaypointSpeed "NORMAL";	
	_wp1 = _grp addWaypoint [_vehicle_end, 0];
	_wp1 setWaypointSpeed "NORMAL";
	
	_detinationreached = false;
	_time = time + 100;
	while {(({alive _x} count units _grp) > 0)} do 
	{
		if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
		if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};
		if (!canMove _veh) exitWith {};
		sleep 2;
	};
	_time = time + 300;
	while {!_detinationreached} do
	{
		if ((({(side _x == TDMC_playerside)} count nearestObjects [_veh, ["landvehicle", "man"], 1500]) == 0)or(_time < time)) exitWith {};
		sleep 2;
	};
	if (!isNull _veh) then 
	{
		deleteVehicle _veh;
	};
	if (!isNull _grp) then
	{
		{
			deleteVehicle _x;
		}foreach units _grp;
		deleteGroup _grp;
	};

};
call compile format ["TDMC_AI_car_count_%1 = TDMC_AI_car_count_%1 - 1;", _area];