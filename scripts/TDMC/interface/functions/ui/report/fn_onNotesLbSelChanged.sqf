if (count (TDMC_dlg_array select 0) < 1) exitWith {};

private ["_display", "_lb", "_index", "_reviewText", "_array", "_title", "_text"];
_display = findDisplay 601000;
_lb = _this select 0;
_index = _this select 1;
_reviewText = _display displayCtrl 601011;
_array = TDMC_dlg_array select 0;
_title = (_array select _index) select 1;
_text = (_array select _index) select 2;

//Preview Text
_reviewText ctrlSetStructuredText parseText format
["
	<t size='1.25' font='Zeppelin33'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
", _title, _text];