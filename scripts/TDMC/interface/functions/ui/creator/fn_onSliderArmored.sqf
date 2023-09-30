private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Armoured groups: %1", round _position] ;
_text = switch (true) do
{
	case (round _position == 0) : { "None" };
	case ((round _position >= 1)&&(round _position <= 3)) : { "Low" };
	case ((round _position >= 4)&&(round _position <= 6)) : { "Medium" };
	case ((round _position >= 7)&&(round _position <= 9)) : { "High" };
	case ((round _position >= 10)&&(round _position <= 12)) : { "Very High" };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\icontank_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>	
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>The development of the tank near the end of World War I prompted some nations to experiment with forming them into division-size units. Many did this the same way as they did cavalry, by merely replacing infantry with tank units and giving motorization to the support units. This proved unwieldy in combat, as the units had many tanks but few infantry units. Instead, a more balanced approach was taken by adjusting the number of tank, infantry, artillery, and support units. Infantry division referred to a division with a majority of infantry units.</t>
", _text, _value];
