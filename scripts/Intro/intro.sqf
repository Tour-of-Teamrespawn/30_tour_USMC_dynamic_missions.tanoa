/*
Description: Start an intro using BIS default functions

e.g. Create those lovely UAV style intro's with optional video

Author: Mr.Ben
Tour of Teamrespawn
*/

private ["_video", "_colour"];

TOUR_intro_namefix = compileFinal preProcessFileLineNumbers "scripts\intro\fn_fixgroupname.sqf";

if ((_this select 0) != "") then
{
	_video = _this select 0;
}else
{
	_video = "";
};

_targetmarker = _this select 1;
_sitrep = _this select 2;
_altitude = _this select 3;
_radius = _this select 4;
_degrees = _this select 5;
_direction = _this select 6;
_iconarraystr = _this select 7;

if (_video != "") then
{
	scriptName "initMission.hpp: mission start";
	[_video, ""] spawn BIS_fnc_titlecard;	
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
};

//waitUntil {TOUR_RC_init_ran};
_iconarray = call compile _iconarraystr;

{
	_array = _x;
	_colour = (_array select 1) call BIS_fnc_sideColor;
	_colour set [3, 0.73];
	_array set [1, _colour];
	_stringname = [_array select 6] call TOUR_intro_namefix;
	_array set [6, _stringname];
	_iconarray set [_forEachIndex, _array];
}forEach _iconarray;

_e = [
	_targetmarker,
	_sitrep,
	_altitude,
	_radius,
	_degrees,
	_direction,
	_iconarray
] spawn BIS_fnc_establishingShot;

waitUntil {scriptDone _e};

