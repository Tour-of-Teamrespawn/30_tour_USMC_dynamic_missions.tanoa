private ["_action", "_display"];
_action = _this select 3;
_display = switch (_action) do
{
	case "creator" : { "TDMC_dlg_interfaceCreator" };
	case "report" : { "TDMC_dlg_aar" };
};

if (!dialog) then
{
	createDialog _display;
};
