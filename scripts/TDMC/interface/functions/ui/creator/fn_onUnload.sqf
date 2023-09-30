private 
[
	"_display", "_map", "_buttonEnd", "_buttonCreate", "_textHelp", "_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius",
	"_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius", "_sliderInfantry", "_sliderCars", "_sliderMechanized", 
	"_sliderArmored", "_sliderChoppers", "_sliderPlanes", "_comboIed", "_sliderIed_0", "_sliderIed_1", "_comboTimeOfDay", "_comboWeather", 
	"_comboEffects", "_sliderCivs", "_sliderMarkerX", "_sliderMarkerY", "_sliderMarkerAngle", "_comboMarkerShape", "_mkrnumber"
];
_display = _this select 0;
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
_comboIed = _display displayCtrl 121216;
_sliderIed_0 = _display displayCtrl 121217;
_sliderIed_1 = _display displayCtrl 121218;
_comboTimeOfDay = _display displayCtrl 121219;
_comboWeather = _display displayCtrl 121220;
_comboEffects = _display displayCtrl 121221;
_sliderCivs = _display displayCtrl 121222;
_sliderMarkerX = _display displayCtrl 121223;
_sliderMarkerY = _display displayCtrl 121224;
_sliderMarkerAngle = _display displayCtrl 121225;
_comboMarkerShape = _display displayCtrl 121226;

//Delete Marker
private ["_mkr"];
_mkr = uinamespace getVariable "TDMC_dlg_dmcMarker";
deleteMarkerLocal _mkr;
uinamespace setVariable ["TDMC_dlg_dmcMarker", nil];
uiNameSpace setVariable ["TDMC_dlg_dmcMarkerCreated", nil];
TDMC_dlg_creator_convoycreation = false;
TDMC_dlg_creator_haloPosSelect = false;

// remove halo markers

if (str (getMarkerPos "TDMC_dlg_creator_haloMarker") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_dlg_creator_haloMarker";
};

if (str (getMarkerPos "TDMC_dlg_creator_haloMarkerLimit") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_dlg_creator_haloMarkerLimit";
};


// remove defend markers
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
	if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_convoy_marker_%1", _mkrnumber]);
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