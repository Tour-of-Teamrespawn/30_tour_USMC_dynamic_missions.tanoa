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
_roads = _this select 5;
_skill = _this select 6;

_mkrnames = [];
{
	_mkr = createMarkerLocal [format ["TDMC_convoy_marker_%1", _foreachindex + 1], _x];
	if ((_foreachindex + 1) == 1) then
	{
		_mkrstart = format ["TDMC_convoy_marker_%1", _foreachindex + 1];
		_mkr setMarkerTypeLocal "hd_start";
		_mkr setMarkerTextLocal "Convoy Start";
	}else
	{
		_mkrend = format ["TDMC_convoy_marker_%1", _foreachindex + 1];
		_mkr setMarkerTypeLocal "hd_End";
		_mkr setMarkerTextLocal "Convoy Destination";
		if (_forEachindex > 1) then
		{
			(format ["TDMC_convoy_marker_%1", _forEachindex]) setMarkerTypeLocal "Waypoint";
			(format ["TDMC_convoy_marker_%1", _forEachindex]) setMarkerTextLocal "";
		};
	};
	_mkr setMarkerColorLocal "ColorRed";
	_mkr setMarkerDirLocal 0;
	_mkrnames set [count _mkrnames, (format ["TDMC_convoy_marker_%1", _foreachindex + 1])];
}forEach _posarray;

{
	_mkr = _x;
	TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, [_mkr, getMarkerType _mkr, getMarkerColor _mkr, markerDir _mkr, MarkerText _mkr, getMarkerPos _mkr, markerSize _mkr, markerShape _mkr, markerBrush _mkr]];	
}forEach _mkrnames;

_string = (_prob + [_iedbool]) call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";

_car_count = 0;
{
	_car_count = _car_count + _x;
	_prob set [_forEachIndex, (_x * 2)];
}forEach _prob;

if (_car_count > 6) then
{
	_car_count = round (_car_count * (0.75 + (random 0.5)));
};

["TDMC_tsk_convoy", {"Destroy Convoy"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_convoy"", {""Destroy the %5 convoy, which is starting from <marker name=""""%1"""">this location</marker> before it arrives at its <marker name=""""%2"""">destination</marker>, in order to complete the task.<br/><br/>Intel suggests the convoy to be around %4 vehicles, and will be setting off in around 30 minutes.<br/><br/>%3""}, {""Destroy Convoy""}, {""Destroy Convoy""}] call A2S_setSimpleTaskDescription;", _mkrstart, _mkrend, _string, _car_count, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_convoy" call A2S_taskCommit;
"TDMC_tsk_convoy" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_convoy";
TDMC_mission_running = true;
_array = [];
_array = [_enemy, _posarray, _roads, _skill] call TDMC_fnc_convoyAI;
_time = time + 5;

waitUntil {(count _array > 0) or (_time < time)};
if (_time < time) then
{
	sleep 20;
}else
{
	_array execVM "scripts\TDMC\missions\convoy\convoycheck.sqf";
};
