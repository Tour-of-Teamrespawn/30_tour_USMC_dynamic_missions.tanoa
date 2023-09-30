private ["_display", "_button", "_reviewText", "_lb", "_listBackground", "_index", "_isMember", "_isAdmin", "_isLeader", "_exit", "_aar"];
_display = findDisplay 601000;
_button = _this select 0;
_reviewText = _display displayCtrl 601011;
_lb = _display displayCtrl 601004;
_listBackground = _display displayCtrl 601001;
_index = lbCurSel _lb;
_isAdmin = getPlayerUid player in TDMC_dlg_serverAdmins;
_isMember = getPlayerUid player in TDMC_dlg_squadMembers;
_isLeader = player == leader group player;
_exit = false;
_aar = TDMC_dlg_array select 0;

if (!_isAdmin) then
{
	if (name player != (_aar select _index) select 0) then
	{
		_exit = true;
		hint "You are only allowed to delete own notes...";
	};
};
if (_exit) exitWith {};

//Clear Review Text
_reviewText ctrlSetText "";

//LB background
if (count _new > 0) then
{
	_listBackground ctrlSetFade 0.5;
	_listBackground ctrlCommit 1;
}
else
{
	_listBackground ctrlSetFade 1;
	_listBackground ctrlCommit 1;
};

//Update array
private ["_viewDistance", "_overcast", "_rain", "_effects"];
_viewDistance = TDMC_dlg_array select 1;
_overcast = ((TDMC_dlg_array select 2) select 0) select 0;
_rain = ((TDMC_dlg_array select 2) select 0) select 1;
_effects = (TDMC_dlg_array select 2) select 1;

_aar set [_index, "delete"];
_aar = _aar - ["delete"];
TDMC_dlg_array = [_aar, _viewDistance, [[_overcast, _rain], _effects]];
publicVariable "TDMC_dlg_array";
