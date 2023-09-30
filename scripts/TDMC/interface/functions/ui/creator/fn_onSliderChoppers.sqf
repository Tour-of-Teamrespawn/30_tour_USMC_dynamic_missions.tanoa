private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Chopper groups: %1", round _position] ;
_text = switch (true) do
{
	case (round _position == 0) : { "None" };
	case (round _position == 1) : { "Low" };
	case (round _position == 2) : { "Medium" };
	case (round _position == 3) : { "High" };
	case (round _position == 4) : { "Very High" };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Examples of specialized military helicopters are attack helicopters, observation helicopters and anti-submarine warfare helicopters. The most common use of military helicopters is transport of troops, but transport helicopters can be modified or converted to perform other missions such as combat search and rescue (CSAR), medical evacuation (MEDEVAC), airborne command post, or even armed with weapons for attacking ground targets. Specialized military helicopters are intended to conduct specific missions.</t>
", _text, _value];
