private ["_slider", "_position", "_display", "_textHelp"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='scripts\TDMC\interface\img\iconRadius.paa'/> <t size='1.25' font='puristaMedium'>%1/250 m</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Set the max patrol radius per group.</t>
", round _position];
