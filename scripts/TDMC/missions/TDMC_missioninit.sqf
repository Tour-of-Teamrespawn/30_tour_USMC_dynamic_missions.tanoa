if (isServer) then
{

	private ["_mkr", "_iedarray", "_mission", "_side", "_enemyarray", "_patradius", "_debug", "_enemy", "_usedroads", "_assignedroads", "_segement", "_enemyhouse", "_terminated", "_listsafe", "_listsafeinf", "_returnpositions", "_positions", "_enemycount", "_missionsetup", "_life", "_haloPos", "_listsafeBoats"];

	_terminated = false;
	
	//clear variables ready
	TDMC_PV_JIPmarkers = [];
	TDMC_mission_complete = false;
	TDMC_mission_running = false;
	TDMC_mission_units = [];
	if (!isNil "TDMC_spawnpositions") then
	{
		TDMC_spawnpositions = nil;
	};
	_time = time + 20;
	_debug = "";
	// set variables from array passed
	_mission = _this select 1;
	_side = _this select 2;
	TDMC_currentside = _side;
	TDMC_enemytype = _this select 3;
	publicVariable "TDMC_enemytype";
	_enemyarray = [(_this select 4), (_this select 5), (_this select 6), (_this select 7), (_this select 8), (_this select 9), (_this select 10)];
	TDMC_missionSkill = _this select 11;
	_skill = _this select 11;
	_patradius = _this select 12;
	_life = (_this select 14);
	_player = (_this select 15);
	_haloPos = (_this select 16);

	sleep 1;
	TDMC_MIS_enemycount = ((_this select 4)+(_this select 5)+(_this select 6)+(_this select 7)+(_this select 8)+(_this select 9)+(_this select 10));

	if ((_mission in ["clear ao", "defend", "destroy convoy"])&&(TDMC_MIS_enemycount == 0)) exitWith
	{
		[["warning", "You require enemy to play this mission type."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
	};

	if (str _haloPos != "[0,0,0]") then
	{
		_mkrHalo = createMarkerLocal ["TDMC_haloMarker", _haloPos];
		_mkrHalo setMarkerTypeLocal "mil_start";
		_mkrHalo setMarkerColorLocal "Colorblue";
		_mkrHalo setMarkerTextLocal "Halo Insertion (10,000m)";
		TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_haloMarker", getMarkerType _mkrHalo, getMarkerColor _mkrHalo, markerDir _mkrHalo, MarkerText _mkrHalo, getMarkerPos _mkrHalo, markerSize _mkrHalo, markerShape _mkrHalo, markerBrush _mkrHalo]];
	};

	_mkrarray = _this select 0;
	_listsafe = [];
	_listsafeinf = [];
	if !(toLower _mission in ["destroy convoy", "river patrol"]) then
	{
		_mkr = createMarkerLocal ["TDMC_mkr_AO_1", (_mkrarray select 0)];
		"TDMC_mkr_AO_1" setMarkerSizeLocal (_mkrarray select 1);
		"TDMC_mkr_AO_1" setMarkerShapeLocal (_mkrarray select 3);
		"TDMC_mkr_AO_1" setMarkerColorLocal "colorRed";
		"TDMC_mkr_AO_1" setMarkerDirLocal (_mkrarray select 2);
		"TDMC_mkr_AO_1" setMarkerBrushLocal "Border";	
		
		if (toLower _mission != "defend") then
		{
			TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, ["TDMC_mkr_AO_1", getMarkerType _mkr, getMarkerColor _mkr, markerDir _mkr, MarkerText _mkr, getMarkerPos _mkr, markerSize _mkr, markerShape _mkr, markerBrush _mkr]];		
			
			if (TDMC_MIS_enemycount == 0) then 
			{
				_positions = 4;
			}else
			{
				_positions = 2 * TDMC_MIS_enemycount;
			};
			_debug = "spawn search";
			_returnpositions = [_mkr, _positions] execVM "scripts\TDMC\AI\TDMC_AI_spawnpositions.sqf";
			_time = time + _positions;
			waitUntil {(_time < time) or (!isNil "TDMC_spawnpositions")};
			if (_time < time) exitWith 
			{
				terminate _returnpositions;
				[_debug, _player]call TDMC_fnc_cleanbuggedmission;
				_terminated = true;		
			};
			_listsafe = (TDMC_spawnpositions select 0);
			_listsafeinf = (TDMC_spawnpositions select 1);
			if ((count _listsafe) < (TDMC_MIS_enemycount + 1)) exitWith
			{
				[["warning", "There are not enough safe positions for AI to spawn"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
				_terminated = true;
			};
			_listsafeBoats = [];
			if ((_this select 10) > 0) then
			{
				_debug = "boat spawn search";
				_returnpositions = [_mkr, _positions] execVM "scripts\TDMC\AI\TDMC_AI_spawnpositionsBoats.sqf";
				_time = time + _positions;
				waitUntil {(_time < time) or (!isNil "TDMC_spawnpositionsSea")};
				if (_time < time) exitWith 
				{
					terminate _returnpositions;
					[_debug, _player]call TDMC_fnc_cleanbuggedmission;
					_terminated = true;
				};
				if (_terminated) exitWith
				{
					[["warning", "There are not enough safe positions for the boats to spawn"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
					_terminated = true;
				};
				_listsafeBoats = (TDMC_spawnpositionsSea select 0);
			};
		};
	}else
	{
		if (count _mkrarray < 3) exitWith
		{
			[["warning", "You require more than three positions to play this mission."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
			_terminated = true;
		};
		
		if (toLower _mission == "destroy convoy") then
		{
			if ( TDMC_MIS_enemycount == 0) then
			{
				[["warning", "You require enemies to play this mission."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
				_terminated = true;			
			};
			
			_initialroads = (_mkrarray select 0) nearRoads 30;
			_segment = _initialroads select 0;
			_assignedroads = [];
			for "_i" from 0 to (TDMC_MIS_enemycount * 2) do
			{
				if (_i == 0) then
				{
					_usedroads = [(roadsConnectedTo _segment select 0)];
				}else
				{
					_usedroads = roadsConnectedTo _segment;
				};
				{
					if !(_x in _assignedroads) exitWith
					{
						_segment = _x;
						_assignedroads set [(count _assignedroads), _x];
					};
				}forEach _usedroads;
			};
			_usedroads = _assignedroads;
			_assignedroads = [];
			_delete = false;
			_value = 0;
			{
				if (_delete) then 
				{
					_delete = false;
				}else 
				{
					_assignedroads set [(count _assignedroads), _x];
				//	_mr = createMarker [format ["tdmc_roadsConvoy_%1", _value], getpos _x];
				//	_mr setMarkerColor "coloryellow";
				//	_mr setMarkerType "hd_dot";
				//	_mr setMarkerText (str _value);
					//_delete = true;
					_value = _value + 1;
				};
			}forEach _usedroads;


			sleep 1;
			if (count _assignedroads < TDMC_MIS_enemycount) exitWith
			{
				[["warning", (format ["You require a longer stretch of road for the initial start position.", _debug])], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
				_terminated = true;						
			};
		};
		
		if (toLower _mission == "river patrol") then
		{
			if (TDMC_MIS_enemycount == 0) then 
			{
				_positions = 4;
			}else
			{
				_positions = 2 * TDMC_MIS_enemycount;
			};

			_listsafeBoats = [];
			_listsafeInf = [];
			_debug = "boat spawn search";
			_returnpositions = [(_this select 4), (_this select 10), _mkrarray] execVM "scripts\TDMC\AI\TDMC_AI_spawnpositionsBoats.sqf";
			_time = time + _positions;
			waitUntil {(_time < time) or (!isNil "TDMC_spawnpositionsSea")};
			if (_time < time) exitWith 
			{
				terminate _returnpositions;
				[_debug, _player]call TDMC_fnc_cleanbuggedmission;
				_terminated = true;
			};
			if (_terminated) exitWith
			{
				[["warning", "There are not enough safe positions for the boats to spawn"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
				_terminated = true;
			};
			_listsafeBoats = (TDMC_spawnpositionsSea select 0);
			_listsafeInf = (TDMC_spawnpositionsSea select 1);
		};		
		
	};
	
	if ((!isNil "_terminated") && _terminated) exitWith {};
	
	if ((toLower _mission != "defend")&&(toLower _mission != "destroy convoy") && (toLower _mission != "patrol from base") && (toLower _mission != "river patrol")) then
	{
		If (TDMC_MIS_enemycount > 0) then
		{
			//create enemies
			_debug = "enemy creation";
			_time = time + 10 + TDMC_MIS_enemycount;
			_enemy = [TDMC_enemytype,"TDMC_mkr_AO_1",[["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)], ["Naval",(_this select 10)]], _patradius, _skill, _listsafe, _listsafeinf, _listsafeBoats] execVM "scripts\TDMC\AI\TDMC_create_AO_patrols.sqf";
			waitUntil {(scriptDone _enemy)or(_time < time)};
		};
		
		if (_time < time) exitWith 
		{
			terminate _enemy;
			_terminated = true;
			[_debug, _player]call TDMC_fnc_cleanbuggedmission;
		};
		
		if (!isNil "_terminated" && _terminated) exitWith {};
	
		if (!(count _mkrarray < 3)&&((_enemyarray select 0) > 0)) then
		{
			_debug = "enemy house creation";
			_time = time + 20;
			_enemyhouse = [_mkr, _side, 8, 15, _mission] execVM "scripts\TDMC\AI\TDMC_create_AO_enemyhouse.sqf";

			waitUntil {(scriptDone _enemyhouse)or(_time < time)};
			
			if (_time < time) exitWith 
			{
				terminate _enemyhouse;
				_terminated = true;
				[_debug, _player]call TDMC_fnc_cleanbuggedmission;
			};
		};

	};
	
	if (toLower _mission == "river patrol") then
	{
		If (TDMC_MIS_enemycount > 0) then
		{
			//create enemies
			_debug = "enemy creation";
			_time = time + 10 + TDMC_MIS_enemycount;
			_enemy = [TDMC_enemytype,_mkrarray,[["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)], ["Naval",(_this select 10)]], _patradius, _skill, _listsafe, _listsafeinf, _listsafeBoats] execVM "scripts\TDMC\AI\TDMC_create_river_enemy.sqf";
			waitUntil {(scriptDone _enemy)or(_time < time)};
		};
		
		if (_time < time) exitWith 
		{
			terminate _enemy;
			_terminated = true;
			[_debug, _player]call TDMC_fnc_cleanbuggedmission;
		};
		
		if (!isNil "_terminated" && _terminated) exitWith {};
	};
	
	if (!isNil "_terminated" && _terminated) exitWith {};
	
	if !((toLower _mission) in ["ied defusal", "destroy convoy", "defend"]) then
	{
		// ambient IED	
		_iedarray = _this select 13;
		if (_iedarray select 0) then
		{
			_debug = "ied creation";
			_iedmin = _iedarray select 1;
			_iedmax = _iedarray select 2;
			_time = time + 10;
			_ied = [_mkr, _iedmin, _iedmax, TDMC_core, WEST] execVM "scripts\TOUR_IED\bombsCreateArea.sqf";
			waitUntil {(scriptDone _ied)or(_time < time)};
		};

		if (_time < time) exitWith 
		{
			terminate _ied;
			_terminated = true;
			[_debug, _player]call TDMC_fnc_cleanbuggedmission;
		};	
		
	};

	if (!isNil "_terminated" && _terminated) exitWith {};
	
	// create mission
	_debug = _mission + " mission creation";
	switch (_mission) do
	{
		case "patrol":
		{	
			_missionsetup = ["TDMC_mkr_AO_1", TDMC_playerside, _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\patrol\patrol_init.sqf";
		};
		case "patrol from base":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, false, [["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)]], _patradius, _skill] execVM "scripts\TDMC\missions\basePatrol\basePatrol_init.sqf";
		};
		case "ied defusal":
		{
			_missionsetup = ["TDMC_mkr_AO_1", TDMC_playerside, 1, (1 + (ceil (random 3))), _enemyarray, _player, true] execVM "scripts\TDMC\missions\ied\IED_init.sqf";
		};
		case "assassination":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _side, _player, _skill, _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\assassinate\assassinate_init.sqf";
		};
		case "clear ao":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _side, _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\clearao\clearao_init.sqf";
		};
		case "clear tunnels":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _side, _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\tunnels\tunnels_init.sqf";
		};
		case "bomb defusal":
		{
			_missionsetup = ["TDMC_mkr_AO_1", 2, (2 + (ceil (random 2))), _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\bombs\bomb_init.sqf";
		};
		case "attack":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\attack\attack_init.sqf";
		};
		case "defend":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, false, [["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)], ["naval",(_this select 10)]]] execVM "scripts\TDMC\missions\defend\defend_init.sqf";
		};
		case "scud hunt":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\scud\scud_init.sqf";
		};
		case "aa hunt":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\aa\aa_init.sqf";
		};
		case "arty hunt":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\arty\arty_init.sqf";
		};
		case "destroy convoy":
		{
			_missionsetup = [_mkrarray, _enemyarray, _player, false, [["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)]], _assignedroads, _skill] execVM "scripts\TDMC\missions\convoy\convoy_init.sqf";
		};
		case "mia":
		{	
			_missionsetup = ["TDMC_mkr_AO_1", _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\mia\mia_init.sqf";
		};
		case "weapons cache":
		{	
			_missionsetup = ["TDMC_mkr_AO_1", 2, (2 + (ceil (random 2))), _enemyarray, _player, (_iedarray select 0)] execVM "scripts\TDMC\missions\weapons\weapons_init.sqf";
		};
		case "river patrol":
		{
			_missionsetup = [_mkrarray, _enemyarray, _player, false, [["Infantry",(_this select 4)],["Motorized",(_this select 5)],["Mechanized",(_this select 6)],["Armored",(_this select 7)],["air_heli",(_this select 8)], ["air_plane",(_this select 9)], ["naval",(_this select 10)]], _skill] execVM "scripts\TDMC\missions\river\river_init.sqf";
		};
		case "rescue":
		{
			_missionsetup = ["TDMC_mkr_AO_1", _side, _enemyarray, (_iedarray select 0)] execVM "scripts\TDMC\missions\rescue\rescue_init.sqf";
		};
	};
	_time = time + 20;
	waitUntil {(scriptDone _missionsetup)or(_time < time)};

	if ((_time < time)or(!TDMC_mission_running)) exitWith 
	{
		sleep 2;
		terminate _missionsetup;
		_terminated = true;
		[_debug, _player]call TDMC_fnc_cleanbuggedmission;
	};	
	
	switch (_life) do
	{
		case 0: {TDMC_civSpawnGlobalEnable = false; TDMC_civSpawnGlobalAnimal = false; TDMC_civSpawnGlobalCivs = false;}; 	//none
		case 1: {TDMC_civSpawnGlobalEnable = true; TDMC_civSpawnGlobalAnimal = false; TDMC_civSpawnGlobalCivs = true;};		//civilians but not animals
		case 2: {TDMC_civSpawnGlobalEnable = true; TDMC_civSpawnGlobalAnimal = true; TDMC_civSpawnGlobalCivs = false;};		//not civilians but animals
		case 3: {TDMC_civSpawnGlobalEnable = true; TDMC_civSpawnGlobalAnimal = true; TDMC_civSpawnGlobalCivs = true;};		//civilians and animals
	};
	
};