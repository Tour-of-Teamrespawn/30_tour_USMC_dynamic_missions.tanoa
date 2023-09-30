private ["_slider", "_position", "_display", "_textHelp", "_text", "_value"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;

_value = format ["Planes groups: %1", round _position] ;
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
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>%2</t>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>The main role of fighters is destroying enemy aircraft in air-to-air combat, offensive or defensive. Many are fast and highly maneuverable. Escorting bombers or other aircraft is also a common task. They are capable of carrying a variety of weapons, including machine guns, cannons, rockets and guided missiles. Many modern fighters can attack enemy fighters from a great distance, before the enemy even sees them.</t>
", _text, _value];
