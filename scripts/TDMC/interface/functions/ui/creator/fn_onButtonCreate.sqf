private 
[
	"_display", "_map", "_buttonEnd", "_buttonCreate", "_textHelp", "_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius", "_sliderBoats",
	"_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius", "_sliderInfantry", "_sliderCars", "_sliderMechanized", 
	"_sliderArmored", "_sliderChoppers", "_sliderPlanes", "_comboIed", "_sliderIed_0", "_sliderIed_1", "_comboTimeOfDay", "_comboWeather", 
	"_comboEffects", "_comboCivs", "_sliderMarkerX", "_sliderMarkerY", "_sliderMarkerAngle", "_comboMarkerShape", "_mkr", "_mkrnumber", "_convoy_markers", "_loc", "_terminated", "_river_markers", "_boats"
];
_display = findDisplay 121200;
_map = _display displayCtrl 121201;
_buttonEnd = _display displayCtrl 121202;
_buttonCreate = _display displayCtrl 121203;
_textHelp = _display displayCtrl 121204;
_comboMission = _display displayCtrl 121205;
_comboSide = _display displayCtrl 121206;
_comboFaction = _display displayCtrl 121207;
_sliderSkill = _display displayCtrl 121208;
_sliderRadius = _display displayCtrl 121209;
_sliderInfantry = _display displayCtrl 121210;
_sliderCars = _display displayCtrl 121211;
_sliderMechanized = _display displayCtrl 121212;
_sliderArmored = _display displayCtrl 121213;
_sliderChoppers = _display displayCtrl 121214;
_sliderPlanes = _display displayCtrl 121215;
_sliderBoats = _display displayCtrl 121228;
_comboIed = _display displayCtrl 121216;
_sliderIed_0 = _display displayCtrl 121217;
_sliderIed_1 = _display displayCtrl 121218;
_comboTimeOfDay = _display displayCtrl 121219;
_comboWeather = _display displayCtrl 121220;
_comboEffects = _display displayCtrl 121221;
_comboCivs = _display displayCtrl 121222;
_sliderMarkerX = _display displayCtrl 121223;
_sliderMarkerY = _display displayCtrl 121224;
_sliderMarkerAngle = _display displayCtrl 121225;
_comboMarkerShape = _display displayCtrl 121226;

if (!isNil {uinamespace getVariable "TDMC_dlg_dmcMarker"}) then
{
	_mkr = uinamespace getVariable "TDMC_dlg_dmcMarker";
};
private 
[
	"_pos", "_mission", "_side", "_faction", "_skill", "_radius", "_infantry", "_motorized", "_mechanized", "_armored", "_choppers", "_planes", 
	"_ied", "_iedMin", "_iedMax", "_timeOfDay", "_weather", "_fog", "_life", "_markerX", "_markerY", "_markerAngle", "_markerShape", "_halopos"
];
_pos = getMarkerPos _mkr;
_mission = toLower (_comboMission lbText (lbCurSel _comboMission));
_side = toLower (_comboSide lbText (lbCurSel _comboSide));
_faction = toLower (_comboFaction lbText (lbCurSel _comboFaction));
_skill = sliderPosition _sliderSkill;
_radius = round sliderPosition _sliderRadius;
_infantry = round sliderPosition _sliderInfantry;
_motorized = round sliderPosition _sliderCars;
_mechanized = round sliderPosition _sliderMechanized;
_armored = round sliderPosition _sliderArmored;
_choppers = round sliderPosition _sliderChoppers;
_planes = round sliderPosition _sliderPlanes;
_boats = round sliderPosition _sliderBoats;
_ied = toLower (_comboIed lbText (lbCurSel _comboIed));
_iedMin = round sliderPosition _sliderIed_0;
_iedMax = round sliderPosition _sliderIed_1;
_timeOfDay = toLower (_comboTimeOfDay lbText (lbCurSel _comboTimeOfDay));
_weather = toLower (_comboWeather lbText (lbCurSel _comboWeather));
_fog = toLower (_comboEffects lbText (lbCurSel _comboEffects));
_life = toLower (_comboCivs lbText (lbCurSel _comboCivs));
_markerX = round sliderPosition _sliderMarkerX;
_markerY = round sliderPosition _sliderMarkerY;
_markerAngle = round sliderPosition _sliderMarkerAngle;
_markerShape = toLower (_comboMarkerShape lbText (lbCurSel _comboMarkerShape));

