/*
	convoy Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = enemy array, array [1,4,7,3]
	2 = DMC player, obj
	3 = IED presence, boolean
	4 = Enemy array complete, [[string, quntity],[string, quntity],[string, quntity], ...]
	5 = Array of roads
	6 = skill level of enemy, int ( 0-1 )
*/

private ["_posarray", "_prob", "_string", "_iedbool", "_pos", "_mkr", "_mkrstart", "_mkrend", "_car_count", "_enemy", "_roads", "_mkrnames", "_array", "_time"];

_posarray = _this select 0;
_prob = _this select 1;
_player = _this select 2;
_iedbool = _this select 3;
_enemy = _this select 4;
_skill = _this select 5;

_mkrnames = [];
{
	_mkr = createMarkerLocal [format ["TDMC_river_marker_%1", _foreachindex + 1], _x];
	if ((_foreachindex + 1) == 1) then
	{
		_mkrstart = format ["TDMC_river_marker_%1", _foreachindex + 1];
		_mkr setMarkerTypeLocal "hd_start";
		_mkr setMarkerTextLocal "Patrol Start";
	}else
	{
		_mkrend = format ["TDMC_river_marker_%1", _foreachindex + 1];
		_mkr setMarkerTypeLocal "hd_End";
		_mkr setMarkerTextLocal "Patrol Destination";
		if (_forEachindex > 1) then
		{
			(format ["TDMC_river_marker_%1", _forEachindex]) setMarkerTypeLocal "Waypoint";
			(format ["TDMC_river_marker_%1", _forEachindex]) setMarkerTextLocal "";
		};
	};
	_mkr setMarkerColorLocal "ColorGreen";
	_mkr setMarkerDirLocal 0;
	_mkrnames set [count _mkrnames, (format ["TDMC_river_marker_%1", _foreachindex + 1])];
}forEach _posarray;

{
	_mkr = _x;
	TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, [_mkr, getMarkerType _mkr, getMarkerColor _mkr, markerDir _mkr, MarkerText _mkr, getMarkerPos _mkr, markerSize _mkr, markerShape _mkr, markerBrush _mkr]];	
}forEach _mkrnames;

_string = (_prob + [_iedbool]) call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";

["TDMC_tsk_river", {"Patrol River"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_river"", {""Patrol along the designated route from <marker name=""""%1"""">start</marker> to <marker name=""""%2"""">finish</marker>, hitting all %5 waypoints in order to complete the task.<br/><br/>Be on the lookout for %4.<br/><br/>Waypoints Remaining: %5<br/><br/>%3""}, {""Patrol River""}, {""Patrol River""}] call A2S_setSimpleTaskDescription;", _mkrstart, _mkrend, _string, (TDMC_enemyType call TDMC_fnc_factionToText), count _posarray];
"TDMC_tsk_river" call A2S_taskCommit;
"TDMC_tsk_river" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_river";
TDMC_mission_running = true;
_array = [];


//_array = [_enemy, _posarray, _roads, _skill] call TDMC_fnc_convoyAI;
_time = time + 5;

//waitUntil {(count _array > 0) or (_time < time)};
if (_time < time) then
{
	sleep 20;
}else
{
	[_posarray, [_mkrstart, _mkrend, _string, (TDMC_enemyType call TDMC_fnc_factionToText)]] execVM "scripts\TDMC\missions\river\rivercheck.sqf";
};
