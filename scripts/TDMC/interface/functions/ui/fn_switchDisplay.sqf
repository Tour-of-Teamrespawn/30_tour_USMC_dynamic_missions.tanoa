private ["_button", "_newDisplay"];
_button = _this;
_newDisplay = switch (_button) do
{
	case "admin" : { "TDMC_dlg_interfaceAdmin" };
	case "creator" : { "TDMC_dlg_interfaceCreator" };
	case "report" : { "TDMC_dlg_aar" };
};

closeDialog 0;
_newDisplay spawn { createDialog _this };
