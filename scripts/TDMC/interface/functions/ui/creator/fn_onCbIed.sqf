private ["_combo", "_position", "_display", "_textHelp", "_sliderIed_0", "_sliderIed_1", "_text"];
_combo = _this select 0;
_index = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_sliderIed_0 = _display displayCtrl 121217;
_sliderIed_1 = _display displayCtrl 121218;
_text = _combo lbText _index;

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconexplosiveap_ca.paa'/> <t size='1.25' font='puristaMedium'>Enemy IED's - %1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Can the enemy set hand made IED's where they want? These are usually very dangerous since they are very hard to detect and some have a big explosion radius. May be manually triggered by nearby enemy or by proximity of vehicles or humans.</t>
", _text];

//Activate IED's Sliders if YES is choosen
if (toLower _text == "yes") then
{
	{ _x ctrlEnable true } forEach [_sliderIed_0, _sliderIed_1];
}
else
{
	{ _x ctrlEnable false } forEach [_sliderIed_0, _sliderIed_1];
};
