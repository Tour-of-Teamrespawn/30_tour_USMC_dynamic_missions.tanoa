private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Boat groups: %1", round _position] ;
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
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconShip_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>A navy, naval force, or maritime force is the branch of a Nation's armed forces principally designated for naval and amphibious warfare; namely, lake-borne, riverine, littoral, or ocean-borne combat operations and related functions. It includes anything conducted by surface ships, amphibious ships and submarines.</t>
", _text, _value];
