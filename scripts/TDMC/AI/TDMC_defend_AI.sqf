/*
	ENEMY CREATION FOR DEFENSE
	by Mr.Ben
	
	params passed to script through an array:
	0 = types of groups and numbers. array of arrays. [["Infantry",7],["Motorized",2],["Mechanized",0],["Armored",3],["Air",5]];
	1 = position centre, markername, string, e.g. "markername"	
*/

private ["_type_array", "_veh", "_group_type_select", "_faction", "_marker", "_types_array", "_class_type", "_group_type", "_number", "_safepos", "_grp", "_sleeptime1", "_sleeptime2", "_planes", "_creationarray", "_dir", "_listsafe", "_listsafeinf", "_skill", "_wp", "_wp1"];

_types_array = _this select 0;
_marker = _this select 1;
_listsafe = _this select 2;
_listsafeinf = _this select 3;
_skill = _this select 4;
_infantry = _types_array select 0;
_cars = _types_array select 1;
_mechanized = _types_array select 2;
_armor = _types_array select 3;
_helicoptors = _types_array select 4;
_planes = _types_array select 5;

_creationarray = [];
{
	if ((_x select 1) > 0) then
	{
		for "_i" from 1 to (_x select 1) do
		{
			_creationarray set [count _creationarray, (_x select 0)];
		};
	};
}forEach [_infantry, _cars, _mechanized, _armor, _helicoptors, _planes];
_total = count _creationarray;

if (_total == 0) then
{
	_sleeptime2 = 10;
}else
{
	_sleeptime2 = round ((3600 - 1200) / (ceil (_total * (random 2))));
};
if (_sleeptime2 > 300) then 
{
	_sleeptime2 = 300;
};
_time = time + 3600;
_sleeptime1 = 600 + (round (random 600));

while {("TDMC_tsk_defend" call A2S_taskState == "created") && (_time > time)} do
{
	if (count _creationarray == 0) exitWith {};

	if (_creationarray select 0 == "Infantry") then
	{
		_number = 0;
	}else
	{
		_number = (floor (random (count _creationarray)));
	};
			
	_class_type = _creationarray select _number;
	_creationarray set [_number, "deleted"];
	_creationarray = _creationarray - ["deleted"];	

	if (_class_type == "infantry") then
	{
		_safepos = (_listsafe + _listsafeinf) call BIS_fnc_selectRandom;
		if (_safePos in _listsafe) then 
		{
			_listsafe = _listsafe - [_safepos];
		}else
		{
			_listsafeinf = _listsafeinf - [_safepos];
		};
	}else
	{
		_safepos = _listsafe call BIS_fnc_selectRandom;
		_listsafe = _listsafe - [_safepos];
	};	
	
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
		
		sleep 1;
		_grp = [_safepos, TDMC_currentside, (configFile >> "CfgGroups" >> if (TDMC_currentside == RESISTANCE) then {"Indep"}else{(format ["%1", TDMC_currentside])} >> (format ["%1",TDMC_enemytype]) >> _class_type >> _group_type_select)] call TDMC_fnc_spawnGroup;
		TDMC_mission_groups set [count TDMC_mission_groups, _grp];

		waitUntil {(count units _grp > 0)};	
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
			{
				if (vehicle _x isKindOf "plane") then
				{
					(vehicle _x) setPosATL [getPosATL (vehicle _x) select 0, getPosATL (vehicle _x) select 1, 1000];
					(vehicle _x) flyInHeight 500 + (ceil random 500);
					(vehicle _x) setDir [(vehicle _x), getMarkerPos _marker] call BIS_fnc_dirTo;
				}else
				{
					(vehicle _x) flyInHeight 60 + (ceil random 200);
					_grp setSpeedMode "LIMITED";
				};
			}forEach units _grp;
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
			_veh setPosATL [_safepos];
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
		};		
	};
	
	_waitTime = switch (toLower _class_type) do
	{	
		case "infantry": {(_sleeptime2 / 2) + 100};
		case "specops": {(_sleeptime2 / 2) + 100};
		case "support": {(_sleeptime2 / 2) + 100};
		case "motorized": {_sleeptime2 + 500};
		case "mechanized": {_sleeptime2 + 200 + (round (random 300))};
		case "armored": {_sleeptime2 + 200 + (round (random 300))};
		case "air_plane": {_sleeptime2 + 900 + (round (random 600))};
		case "air_heli": {_sleeptime2 + 800 + (round (random 600))};
	};
	
	_wp = _grp addWaypoint [getPosatl (leader _grp), 0];
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointType "MOVE";
	_wp setWaypointTimeout [_waitTime, _waitTime, _waitTime];
	
	_wp1 = _grp addWaypoint [getMarkerpos _marker, 100];
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointType "GUARD";
	
	_sleeptime1 = _sleeptime1 + (round (random _sleeptime2)); 
};

waitUntil {("TDMC_tsk_defend" call A2S_taskState != "created") && (_time > time)};

{
	_grp = _x;
	if (!isNull _grp) then
	{
		if (({alive _x}count units _grp) > 0) then
		{
			{
				deleteWaypoint _x;
			}forEach waypoints _grp;
			_leader = leader _grp;
			_dir = ([getMarkerPos _marker, _leader] call BIS_fnc_dirTo);
			_pos = ([getMarkerPos _marker, 2500, _dir] call BIS_fnc_relPos);
			_wp = _grp addWaypoint [_pos, 0];
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointCombatMode "BLUE";
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed "FULL";
			{
				_x disableAI "TARGET";
				_x disableAI "AUTOTARGET";
				_x setCaptive true;
				_x setSkill 0;
				_x setBehaviour "SAFE";
				_x setCombatMode "BLUE";
				_x doMove _pos;
				_x setSpeedMode "FULL";
			}forEach units _grp;

		};
	};
}foreach TDMC_mission_groups;