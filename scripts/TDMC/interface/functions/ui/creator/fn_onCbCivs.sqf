private ["_combo", "_index", "_display", "_textHelp", "_value", "_title", "_text"];
_combo = _this select 0;
_index = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_value = _combo lbText _index;
_title = switch (toLower _value) do
{
	case "none" : { "<t size='1.25' font='puristaMedium'>No Ambient Life</t>" };
	case "civilians" : { "<img size='3' image='scripts\TDMC\interface\img\iconCiv.paa'/> <t size='1.25' font='puristaMedium'>Civilians</t>" };
	case "animals" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconAnimal_ca.paa'/> <t size='1.25' font='puristaMedium'>Animals</t>" };
	case "civilians and animals" : { "<img size='3' image='scripts\TDMC\interface\img\iconCiv.paa'/> <img size='3' image='\a3\ui_f\data\map\vehicleIcons\IconAnimal_ca.paa'/> <t size='1.25' font='puristaMedium'>Civilians and Animals</t>" };
};
_text = switch (toLower _value) do
{
	case "none" : { "No ambient civilian or animal life will spawn." };
	case "civilians" : { "Civilians will populate the Area of Operation." };
	case "animals" : { "Animals like cows, dogs or even chickens can spawn around the Area of operation." };
	case "civilians and animals" : { "Civilians will populate the Area of Operation to make seem alive. Animals like cows, dogs or even chickens can spawn around the Area of operation, giving a sense of being in a living world." };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	%1
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
", _title, _text];
