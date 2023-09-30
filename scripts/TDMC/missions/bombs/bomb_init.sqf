/*
	Bomb Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = side that will be patroling e.g. WEST
	2 = max number of IEDs
	3 = min number of IEDs
	4 = probability of enemies
*/



private ["_mkrQ", "_bombs", "_mkr", "_side", "_max", "_min", "_width", "_height", "_diameter", "_s", "_prob", "_string", "_iedbool", "_oilhouses", "_buildingsnew", "_buildings", "_positions", "_posarray", "_time"];

_mkr = _this select 0;
_max = _this select 2;
_min = _this select 1;
_prob = _this select 3;
_player = _this select 4;
_iedbool = _this select 5;
_abort = false;

_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

if (_height > _width) then
{
	_diameter = _height;
}else
{
	_diameter = _width;
};

TOUR_bomb_array = [];

_buildings = [];

{
	if ((getPosATL _x) inArea _mkr) then 
	{
		_buildings set [count _buildings, _x];
	};
}forEach (nearestobjects [getMarkerPos _mkr, ["Building", "House"],_diameter]);

/*
_oilhouses =  nearestobjects [getMarkerPos _mkr, ["HOUSE", "BUILDING"],_diameter];
_oilhousesnew = [];
{
	if ((getPosATL _x) inArea _mkr) then 
	{
		_oilhousesnew set [count _oilhousesnew, _x];
	};
}forEach _oilhouses;
*/

_posarray = [];

{
	_test = 0;
	while { format ["%1", _x buildingPos _test] != "[0,0,0]" } do {_posarray set [count _posarray, _x buildingPos _test]; _test = _test + 1;};
}forEach _buildings;

sleep 1;

if (count _posarray >= _max) then
{
	_time = time + 10;
	_bombs = [_posarray, _min, _max] execVM "scripts\TOUR_explosives\bombsCreate.sqf";
	waitUntil {(scriptDone _bombs)or(_time < time)};
	if (_time < time) then
	{
		_abort = true;
	};
}else
{
	_abort = true;
};

if (_abort or (count TDMC_bomb_array == 0)) exitWith
{
	[["warning", "There are not enough buildings to create this mission!"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
	sleep 1;
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;
};

{
	_mkrQ = createMarkerLocal [format ["TDMC_bomb_question_%1", _forEachIndex], (_x getpos [40, (random 360)])];
	_mkrQ setmarkerTypeLocal "hd_unknown";
	_mkrQ setMarkerColorLocal "ColorRed";

	TDMC_PV_JIPmarkers set [count TDMC_PV_JIPmarkers, [(format ["TDMC_bomb_question_", _forEachIndex]), getMarkerType _mkrQ, getMarkerColor _mkrQ, markerDir _mkrQ, MarkerText _mkrQ, getMarkerPos _mkrQ, markerSize _mkrQ, markerShape _mkrQ, markerBrush _mkrQ]];

}forEach TDMC_bomb_array;

publicVariable "TDMC_PV_JIPmarkers";

TDMC_bombs_detonated = false;
sleep 1;

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
TDMC_current_mission = "TDMC_tsk_bombs";
["TDMC_tsk_bombs", {"Defuse Bombs"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_bombs"", {""%5 forces have planted %3 bombs in this <marker name=""""%1"""">area</marker>. Defuse the %3 bombs before they are detonated.<br/><br/>Intel indicates there has been high enemy activity around these <marker name=""""%4"""">buildings</marker>.<br/><br/>%2""}, {""Defuse Bombs""}, {""Defuse Bombs""}] call A2S_setSimpleTaskDescription;", _mkr, _string, (count TDMC_bomb_array), _mkrQ, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_bombs" call A2S_taskCommit;
"TDMC_tsk_bombs" call A2S_taskHint;

TDMC_mission_running = true;
execVM "scripts\TDMC\missions\bombs\bombcheck.sqf";