/*
	Ambient Moving Vehicle Script
	by Mr.Ben
	
	array passed to script:
	0 = faction, e.g. BIS_TK
	1 = side, e.g. EAST
	2 = area e.g. "map" or "island2"
	3 = number of max vehicles e.g. 3
	4 = chance of enemy, integer as %, e.g 35 = 35%
*/

if (!isServer) exitwith {};

private ["_side", "_faction", "_type_array", "_chance", "_area", "_car_count"];


_faction = _this select 0;
_side = _this select 1;
_area = _this select 2;
_amount = _this select 3;
_chance = _this select 4;
call compile format ["TDMC_AI_car_count_%1 = 0;", _area];

sleep 10;

while {true} do
{
	call compile format ["waitUntil {TDMC_AI_car_count_%1 < _amount};", _area];
	_type_array =  call compile format ["TDMC_array_%1_cars + TDMC_array_%1_APCs + TDMC_array_%1_Tanks", TDMC_enemytype];
	call compile format ["TDMC_AI_car_count_%1 = TDMC_AI_car_count_%1 + 1;", _area];
	[_type_array, TDMC_currentside, _chance, TDMC_enemytype, _area] execVM "scripts\TDMC\AI\TDMC_create_driving_vehicles.sqf";
	sleep 5;
};