private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_value = format ["Mechanized groups: %1", round _position] ;
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
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconapc_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Mechanized infantry is distinguished from motorized infantry, which is transported to battle by trucks or wheeled armored vehicles, in that their vehicles provide a degree of protection from hostile fire, as opposed to 'soft-skinned' wheeled vehicles (trucks or jeeps). Most APCs and IFVs are fully tracked, or are all-wheel drive vehicles (6x6 or 8x8), for mobility across rough ground. Some nations distinguish between mechanized and armored infantry, designating troops carried by APCs as mechanized and those in IFVs as armored.</t>
", _text, _value];
