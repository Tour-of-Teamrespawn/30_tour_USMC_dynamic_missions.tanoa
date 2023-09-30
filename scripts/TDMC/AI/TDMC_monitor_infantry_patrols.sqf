/*
	Ambient Enemy Patrol Script
	by Mr.Ben
	
	array passed:
	0 = faction, e.g. RU
	1 = side, e.g. EAST
	2 = area
	3 = max number of enemy

*/

if (!isServer) exitwith {};


TDMC_AI_AEP = true;
_AI_AEP_count = 0;
TDMC_AI_EOA_array = [];

private ["_side", "_faction", "_type_array", "_area", "_amount", "_AI_AEP_count"];

_area = _this select 2;
_amount = _this select 3;
call compile format ["TDMC_AI_AEP_count_%1 = 0;", _area];
TDMC_AI_AEP = true;
TDMC_AI_EOA_array = [];

while {TDMC_AI_AEP} do
{
	call compile format ["waitUntil {TDMC_AI_AEP_count_%1 < _amount};", _area];
	_type_array = call compile format ["TDMC_array_%1_infantry", TDMC_enemytype];
	_faction = TDMC_enemyType;
	call compile format ["TDMC_AI_AEP_count_%1 = TDMC_AI_AEP_count_%1 + 1;", _area];
	[TDMC_currentside, _faction, _type_array, _area] execVM "scripts\TDMC\AI\TDMC_create_infantry_patrols.sqf";
	sleep 5;
};