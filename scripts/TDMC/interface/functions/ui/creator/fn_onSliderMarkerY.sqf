private ["_slider", "_position", "_display", "_textHelp", "_mkr", "_loc", "_warning"];
_slider = _this select 0;
_position = _this select 1;
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_mkr = uinamespace getVariable "TDMC_dlg_dmcMarker";

if ((str (getMarkerPos _mkr)) != "[0,0,0]") then
{
	_loc = (getMarkerPos TDMC_friendlybase) getpos [TDMC_safeDistance, ((getMarkerPos TDMC_friendlybase) getDir (getMarkerPos _mkr))];
	if ((_loc inArea _mkr) or (((getMarkerPos _mkr) distance ((getMarkerPos TDMC_friendlybase))) < TDMC_safeDistance)) then 
	{
		_warning = format ["<br/><br/><br/>WARNING: Your mission AO is within %1m of the base! Create mission AO further away.", TDMC_safeDistance];
	}else
	{
		_warning = "";
	};
	//Update Marker
	_mkr setMarkerSizeLocal [(getMarkerSize _mkr) select 0, round _position];
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='\a3\ui_f\data\map\markers\military\unknown_ca.paa'/> <t size='1.25' font='puristaMedium'>%1m/3000m</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Area of Operation Y Radius.%2</t>
", round _position, _warning];

//Update Marker
_mkr setMarkerSizeLocal [(getMarkerSize _mkr) select 0, round _position];
