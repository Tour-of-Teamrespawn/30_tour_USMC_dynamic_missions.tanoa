private ["_slider", "_position", "_display", "_textHelp", "_sliderIed_1"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_sliderIed_1 = _display displayCtrl 121218;

if (sliderPosition _sliderIed_1 < _position) then { _sliderIed_1 sliderSetPosition _position };

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconexplosiveap_ca.paa'/> <t size='1.25' font='puristaMedium'>Minimum IED's - %1/10</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>This will be the minimum number of IED's that can be placed by the enemy within the Area of operation.</t>
", round _position];
