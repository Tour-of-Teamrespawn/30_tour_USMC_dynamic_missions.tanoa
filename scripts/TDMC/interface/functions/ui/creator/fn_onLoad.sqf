private ["_unit"];
_unit = player;
disableSerialization;

private 
[
	"_display", "_map", "_buttonEnd", "_buttonCreate", "_textHelp", "_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius", "_sliderBoats",
	"_comboMission", "_comboSide", "_comboFaction", "_sliderSkill", "_sliderRadius", "_sliderInfantry", "_sliderCars", "_sliderMechanized", 
	"_sliderArmored", "_sliderChoppers", "_sliderPlanes", "_comboIed", "_sliderIed_0", "_sliderIed_1", "_comboTimeOfDay", "_comboWeather", 
	"_comboFog", "_comboCivs", "_sliderMarkerX", "_sliderMarkerY", "_sliderMarkerAngle", "_comboMarkerShape", "_buttonHalo"
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
_sliderBoats = _display displayCtrl 121228;
_comboIed = _display displayCtrl 121216;
_sliderIed_0 = _display displayCtrl 121217;
_sliderIed_1 = _display displayCtrl 121218;
_comboTimeOfDay = _display displayCtrl 121219;
_comboWeather = _display displayCtrl 121220;
_comboFog = _display displayCtrl 121221;
_comboCivs = _display displayCtrl 121222;
_sliderMarkerX = _display displayCtrl 121223;
_sliderMarkerY = _display displayCtrl 121224;
_sliderMarkerAngle = _display displayCtrl 121225;
_comboMarkerShape = _display displayCtrl 121226;
_buttonHalo = _display displayCtrl 121227;

TDMC_dlg_creator_convoycreation = false;
TDMC_dlg_creator_haloPosSelect = false;

{ _x ctrlEnable false } forEach [_comboFaction, _sliderInfantry, _sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes];

//Mission Running
if (count (TDMC_core getVariable "A2S_taskArray") > 0) exitWith
{
	{ _x ctrlEnable false } forEach [_buttonEnd, _map, _buttonCreate, _textHelp, _comboMission, _comboSide, _comboFaction, _sliderSkill, _sliderRadius, _sliderInfantry, _sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes, _comboIed, _sliderIed_0, _sliderIed_1, _comboTimeOfDay, _comboWeather, _comboEffects, _comboCivs, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
	if (player == (leader group player)) then
	{
		_buttonEnd ctrlEnable true;
		_buttonEnd ctrlSetEventHandler ["ButtonDown", "_this call TDMC_fnc_cre_onButtonEnd"];	
		_icon = "<img size='3' image='\a3\ui_f\data\map\markers\military\objective_ca.paa'/>";
		_title = "Military Op In Progress";
		_text =  "As group leader you can end the mission.";
		_textHelp ctrlSetStructuredText parseText format
		["
			%1 <t size='1.25' font='puristaMedium'>%2</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
		", _icon, _title, _text];
	}else
	{
		_title = "Military Op In Progress";
		_text =  "Only a group leader can end the mission.";
		_icon = "<img size='3' image='\a3\ui_f\data\map\markers\military\objective_ca.paa'/>";
		_textHelp ctrlSetStructuredText parseText format
		["
			%1 <t size='1.25' font='puristaMedium'>%2</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
		", _icon, _title, _text];
	};
};

//Is player allowed to use DMC

private ["_isMember", "_abort"];
if (!isNil "TDMC_dlg_squadMembers") then
{
	_isMember = getPlayerUid player in TDMC_dlg_squadMembers;
	if (isMultiplayer && (!_isMember) && (count TDMC_dlg_squadMembers > 0)) then
	{
		{ _x ctrlEnable false } forEach [_map, _buttonHalo, _buttonEnd, _buttonCreate, _textHelp, _comboMission, _comboSide, _comboFaction, _sliderSkill, _sliderRadius, _sliderInfantry, _sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes, _comboIed, _sliderIed_0, _sliderIed_1, _comboTimeOfDay, _comboWeather, _comboEffects, _comboCivs, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
		_icon = "<img size='3' image='\a3\ui_f\data\map\diary\icons\playerUnknown_ca.paa'/>";
		_title = "Military Op In Progress";
		_text =  "You are not an authorised user of the dynamic mission creator.";
		_textHelp ctrlSetStructuredText parseText format
		["
			%1 <t size='1.25' font='puristaMedium'>%2</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
		", _icon, _title, _text];
		_abort = true;
	};
};
if (!isNil _abort) exitWith {};

private ["_missionTemplates", "_enemySides"];
_missionTemplates = ["AA Hunt", "Arty Hunt", "Assassination", "Attack", "Bomb Defusal", "Clear AO", "Defend" ,"Destroy Convoy", "IED Defusal", "MIA", "Patrol", "Patrol From Base", "Rescue", "River Patrol", "Scud Hunt", "Weapons Cache"];

if (toLower worldName == "cam_lao_nam") then
{
	_missionTemplates = ["AA Hunt", "Arty Hunt", "Assassination", "Attack", "Bomb Defusal", "Clear AO", "Clear Tunnels", "Defend" ,"Destroy Convoy", "IED Defusal", "MIA", "Patrol", "Patrol From Base", "Rescue", "River Patrol", "Scud Hunt", "Weapons Cache"];
};

_enemySides =switch (TDMC_playerside) do //Possible enemy only
{
	case WEST:
	{
		["East","Resistance"]; 
	};
	case EAST:
	{
		["West","Resistance"];
	};
	case RESISTANCE:
	{
		["West","East"];
	};
};

//Combo Box's
lbClear _comboMission; { _comboMission lbAdd _x } forEach _missionTemplates;
lbClear _comboSide; { _comboSide lbAdd _x } forEach _enemySides;
lbClear _comboFaction;
lbClear _comboIed; { _comboIed lbAdd _x } forEach ["No", "Yes"]; _comboIed lbSetCurSel 0;
lbClear _comboTimeOfDay; { _comboTimeOfDay lbAdd _x } forEach ["No change", "Morning", "Afternoon", "Evening", "Night Full Moon", "Night Half Moon"]; _comboTimeOfDay lbSetCurSel 0;
lbClear _comboWeather; { _comboWeather lbAdd _x } forEach ["No change", "Clear Sky", "Cloudy", "Rain", "Storm"]; _comboWeather lbSetCurSel 0;
lbClear _comboFog; { _comboFog lbAdd _x } forEach ["No Change", "No Fog", "Light Fog (Low Level)", "Moderate Fog (Low Level)", "Heavy Fog (Low Level)", "Light Fog (High Level)", "Moderate Fog (High Level)", "Heavy Fog (High Level)", "Mountain Fog"]; _comboFog lbSetCurSel 0;
lbClear _comboCivs; { _comboCivs lbAdd _x } forEach ["None", "Civilians", "Animals", "Civilians and Animals"]; _comboCivs lbSetCurSel 0;
lbClear _comboMarkerShape; { _comboMarkerShape lbAdd _x } forEach ["Ellipse", "Rectangle"]; _comboMarkerShape lbSetCurSel 0;

//Sliders
_sliderSkill sliderSetRange [0, 1]; _sliderSkill sliderSetspeed [0.1, 0.1]; _sliderSkill sliderSetPosition 0.5;
_sliderRadius sliderSetRange [50, 250]; _sliderRadius sliderSetspeed [1, 10]; _sliderRadius sliderSetPosition 100;
_sliderInfantry sliderSetRange [0, 15]; _sliderInfantry sliderSetspeed [1, 15]; _sliderInfantry sliderSetPosition 0;
_sliderCars sliderSetRange [0, 12]; _sliderCars sliderSetspeed [1, 12]; _sliderCars sliderSetPosition 0;
_sliderMechanized sliderSetRange [0, 12]; _sliderMechanized sliderSetspeed [1, 12]; _sliderMechanized sliderSetPosition 0;
_sliderArmored sliderSetRange [0, 12]; _sliderArmored sliderSetspeed [1, 12]; _sliderArmored sliderSetPosition 0;
_sliderChoppers sliderSetRange [0, 4]; _sliderChoppers sliderSetspeed [1, 4]; _sliderChoppers sliderSetPosition 0;
_sliderPlanes sliderSetRange [0, 4]; _sliderPlanes sliderSetspeed [1, 4]; _sliderPlanes sliderSetPosition 0;
_sliderBoats sliderSetRange [0, 12]; _sliderBoats sliderSetspeed [1, 12]; _sliderBoats sliderSetPosition 0;
_sliderIed_0 sliderSetRange [1, 10]; _sliderIed_0 sliderSetspeed [1, 2]; _sliderIed_0 sliderSetPosition 3;
_sliderIed_1 sliderSetRange [1, 10]; _sliderIed_1 sliderSetspeed [1, 2]; _sliderIed_1 sliderSetPosition 6;
_sliderMarkerX sliderSetRange [100, 3000]; _sliderMarkerX sliderSetspeed [1, 10]; _sliderMarkerX sliderSetPosition 150;
_sliderMarkerY sliderSetRange [100, 3000]; _sliderMarkerY sliderSetspeed [1, 10]; _sliderMarkerY sliderSetPosition 150;
_sliderMarkerAngle sliderSetRange [0, 360]; _sliderMarkerAngle sliderSetspeed [1, 10]; _sliderMarkerAngle sliderSetPosition 0;

//Event Handlers
_map ctrlSetEventHandler ["MouseButtonClick", "_this call TDMC_fnc_cre_onMapClicked"];
_buttonEnd ctrlSetEventHandler ["ButtonDown", "_this call TDMC_fnc_cre_onButtonEnd"];
_buttonHalo ctrlSetEventHandler ["ButtonDown", "_this call TDMC_fnc_cre_onButtonHalo"];
_buttonCreate ctrlSetEventHandler ["ButtonDown", "_this call TDMC_fnc_cre_onButtonCreate"];
_comboMission ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbMission"];
_comboSide ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbSide"];
_comboFaction ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbFaction"];
_comboIed ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbIed"];
_comboTimeOfDay ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbTimeOfDay"];
_comboWeather ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbWeather"];
_comboFog ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbEffects"];
_comboCivs ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbCivs"];
_comboMarkerShape ctrlSetEventHandler ["LBSelChanged", "_this call TDMC_fnc_cre_onCbMarkerShape"];
_sliderSkill ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderSkill"];
_sliderRadius ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderRadius"];
_sliderInfantry ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderInfantry"];
_sliderCars ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderCars"];
_sliderMechanized ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderMechanized"];
_sliderArmored ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderArmored"];
_sliderChoppers ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderChoppers"];
_sliderPlanes ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderPlanes"];
_sliderBoats ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderBoats"];
_sliderIed_0 ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderIed_0"];
_sliderIed_1 ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderIed_1"];
_sliderMarkerX ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderMarkerX"];
_sliderMarkerY ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderMarkerY"];
_sliderMarkerAngle ctrlSetEventHandler ["SliderPosChanged", "_this call TDMC_fnc_cre_onSliderMarkerAngle"];

//Create Marker
private ["_mkr"];
_mkr = createMarkerLocal ["TDMC_dlg_dmcMarkerRadius", getPosATL vehicle _unit];
uinamespace setVariable ["TDMC_dlg_dmcMarker", _mkr];
_mkr setMarkerAlphaLocal 0;

//Help Text
_icon = "<img size='3' image='\a3\ui_f\data\map\markers\military\objective_ca.paa'/>";
_title = "Create Mission";
_text =  "Choose from enemy side, faction, numbers, position along with a lot more options to make every mission feel unique. Once ready start using the options to set the mission, enemy and environment parameters. You will find a variety of options to make each mission fit your needs.";
_textHelp ctrlSetStructuredText parseText format
["
	%1 <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _icon, _title, _text];

//Hide IED's Sliders
{ _x ctrlEnable false } forEach [_sliderIed_0, _sliderIed_1];

//Hide button end mission
_buttonEnd ctrlEnable false;

//Hide Time Of Day
//_comboTimeOfDay ctrlEnable false;