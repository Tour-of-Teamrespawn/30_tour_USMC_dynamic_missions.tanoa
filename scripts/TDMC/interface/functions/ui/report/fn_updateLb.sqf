private ["_lb", "_array", "_display", "_listBackground", "_deleteButton", "_reportsText", "_reviewText"];
_lb = _this;
_array = TDMC_dlg_array select 0;
_display = ctrlParent _lb;
_listBackground = _display displayCtrl 601001;
_deleteButton = _display displayCtrl 601007;
_reportsText = _display displayCtrl 601009;
_reviewText = _display displayCtrl 601011;

lbClear _lb;

if (count _array > 0) then
{
	{
		_lb lbAdd format ["Posted by %1 - %2", (_x select 0), (_x select 1)];
		_lb lbSetPicture [_forEachIndex, "\ca\ui\data\ui_xbox_shortcut_rightthumb_ca.paa"];
	} forEach _array;
	
	_reportsText ctrlSetStructuredText parseText "Reports";
	_listBackground ctrlSetFade 0.5; _listBackground ctrlCommit 1;
	
	if (lbCurSel _lb != -1) then
	{
		_deleteButton ctrlEnable true;
	}
	else
	{
		_deleteButton ctrlEnable false;
	};
	
	if (lbCurSel _lb + 1 > lbSize _lb) then
	{
		_lb lbSetCurSel 0;
	};
}
else
{
	_reportsText ctrlSetText "";
	_reviewText ctrlSetText "";
	_listBackground ctrlSetFade 1; _listBackground ctrlCommit 0;
	_deleteButton ctrlEnable false;
};
