private ["_display", "_combo", "_index", "_text", "_textHelp", "_icon"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_text = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_icon = switch (toLower _text) do
{
	case "no change" : { "" };
	case "clear sky" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\clear_ca.paa'/>" };
	case "cloudy" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\cloudly_ca.paa'/>" };
	case "rain" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\rainy_ca.paa'/>" };
	case "storm" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\stormy_ca.paa'/>" };
};
_help = switch (toLower _text) do
{
	case "no change" : { "No changes will be made to the current weather." };
	case "clear sky" : { "State of the sky when it is cloudless, totally clear or with a few small light clouds visible. Has a total cloud cover of less than one okta." };
	case "cloudy" : { "The sky is mostly covered with clouds but with possible brief periods of sunshine. The total cloud cover is between 6 to 8 oktas." };
	case "rain" : { "The sky is well covered with reasonably thick clouds, 7 oktas or around 80% percent cloud cover. Moderate rainfall. " };
	case "storm" : { "The sky is totally or completely covered with thick and opaque clouds, 8 oktas or around 100 percent cloud cover. Heavy rain and probably huge storms are to be expected." };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	%1 <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _icon, _text, _help];
