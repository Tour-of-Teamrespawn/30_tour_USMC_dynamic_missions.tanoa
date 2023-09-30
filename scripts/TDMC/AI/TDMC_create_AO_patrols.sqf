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

private ["_side", "_type_array", "_faction", "_marker", "_types_array", "_class_type", "_group_type", "_group_type_select", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_planes", "_extra", "_listsafe", "_listsafeinf", "_count", "_rnd", "_veh", "_listsafeBoat"];

_faction = _this select 0;
_marker = _this select 1;
_types_array = _this select 2;
_pat_distance = _this select 3;
_skill = _this select 4;
_listsafe = _this select 5; 
_listsafeinf = _this select 6;
_listsafeBoat = _this select 7;

{
	_number = _x select 1;
	_class_type = _x select 0;
	if (_number > 0) then
	{
		for "_i" from 1 to _number do
		{
			if (_class_type == "infantry") then
			{
				_rnd = (floor (random (count _listsafeinf)));
				_safepos = _listsafeinf select _rnd;
				_listsafeinf set [_rnd, "deleted"];
				_listsafeinf = _listsafeinf - ["deleted"];
			}else
			{
				if ( _class_type == "naval") then
				{
					_rnd = (floor (random (count _listsafeBoat)));
					_safepos = _listsafeBoat select _rnd;
					_listsafeBoat set [_rnd, "deleted"];
					_listsafeBoat = _listsafeBoat - ["deleted"];
				}else
				{
					_rnd = (floor (random (count _listsafe)));
					_safepos = _listsafe select _rnd;
					_listsafe set [_rnd, "deleted"];
					_listsafe = _listsafe - ["deleted"];
				};
			};
			
			_class_type = _x select 0;
			_group_type =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, _class_type];
			
			if (count _group_type > 0) then 
			{
				if (((toLower _class_type) == "air_plane")or((toLower _class_type) == "air_heli")) then
				{
					_class_type = "Air";
				};

				_group_type_select = _group_type call BIS_fnc_selectRandom;

				if (typeName _group_type_select == "ARRAY") then
				{
					_class_type = _group_type_select select 0;
					_group_type_select = _group_type_select select 1;
				};
				_class_type = (_class_type call TDMC_fnc_classFix);
				_grp = [_safepos, TDMC_currentside, (configFile >> "CfgGroups" >> if (TDMC_currentside == RESISTANCE) then {"Indep"}else{(format ["%1", TDMC_currentside])} >> TDMC_enemytype >> _class_type >> _group_type_select)] call TDMC_fnc_spawnGroup;
				TDMC_mission_groups set [count TDMC_mission_groups, _grp];
				_veh = objnull;
				{
					//sort out accuracy and skill and loadouts if needed
					_x call TDMC_fnc_garbageEH;
					_x call TDMC_fnc_loadouts;
					TDMC_mission_units set [count TDMC_mission_units, _x];
					if !((vehicle _x) in TDMC_mission_units) then
					{
						TDMC_mission_units set [count TDMC_mission_units, (vehicle _x)];
					};
					if (vehicle _x != _x) then
					{
						_veh = vehicle _x;
					};							
					if (count (assignedVehicleRole _x) == 0) then
					{
						if ((_veh emptyPositions "cargo") > 0) then
						{
							_x assignAsCargo _veh;
							_x moveInCargo _veh;
						};
					};
				}forEach units _grp;
				if (_veh != objnull) then
				{
					_veh addEventHandler ["Hit", 
					{
						if (count (assignedCargo (_this select 0)) > 0) then
						{
							if (side (_this select 3) == TDMC_playerSide) then
							{
								doStop driver _veh;
								{
									unassignVehicle _x;
								}forEach assignedCargo (_this select 0);
								_veh removeEventHandler ["Hit", _thisEventHandler];
							};
						};
					}];
				};
				if (_class_type == "Air") then
				{
					[_grp, _safepos, (_pat_distance *2), [], _marker] call TDMC_fnc_rndpatrol;
					{
						if (vehicle _x isKindOf "plane") then
						{
							(vehicle _x) setPosATL [getPosATL (vehicle _x) select 0, getPosATL (vehicle _x) select 1, 1000];
							(vehicle _x) flyInHeight 500 + (ceil random 500);
						}else
						{
							(vehicle _x) flyInHeight 60 + (ceil random 200);
							_grp setSpeedMode "LIMITED";
						};
					}forEach units _grp;
				}else
				{
					[_grp, _safepos, _pat_distance, [], _marker] call TDMC_fnc_rndpatrol;
				};
			}else
			{
				if (((toLower _class_type) == "motorized") && (count _group_type == 0)) then
				{
					private ["_veh"];
					_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "Cars"];
					_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _safepos, [], 0, "CAN_COLLIDE"];
					_veh setPosATL _safepos;
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
					[_grp, _safepos, (_pat_distance * 1), [], _marker] call TDMC_fnc_rndpatrol;
					_veh addEventHandler ["Hit", 
					{
						if (count (assignedCargo (_this select 0)) > 0) then
						{
							if (side (_this select 3) == TDMC_playerSide) then
							{
								doStop driver _veh;
								{
									unassignVehicle _x;
								}forEach assignedCargo (_this select 0);
								_veh removeEventHandler ["Hit", _thisEventHandler];
							};
						};
					}];
				};

				if (((toLower _class_type) == "mechanized") && (count _group_type == 0)) then
				{
					private ["_veh"];
					_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "APCs"];
					_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _safepos, [], 0, "CAN_COLLIDE"];
					_veh setPosATL _safepos;
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
					[_grp, _safepos, (_pat_distance * 1), [], _marker] call TDMC_fnc_rndpatrol;
					_veh addEventHandler ["Hit", 
					{
						if (count (assignedCargo (_this select 0)) > 0) then
						{
							if (side (_this select 3) == TDMC_playerSide) then
							{
								doStop driver _veh;
								{
									unassignVehicle _x;
								}forEach assignedCargo (_this select 0);
								_veh removeEventHandler ["Hit", _thisEventHandler];
							};
						};
					}];
				};
				
				if (((toLower _class_type) == "armored") && (count _group_type == 0)) then
				{
					private ["_veh"];
					_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "tanks"];
					_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _safepos, [], 0, "CAN_COLLIDE"];
					_veh setPosATL _safepos;
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
					[_grp, _safepos, (_pat_distance * 1), [], _marker] call TDMC_fnc_rndpatrol;
					_veh addEventHandler ["Hit", 
					{
						if (count (assignedCargo (_this select 0)) > 0) then
						{
							if (side (_this select 3) == TDMC_playerSide) then
							{
								doStop driver _veh;
								{
									unassignVehicle _x;
								}forEach assignedCargo (_this select 0);
								_veh removeEventHandler ["Hit", _thisEventHandler];
							};
						};
					}];
				};

				if (((toLower _class_type) == "air_plane")or((toLower _class_type) == "air_heli")) then
				{
					if ((toLower _class_type) == "air_plane") then
					{
						_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "planes"];
						_safepos = [_safepos select 0, _safepos select 1, 500];
					};
					if ((toLower _class_type) == "air_heli") then
					{
						_type_array =  call compile format ["TDMC_array_%1_%2", TDMC_enemytype, "choppers"];
						_safepos = [_safepos select 0, _safepos select 1, 100];
					};
					private ["_veh"];
					_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _safepos, [], 0, "FLY"];
					player setpos _safepos;
					_veh setPosATL _safepos;
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
					[_grp, _safepos, (_pat_distance * 2), [], _marker] call TDMC_fnc_rndpatrol;					
				};
				
				if (((toLower _class_type) == "naval") && (count _group_type == 0)) then
				{
					private ["_veh"];
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
					[_veh, (_pat_distance * 2)] execVM "scripts\TDMC\AI\TDMC_AI_boatDrive.sqf";
				};
			};
		};
	};
}forEach _types_array;

TDMC_spawnpositions = [_listsafe, _listsafeinf];

_handle = true;
_handle