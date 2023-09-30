private ["_display", "_combo", "_index", "_value", "_textHelp", "_mkr", "_icon", "_text"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_value = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_mkr = uinamespace getVariable "TDMC_dlg_dmcMarker";
_icon = switch (toLower _value) do
{
	case "ellipse" : { "iconEllipse.paa" };
	case "rectangle" : { "iconRectangle.paa" };
};
_text = switch (toLower _value) do
{
	case "ellipse" : { "Ellipse type of AO." };
	case "rectangle" : { "Rectangle type of AO." };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='scripts\TDMC\interface\img\%1'/> <t size='1.25' font='puristaMedium'>%2</t>
	<br />
	<br />
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _icon, _value, _text];

//Update Marker
_mkr setMarkerShapeLocal _value;
