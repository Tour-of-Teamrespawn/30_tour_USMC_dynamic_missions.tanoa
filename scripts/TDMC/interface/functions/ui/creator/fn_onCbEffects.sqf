private ["_display", "_combo", "_index", "_value", "_textHelp", "_title", "_text", "_icon"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_value = _combo lbText _index;
_textHelp = _display displayCtrl 121204;

_icon = switch (toLower _value) do
{
	case "no change" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_min_ca.paa'/>" };
	case "no fog" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\clear_ca.paa'/>" };
	case "light fog (general)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_min_ca.paa'/>" };
	case "moderate fog (general)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "heavy fog (general)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "light fog (low level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_min_ca.paa'/>" };
	case "moderate fog (low level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "heavy fog (low level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "light fog (high level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_min_ca.paa'/>" };
	case "moderate fog (high level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "heavy fog (high level)" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
	case "mountain fog" : { "<img size='3' image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa'/>" };
};
_title = switch (toLower _value) do
{
	case "no change" : { "<t size='1.25' font='puristaMedium'>No change</t>" };
	case "no fog" : { "<t size='1.25' font='puristaMedium'>No Fog</t>" };
	case "light fog (general)" : { "<t size='1.25' font='puristaMedium'>Light Fog At All Levels</t>" };
	case "moderate fog (general)" : { "<t size='1.25' font='puristaMedium'>Moderate Fog At All Levels</t>" };
	case "thick fog (general)" : { "<t size='1.25' font='puristaMedium'>Thick Fog At All Levels</t>" };
	case "light fog (low level)" : { "<t size='1.25' font='puristaMedium'>Light Fog At Low Level</t>" };
	case "moderate fog (low level)" : { "<t size='1.25' font='puristaMedium'>Moderate Fog At Low Level</t>" };
	case "heavy fog (low level)" : { "<t size='1.25' font='puristaMedium'>Heavy Fog At Low Level</t>" };
	case "light fog (high level)" : { "<t size='1.25' font='puristaMedium'>Light Fog Up To High Level</t>" };
	case "moderate fog (high level)" : { "<t size='1.25' font='puristaMedium'>Moderate Fog Up To High Level</t>" };
	case "heavy fog (high level)" : { "<t size='1.25' font='puristaMedium'>Heavy Fog Up To High Level</t>" };
	case "mountain fog" : { "<t size='1.25' font='puristaMedium'>Moderate Fog Starts At High Level</t>" };
};
_text = switch (toLower _value) do
{
	case "no change (general)" : { "The current level of fog will be used." };
	case "light fog (general)" : { "Presence of mist, creating a haze at all levels." };
	case "moderate fog (general)" : { "Presence of fog, hindering vision beyond 1 km." };
	case "heavy fog (general)" : { "Presence of dense fog, completely imparing vision at close range." };
	case "light fog (low level)" : { "Presence of mist, creating a haze at low altitudes." };
	case "moderate fog (low level)" : { "A temparature inversion at ground level causes moderate fog at low altitude, hindering vision in the layer of fog." };
	case "heavy fog (low level)" : { "A steep temparature inversion at ground level causes heavy fog at low altitude, completely imparing vision at close range." };
	case "light fog (high level)" : { "Presence of mist, creating a haze from low to higher altitudes." };
	case "moderate fog (high level)" : { "A temparature inversion at ground level causes moderate fog from low to higher altitudes, hindering vision in the layer of fog." };
	case "heavy fog (high level)" : { "A steep temparature inversion at ground level causes heavy fog from low to higher altitudes, completely imparing vision at close range." };
	case "mountain fog" : { "Moist air condense on high level slopes causing moderate fog from moderate to higher altitudes, hindering imparing vision in the layer of fog." };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	%1 <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _icon, _title, _text];
