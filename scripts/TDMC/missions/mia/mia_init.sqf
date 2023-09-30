/*
	MIA Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
*/

private ["_mkr", "_side", "_pos", "_dirmkr", "_prob", "_string", "_iedbool", "_positions", "_array_type", "_grp", "_names", "_unit", "_rank"];

_mkr = _this select 0;
_prob = _this select 1;
_iedbool = _this select 2;
_positions = (TDMC_spawnpositions select 0) + (TDMC_spawnpositions select 1);
_pos = _positions call BIS_fnc_selectRandom;
_array_type = call compile format ["TDMC_array_%1_units", TDMC_playerfaction];
_grp = createGroup TDMC_playerside;

TDMC_mission_groups set [count TDMC_mission_groups, _grp];
_names = [];
_units = [];
_soldier1 = "";
_soldier2 = "";
_soldier3 = "";
_soldier4 = "";


for "_i" from 1 to (2 +(ceil (random 2))) do
{
	_unit = _grp createUnit [(_array_type call BIS_fnc_selectRandom), _pos, [], (ceil (random 360)), "NONE"];
	_p2 = ([_pos, (5 + (ceil (random 10))), ceil (random 360)] call BIS_fnc_relPos);
	_unit setPosATL [_p2 select 0, _p2 select 1, 0];
	_unit call TDMC_fnc_loadouts;
	TDMC_mission_objects set [count TDMC_mission_objects, _unit];
	waitUntil {(name _unit) != ""};
	_names set [count _names, (name _unit)];
	_units set [count _units, _unit];
	_rank = switch (rankID _unit) do
	{
		case 0:		{"Pvt"};
		case 1:		{"Cpl"};
		case 2:		{"Sgt"};
		case 3:		{"Lt"};
		case 4:		{"Cpt"};
		case 5:		{"Mjr"};
		case 6:		{"Cnl"};
	};
	call compile format ["_soldier%1 = ""%2%5 %3%4"";", _i, "<br /> - ", (name _unit) ,"<br />", _rank]; 
};

{
	_x setDamage 1;
}forEach units _grp;

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";
sleep 1;

["TDMC_tsk_mia", {"Find Missing Soldiers"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_mia"", {""%8 forces have increased their military presence within the area. Patrol through the <marker name=""""%1"""">area</marker>, and find %3 soldiers, who are currently MIA, presumed dead. Return them, or their bodies and dogtags to base, in order to complete the task.<br /><br />SOLDIERS:<br />%4 %5 %6 %7<br/><br/>%2""}, {""Find Missing Soldiers""}, {""Find Missing Soldiers""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (count TDMC_mission_objects), _soldier1, _soldier2, _soldier3, _soldier4, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_mia" call A2S_taskCommit;
"TDMC_tsk_mia" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_mia";

sleep 3;

TDMC_mission_running = true;
_units execVM "scripts\TDMC\missions\mia\miacheck.sqf";
