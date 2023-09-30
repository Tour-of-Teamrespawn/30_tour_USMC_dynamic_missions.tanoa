/*
	Scud Hunt Mission Script
	by Mr.Ben
	
	Params passed to script:
	0 = marker name of AO, string e.g. "mymarkername"
	1 = enemy array, array [1,4,7,3]
	2 = DMC player, obj
	3 = IED presence, boolean
*/

private ["_mkr", "_dirmkr", "_prob", "_string", "_iedbool", "_width", "_height", "_storedpos", "_pos", "_text1", "_scudcount", "_safepos", "_diameter", "_scud", "_positions"];

_mkr = _this select 0;
_prob = _this select 1;
_player = _this select 2;
_iedbool = _this select 3;

_width = (getMarkerSize _mkr select 1);
_height = (getMarkerSize _mkr select 0);

if (_height > _width) then
{
	_diameter = _height;
}else
{
	_diameter = _width;
};

if ((_height * _width) <= 250000) then 
{
	_scudcount = 1;
};
if ((_height * _width) > 250000) then 
{
	_scudcount = 2;
};
if ((_height * _width) > 1000000) then 
{
	_scudcount = 3;
};

private ["_worldarea"];

_worldarea = createMarkerLocal ["TDMC_worldareamarker", [(worldSize / 2), (worldSize / 2), 0]];
_worldarea setMarkerShapeLocal "RECTANGLE";
_worldarea setMarkerSizeLocal [(worldSize / 2), (worldSize / 2)];

_positions = [];
_time = time + 3;
while {time < _time} do
{
	_pos = [getMarkerPos _mkr, 0, _diameter, 30, 0, 0.25, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos; 
	
	if ((str _pos != "[0,0,0]") && (_pos distance (getMarkerPos TDMC_friendlybase) > TDMC_safeDistance) && ((count (_pos nearRoads 30)) == 0) && (_pos inArea _worldarea) && (_pos inArea _mkr)) then 
	{
		_positions set [count _positions, [_pos select 0, _pos select 1, 0]];
	};
};
deleteMarkerLocal _worldarea;

if (count _positions < _scudcount) exitWith
{
	[["warning", "There are not enough suitable positions in the AO, for this mission"], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];
	sleep 1;
	[]call TDMC_fnc_PV_markerremove;
	[]call TDMC_fnc_clearenemies;
	_pos = [0,0,0];
	_pos
};

_scudlaunchers = [];
for "_a" from 1 to _scudcount do
{
	if ((count _positions) == 0) exitWith {};
	_pos = _positions call BIS_fnc_selectRandom;
	_positions = _positions - [_pos];
	_scud = [_pos, (1 + (round random 3))] call TDMC_fnc_scudcamp;
	_scudlaunchers set [count _scudlaunchers, _scud];
};

_prob set [count _prob, _iedbool];
_string = _prob call TDMC_fnc_probstring;
publicVariable "TDMC_PV_JIPmarkers";

if (count _scudlaunchers > 1) then
{
	_text1 = format ["%1 scud launchers", count _scudlaunchers];
}else
{
	_text1 = format ["a scud launcher", count _scudlaunchers];
};

["TDMC_tsk_scud", {"Destroy Scud Launchers"}] call A2S_createSimpleTask; 
call compile format ["[""TDMC_tsk_scud"", {""%4 forces have been deploying scud missiles within the AO. Destroy %3, located somewhere within the <marker name=""""%1"""">area</marker>, in order to complete the task.<br/><br/>%2""}, {""Destroy Scud Launchers""}, {""Destroy Scud Launchers""}] call A2S_setSimpleTaskDescription;", _mkr, _string, _text1, (TDMC_enemyType call TDMC_fnc_factionToText)];
"TDMC_tsk_scud" call A2S_taskCommit;
"TDMC_tsk_scud" call A2S_taskhint;

TDMC_current_mission = "TDMC_tsk_scud";
sleep 1;
TDMC_mission_running = true;
_scudlaunchers execVM "scripts\TDMC\missions\scud\scudcheck.sqf";