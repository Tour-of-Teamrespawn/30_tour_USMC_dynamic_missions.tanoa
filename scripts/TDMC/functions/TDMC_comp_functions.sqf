/*
All functions used in  Outlanders compositions for TDMC.
*/


TDMC_fnc_comp_objectMapper = compile (preprocessFileLineNumbers "scripts\TDMC\functions\TDMC_objectMapper.sqf");

//////////////////////////
//Modular Camp Functions//
//////////////////////////

TDMC_fnc_comp_mod_compileCamp = compile (preprocessFileLineNumbers "scripts\TDMC\functions\modularCamp\mod_compileCamp.sqf");
TDMC_fnc_comp_mod_createCircularCamp = compile (preprocessFileLineNumbers "scripts\TDMC\functions\modularCamp\mod_createCircle.sqf");
TDMC_fnc_comp_mod_createGarrison = compile (preprocessFileLineNumbers "scripts\TDMC\functions\modularCamp\mod_createGarrison.sqf");
TDMC_fnc_comp_mod_createTasks = compile (preprocessFileLineNumbers "scripts\TDMC\functions\modularCamp\mod_createTasks.sqf");
TDMC_fnc_comp_mod_position = compile (preprocessFileLineNumbers "scripts\TDMC\functions\modularCamp\mod_findPos.sqf");

///////////////////////
//Scud Camp Functions//
///////////////////////
TDMC_fnc_comp_scud_guards = compile (preprocessFileLineNumbers "scripts\TDMC\functions\scudCamp\scudCamp_guards.sqf");
TDMC_fnc_comp_scud_spawn = compile (preprocessFileLineNumbers "scripts\TDMC\functions\scudCamp\scudCamp_spawn.sqf");

TDMC_fnc_comp_arty_guards = compile (preprocessFileLineNumbers "scripts\TDMC\functions\artyCamp\artyCamp_guards.sqf");
TDMC_fnc_comp_arty_spawn = compile (preprocessFileLineNumbers "scripts\TDMC\functions\artyCamp\artyCamp_spawn.sqf");

/////////////////////
//Related Functions//
/////////////////////

NEO_fnc_findSafePos = compile (preprocessFileLineNumbers "scripts\TDMC\functions\fn_findSafePositions.sqf");