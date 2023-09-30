private ["_display", "_combo", "_index", "_value", "_textHelp", "_icon", "_title", "_text"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_value = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_icon = switch (tolower _value) do
{
	case "no change" : { "" };
	case "morning" : { "<img size='3' image='scripts\TDMC\interface\img\iconMorning.paa'/>" };
	case "afternoon" : { "<img size='3' image='scripts\TDMC\interface\img\iconAfternoon.paa'/>" };
	case "evening" : { "<img size='3' image='scripts\TDMC\interface\img\iconMorning.paa'/>" };
	case "night full moon" : { "<img size='3' image='scripts\TDMC\interface\img\iconFullMoon.paa'/>" };
	case "night half moon" : { "<img size='3' image='scripts\TDMC\interface\img\iconHalfMoon.paa'/>" };
};
_title = _value;
_text = switch (tolower _value) do
{
	case "no change" : { "The time of day will stay the same." };
	case "morning" : { "Pretty early on the day when the sun starts shinning and light fills the landscape." };
	case "afternoon" : { "The sun will be right above you, if the sky is clear the light will reach pretty much everywhere." };
	case "evening" : { "The sun starts hiding behind the landscape bringging the night with it." };
	case "night full moon" : { "If the sky is clear of clouds the visibility will be good since the moon will reflect the sun light right on the landscape." };
	case "night half moon" : { "Probably very difficult to see anything on such conditions without proper equipment such as portable Night Vision Goggles." };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	%1 <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _icon, _title, _text];