if ((toLower _mission == "rescue") && ((isNil "TDMC_captiveUnit")or (!(isNil "TDMC_captiveUnit")&&(isNull TDMC_captiveUnit)))) exitWith {hint "You need someone to play the captive roll!"};

if
(
	count _pos < 1
	||
	_mission == ""
	||
	_side == ""
	||
	_faction == ""
	||
	_ied == ""
	||
	_timeOfDay == ""
	||
	_weather == ""
	||
	_effects == ""
	||
	_life == ""
	||
	!((toLower _mission == "destroy convoy")&&(isNil { uinamespace getVariable "TDMC_dlg_dmcMarkerCreated" }))
) exitWith 
{
	[["warning", "There are parameters missing that need to be filled..."], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", player];
};

if (toLower _mission == "destroy convoy") then
{
	_mkrnumber = 1;
	_convoy_markers = [];
	while {true} do
	{
		if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
		{
		
		};
		_convoy_markers set [count _convoy_markers, (getMarkerPos (format ["TDMC_convoy_marker_%1", _mkrnumber]))];
		_mkrnumber = _mkrnumber + 1;
	};
	{
		if ((_x distance ((getMarkerPos TDMC_friendlybase))) < TDMC_safeDistance) exitWith 
		{
			_terminated = true;
		};
	}forEach _convoy_markers;
};

if (toLower _mission == "river patrol") then
{
	_mkrnumber = 1;
	_river_markers = [];
	while {true} do
	{
		if (str (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
		{
		
		};
		_river_markers set [count _river_markers, (getMarkerPos (format ["TDMC_river_marker_%1", _mkrnumber]))];
		_mkrnumber = _mkrnumber + 1;
	};
	{
		if ((_x distance ((getMarkerPos TDMC_friendlybase))) < TDMC_safeDistance) exitWith 
		{
			_terminated = true;
		};
	}forEach _river_markers;
};

if (_terminated) exitWith {[["warning", (format ["Your one or more of your mission waypoints is within %1m of the base! Create your convoy route further away.", TDMC_safeDistance])], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", player]};


_halopos = [0,0,0];
if (str (getMarkerPos "TDMC_dlg_creator_haloMarker") != "[0,0,0]") then
{
	_halopos = getMarkerPos "TDMC_dlg_creator_haloMarker";
	deleteMarkerLocal "TDMC_dlg_creator_haloMarker";
};

_terminated = false;
if (!(toLower _mission in ["destroy convoy", "defend", "patrol from base", "river patrol"])&&((str (getMarkerPos _mkr)) != "[0,0,0]")) then
{
	_loc = (getMarkerPos TDMC_friendlybase) getpos [TDMC_safeDistance, ((getMarkerPos TDMC_friendlybase) getDir (getMarkerPos _mkr))];
	if ((_loc inArea _mkr) or (((getMarkerPos _mkr) distance ((getMarkerPos TDMC_friendlybase))) < TDMC_safeDistance)) then 
	{
		_terminated = true;
	};
};

if (_terminated) exitWith {[["warning", (format ["Your mission AO is within %1m of the base! Create mission AO further away.", TDMC_safeDistance])], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", player]};

//Time of day
if (toLower _timeOfDay != "no change") then
{
	private ["_oldDate", "_year", "_month", "_day", "_hour", "_minute", "_date"];
	_oldDate = date;
	_year = _oldDate select 0;
	_month = _oldDate select 1;
	_day = _oldDate select 2;
	_hour = _oldDate select 3;
	_minute = _oldDate select 4;
	_date = switch (toLower _timeOfDay) do
	{
		case "morning" : { [_year, _month, _day, if (toLower worldName == "enoch") then {7}else{5}, 0] };
		case "afternoon" : { [_year, _month, _day, 12, 0] };
		case "evening" : { [_year, _month, _day, if (toLower worldName == "enoch") then {15}else{18}, 0] };
		case "night full moon" : { [_year, _month, _day, 0, 0] };
		case "night half moon" : { [_year, _month, (_day + 5), 0, 0] };
	};
	//setDate _date;
	[_date, {setDate _this}] remoteExec ["BIS_fnc_call", TDMC_core];
};

private ["_aar", "_viewDistance", "_overcast", "_rain", "_change", "_public"];
_aar = TDMC_dlg_array select 0;
_viewDistance = TDMC_dlg_array select 1;
_overcast = ((TDMC_dlg_array select 2) select 0);
_rain = ((TDMC_dlg_array select 2) select 1);
_change = ((TDMC_dlg_array select 2) select 2);
_public = false;

//Weather
if (toLower _weather != "no change") then
{
	private ["_overcast", "_rain"];
	_overcast = switch (toLower _weather) do
	{
		case "clear sky" : { 0 };
		case "cloudy" : { 0.5 };
		case "rain" : { 0.5 };
		case "storm and rain" : { 1 };
	};
	_rain = switch (toLower _weather) do
	{
		case "clear sky" : { 0 };
		case "cloudy" : { 0.5 };
		case "rain" : { 0.5 };
		case "storm and rain" : { 1 };
	};
	
	//Set Weather for current connected machines
	[_overcast, {30 setOvercast _this; 30 setRain _this}] remoteExec ["BIS_fnc_call", TDMC_core];
	
	//Update Array
	TDMC_dlg_array = [_aar, _viewDistance, [_overcast, _rain, _change]];
	
	_public = true;
};

//Effects
if (toLower _fog != "no change") then
{
	private ["_change", "_array"];
	_change = switch (toLower _fog) do
	{
		case "no fog" : { [1,1,0] };
		case "light fog (low level)" : { [0.5, 0.1, 20] };
		case "moderate fog (low level)" : { [0.5, 0.04, 20] };
		case "heavy fog (low level)" : {[0.8, 0.02, 20]};
		case "light fog (high level)" : { [0.5, 0.025, 70] };
		case "moderate fog (high level)" : { [0.5, 0.02, 100] };
		case "heavy fog (high level)" : { [0.7, 0.01, 100] };
		case "mountain fog" : { [0.3,-0.01, 150] };
	};
	
	//Update Effects on server connected (global effect to all clients)
	[_change, {30 setFog _this}] remoteExec ["BIS_fnc_call", TDMC_core];
	
	//Update Array
	TDMC_dlg_array = [_aar, _viewDistance, [_overcast, _rain, _change]];
	
	_public = true;
};

//Were there changes to weather or effects
if (_public) then
{
	publicVariable "TDMC_dlg_array";
};

//Prepare Array for mission
private ["_s", "_f", "_i", "_c", "_m", "_a", "_x", "_p", "_d", "_l"];
_s = switch (toLower _side) do
{
	case "west" : { WEST };
	case "east" : { EAST };
	case "resistance" : { RESISTANCE };
};
_f = _faction call TDMC_fnc_txtToFaction;

_i = _infantry;

_c = _motorized;

_m = _mechanized;

_a = _armored;

_x = _choppers;

_p = _planes;

_b = _boats;

_d = switch (toLower _ied) do
{
	case "yes" : { true };
	case "no" : { false };
};

_l = switch (toLower _life) do
{
	case "none" : { 0 };
	case "civilians" : { 1 };
	case "animals" : { 2 };
	case "civilians and animals" : { 3 };
};

//remove defend markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_comppos_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_comppos_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};

// remove convoy markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
	{
	};
	deleteMarkerLocal (format ["TDMC_convoy_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};

// remove river markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
	{
	};
	deleteMarkerLocal (format ["TDMC_river_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};

// remove rescue markers
_mkrnumber = 1;
while {true} do
{
	if (str (getMarkerPos format ["TDMC_resue_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_resue_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};	

//Execute Spawn
if (toLower _mission == "destroy convoy") then
{
	[[[_convoy_markers, _mission, _s, _f, _i, _c, _m, _a, _x, _p, _b, _skill, _radius, [false, 0, 0], _l, player, _halopos],"scripts\TDMC\missions\TDMC_missioninit.sqf"], "BIS_fnc_execVM", TDMC_core]call BIS_fnc_MP;
}else
{
	if (toLower _mission == "river patrol") then
	{
		[[[_river_markers, _mission, _s, _f, _i, _c, _m, _a, _x, _p, _b, _skill, _radius, [false, 0, 0], _l, player, _halopos],"scripts\TDMC\missions\TDMC_missioninit.sqf"], "BIS_fnc_execVM", TDMC_core]call BIS_fnc_MP;
	}else
	{
		[[[[_pos, [_markerX, _markerY], _markerAngle, _markerShape], _mission, _s, _f, _i, _c, _m, _a, _x, _p, _b, _skill, _radius, [_d, _iedMin, _iedMax], _l, player, _halopos],"scripts\TDMC\missions\TDMC_missioninit.sqf"], "BIS_fnc_execVM", TDMC_core]call BIS_fnc_MP;
	};
};

TDMC_dlg_creator_convoycreation = false;

//CloseDialog
closeDialog 0;
