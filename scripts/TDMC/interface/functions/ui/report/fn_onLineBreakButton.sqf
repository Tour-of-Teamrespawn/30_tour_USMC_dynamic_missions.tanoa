private ["_display", "_edit", "_previewText", "_titleEdit", "_textEdit", "_title", "_text"];
_display = findDisplay 601000;
_edit = _this select 0;
_previewText = _display displayCtrl 601010;
_titleEdit = _display displayCtrl 601002;
_textEdit = _display displayCtrl 601003;
_title = ctrlText _titleEdit;
_text = ctrlText _textEdit + "<br/>";

//Preview Text
_previewText ctrlSetStructuredText parseText format
["
	<t size='1.25' font='Zeppelin33'>%1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
", _title, _text];

//Update Edit Text
_textEdit ctrlSetText _text;

//Focus on Edit Resource
ctrlSetFocus _textEdit;
