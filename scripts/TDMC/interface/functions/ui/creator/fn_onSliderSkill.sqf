private ["_slider", "_position", "_display", "_textHelp", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_value = switch (true) do
{
	case (_position < 0.25) : { "Easy" };
	case (_position < 0.50) : { "Normal" };
	case (_position < 0.75) : { "Hard" };
	case DEFAULT { "Very Hard" };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='scripts\TDMC\interface\img\iconSkill.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Set the enemy intelligence and combat skills without altering the accuracy values.</t>
", _value];

