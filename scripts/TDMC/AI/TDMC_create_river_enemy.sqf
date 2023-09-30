/*
	ENEMY CREATION AND ACTIVITY SCRIPT
	by Mr.Ben
	
	params passed to script through an array:
	0 = faction, string, e.g. "BIS_US", "RU" etc
	1 = markername, string
	2 = types of groups and numbers. array of arrays. [["Infantry",7],["Motorized",2],["Mechanized",0],["Armored",3],["Air",5],["naval",5]];
	3 = patrol distance, integer
	4 = overall skill level
*/

private ["_side", "_type_array", "_faction", "_mkrarray", "_types_array", "_class_type", "_group_type", "_group_type_select", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_planes", "_extra", "_listsafe", "_listsafeinf", "_count", "_rnd", "_veh", "_listsafeBoat"];

_faction = _this select 0;
_mkrarray = _this select 1;
_types_array = _this select 2;
_pat_distance = _this select 3;
_skill = _this select 4;
_listsafe = _this select 5; 
_listsafeinf = _this select 6;
_listsafeBoat = _this select 7;
_infantryCount = count _listsafeinf;

{
	_number = _x select 1;
	_class_type = _x select 0;

	if (_number > 0) then
	{
		if ((toLower _class_type) == "naval") then
		{
			for "_i" from 1 to _number do
			{
				private ["_veh"];
				_rnd = (floor (random (count _listsafeBoat)));
				_safepos = _listsafeBoat select _rnd;
				_listsafeBoat set [_rnd, "deleted"];
				_listsafeBoat = _listsafeBoat - ["deleted"];
				_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "boats"];
				_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _safepos, [], 0, "CAN_COLLIDE"];
				_veh setPosASL _safepos;
				_veh setVelocity [0,0,-1];
				_grp = createGroup TDMC_currentside;
				[_veh, _grp] call BIS_fnc_spawnCrew;
				TDMC_mission_groups set [count TDMC_mission_groups, _grp];
				{	
					_x call TDMC_fnc_garbageEH;
					_x call TDMC_fnc_loadouts;
					TDMC_mission_units set [count TDMC_mission_units, _x];
					if !((vehicle _x) in TDMC_mission_units) then
					{
						TDMC_mission_units set [count TDMC_mission_units, (vehicle _x)];
					};
				}forEach units _grp;
				[_veh, _mkrarray] execVM "scripts\TDMC\AI\TDMC_AI_boatDrive.sqf";
			};
		};

		if ((toLower _class_type) == "infantry") then
		{
			_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "units"];
			for "_m" from 1 to _infantryCount do
			{
				_rnd = (floor (random (count _listsafeinf)));
				_safepos = _listsafeinf select _rnd;
				_listsafeinf set [_rnd, "deleted"];
				_listsafeinf = _listsafeinf - ["deleted"];
				_type = _type_array call BIS_fnc_selectRandom;
				_grp = createGroup TDMC_currentside;
				waitUntil {!isNull _grp};
				_unit = _grp createUnit [_type, _safepos, [], (_safepos getDir (_mkrarray select 0)), "NONE"];
				_unit setPos _safepos;
				_unit setDir (_safepos getDir (_mkrarray select 0));
				_unit call TDMC_fnc_garbageEH;
				_unit call TDMC_fnc_loadouts;
				TDMC_mission_units set [count TDMC_mission_units, _unit];
				TDMC_mission_groups set [count TDMC_mission_groups, _grp];	
			};
		};
	};
}forEach _types_array;

TDMC_spawnpositions = [_listsafe, _listsafeinf];

_handle = true;
_handle