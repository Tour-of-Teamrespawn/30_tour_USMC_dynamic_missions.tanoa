waitUntil {!isNil "BIS_fnc_init"};

// All machine variables

TDMC_core = _this select 0;
TDMC_playerside = (_this select 1) select 0;
TDMC_playerfaction = (_this select 1) select 1;
TDMC_currentside = (_this select 2) select 0;
TDMC_enemytype = (_this select 2) select 1;
TDMC_friendlybase = (_this select 3);
TDMC_missionobject = (_this select 4);
TDMC_mission_officer = (_this select 4);
TDMC_HQ = TDMC_mission_officer;
TDMC_HQ setGroupID ["HQ"];
TDMC_safeDistance = (_this select 5);

_d = [] execVM "scripts\TDMC\interface\init.sqf";
//waitUntil {scriptDone _d};

if (isServer) then
{
	createCenter WEST; WEST setFriend [EAST, 0]; WEST setFriend [RESISTANCE, 0]; WEST setFriend [CIVILIAN, 1];
	createCenter EAST; EAST setFriend [WEST, 0]; EAST setFriend [RESISTANCE, 0]; EAST setFriend [CIVILIAN, 1];
	createCenter RESISTANCE; RESISTANCE setFriend [WEST, 0]; RESISTANCE setFriend [EAST, 0]; RESISTANCE setFriend [CIVILIAN, 1];
	createCenter CIVILIAN; CIVILIAN setFriend [WEST, 1]; CIVILIAN setFriend [EAST, 1]; CIVILIAN setFriend [RESISTANCE, 1];
	SIDELOGIC setFriend [WEST, 1]; SIDELOGIC setFriend [EAST, 1]; SIDELOGIC setFriend [RESISTANCE, 1];
	
	//server variables
	TDMC_mission_complete = false;
	TDMC_mission_running = false;
	TDMC_mission_objects = [];
	TDMC_mission_units = [];
	TDMC_mission_groups = [];
	TDMC_current_mission = "";
	TDMC_missionSkill = 1;
	
	//AI Skill Levels
	TDMC_SniperAccuracy = 0.4;
	TDMC_SpecopsAccuracy = 0.30;
	TDMC_GeneralAccuracy = 0.225;
	TDMC_SpecopsGeneralMul = 1.2;
	TDMC_missionskill = 1;
	TDMC_skillArray = [["aimingShake",0.3],["aimingSpeed",0.35],["commanding",0.85],["courage",0.75],["reloadSpeed",1],["spotDistance",0.6],["spotTime",0.65],["aimingAccuracy", TDMC_GeneralAccuracy],["general", TDMC_missionSkill]];
	
	//set anmbient life on at the start and allow civs only
	TDMC_civSpawnGlobalEnable = true;
	TDMC_civSpawnGlobalAnimal = false;
	TDMC_civSpawnGlobalCivs = true;
	
	//array of markers that will beed to sent to players. On recieving them, they will create the markers (covers JIP with PV)
	TDMC_PV_JIPmarkers = [];

	execVM "scripts\TDMC\misc\TDMC_garbageloop.sqf";
	
	// max global count of civilian AI on map = 24, civs = 5 per 1km2 / animals = 3 per 1km2 if there are no civs, else 5
	[24, 5, 3] execVM "scripts\TDMC\ambientLife\init.sqf";
};

_a = execVM "scripts\TDMC\arrays\arrays_init.sqf";
waitUntil {scriptDone _a};

_f = execVM "scripts\TDMC\functions\functions_init.sqf";
waitUntil {scriptDone _f};

if (isMultiplayer) then 
{
	//ACRE
	if (isClass(configFile>>"CfgPatches">>"acre_main")) then {TDMC_mod_ACRE = true;};
}else
{
	//ACRE override for SP
	TDMC_ACRE = nil;	
};

//AEGIS
if (isClass(configFile>>"CfgPatches">>"A3_Aegis_Characters_F_Aegis")) then {TDMC_mod_AEGIS = true;};
//UK3CB
if (isClass(configFile>>"CfgPatches">>"UK3CB_Factions_Common")) then {TDMC_mod_3UKCB_factions = true;};
//UK3CB
if (isClass(configFile>>"CfgPatches">>"UK3CB_BAF_Units_Common")) then {TDMC_mod_3UKCB_BAF = true;};
//UK3CB
if (isClass(configFile>>"CfgPatches">>"rhsgref_main")) then {TDMC_mod_RHS = true;};
//ACE
if (isClass(configFile>>"CfgPatches">>"ace_common")) then {TDMC_mod_ACE = true;};
//ACE Medical
if (isClass(configFile>>"CfgPatches">>"ace_medical")) then {TDMC_mod_ACEMED = true;};

//addEventHandler for JIP

"TDMC_PV_JIPmarkers" addPublicVariableEventHandler 
{
	if ((count TDMC_PV_JIPmarkers) > 0) then
	{
		TDMC_PV_JIPmarkers call TDMC_fnc_PV_markercode;
	};
};

"TDMC_enemyType" addPublicVariableEventHandler 
{

	TDMC_enemyType call TDMC_fnc_diaryEnemy;
};

[]spawn 
{
	waitUntil {!isNil "TDMC_PV_JIPmarkers"};
	TDMC_PV_JIPmarkers call TDMC_fnc_PV_markercode;
};

[]spawn 
{
	waitUntil {!isNil "TDMC_enemyType"};
	TDMC_enemyType call TDMC_fnc_diaryEnemy;
};

if (isServer) then 
{
	//create ambient vehicles driving through the map and patrols
	if (toLower worldName == "tanoa") then
	{
		[TDMC_enemytype, TDMC_currentside, "island1", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
		[TDMC_enemytype, TDMC_currentside, "island1", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
		[TDMC_enemytype, TDMC_currentside, "island2", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
		[TDMC_enemytype, TDMC_currentside, "island2", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
		[TDMC_enemytype, TDMC_currentside, "island3", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
		[TDMC_enemytype, TDMC_currentside, "island3", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
		[TDMC_enemytype, TDMC_currentside, "island4", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
		[TDMC_enemytype, TDMC_currentside, "island4", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
		[TDMC_enemytype, TDMC_currentside, "island5", 2, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
		[TDMC_enemytype, TDMC_currentside, "island5", 2] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
	}else
	{
		if (toLower worldName == "altis") then
		{
			[TDMC_enemytype, TDMC_currentside, "island1", 3, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
			[TDMC_enemytype, TDMC_currentside, "island1", 2] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
			[TDMC_enemytype, TDMC_currentside, "island2", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
			[TDMC_enemytype, TDMC_currentside, "island2", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
			[TDMC_enemytype, TDMC_currentside, "island3", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
			[TDMC_enemytype, TDMC_currentside, "island3", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
			[TDMC_enemytype, TDMC_currentside, "island4", 1, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";
			[TDMC_enemytype, TDMC_currentside, "island4", 1] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";
		}else
		{
			[TDMC_enemytype, TDMC_currentside, "map", 7, 7] execVM "scripts\TDMC\AI\TDMC_monitor_driving_vehicles.sqf";

			[TDMC_enemytype, TDMC_currentside, "map", 5] execVM "scripts\TDMC\AI\TDMC_monitor_infantry_patrols.sqf";		
		};
	};
	//create IED's across the map
	//[TDMC_centreofmap, 10000, 5, 5, TDMC_core, TDMC_playerside, false] execVM "scripts\TOUR_IED\bombsCreateArea.sqf";

};