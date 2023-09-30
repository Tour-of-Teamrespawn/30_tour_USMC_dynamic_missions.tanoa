private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Infantry groups: %1", round _position] ;

_text = switch (true) do
{
	case (round _position == 0) : { "None" };
	case ((round _position >= 1)&&(round _position <= 3)) : { "Low" };
	case ((round _position >= 4)&&(round _position <= 6)) : { "Medium" };
	case ((round _position >= 7)&&(round _position <= 9)) : { "High" };
	case ((round _position >= 10)&&(round _position <= 12)) : { "Very High" };
	default {"Error"};
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconman_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Infantrymen are soldiers who are specifically trained for the role of fighting on foot to engage the enemy face to face and have historically borne the brunt of the casualties of combat in wars. As the oldest branch of combat arms, they are the backbone of armies. Infantry units have more physically demanding training than other branches of armies, and place a greater emphasis on discipline, fitness, physical strength and aggression.</t>
", _text, _value];
