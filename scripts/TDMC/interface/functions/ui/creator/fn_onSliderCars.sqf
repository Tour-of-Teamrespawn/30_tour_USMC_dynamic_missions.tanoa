private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Motorized groups: %1", round _position] ;
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
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\icontruck_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Motorising infantry is the first stage towards the mechanisation of an army. Civilian trucks are readily adaptable to military uses of transporting soldiers, towing guns, and carrying equipment and supplies. This greatly increases the strategic mobility of infantry units, which would otherwise rely on marches or railroads. In practice, armies have found it advantageous to develop trucks to military specifications, such as all-wheel drive, in order to have vehicles that function reliably in extremes of weather and terrain.</t>
", _text, _value];
