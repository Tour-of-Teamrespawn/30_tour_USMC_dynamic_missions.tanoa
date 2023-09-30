private 
[
	"_display", "_noteListBackground", "_titleEdit", "_noteEdit", "_notesLb", "_addButton", "_clearButton",
	"_deleteButton", "_lineBreakButton", "_reportsText", "_previewText", "_reviewText"
];
_display = _this select 0;
_listBackground = _display displayCtrl 601001;
_titleEdit = _display displayCtrl 601002;
_noteEdit = _display displayCtrl 601003;
_notesLb = _display displayCtrl 601004;
_addButton = _display displayCtrl 601005;
_clearButton = _display displayCtrl 601006;
_deleteButton = _display displayCtrl 601007;
_lineBreakButton = _display displayCtrl 601008;
_reportsText = _display displayCtrl 601009;
_previewText = _display displayCtrl 601010;
_reviewText = _display displayCtrl 601011;

private ["_array", "_name", "_isAdmin", "_isMember", "_isLeader"];
_array = TDMC_dlg_array select 0;
_name = name player;
_isAdmin = getPlayerUid player in TDMC_dlg_serverAdmins;
_isMember = getPlayerUid player in TDMC_dlg_squadMembers;
_isLeader = player == leader group player;

//Event Handlers
_titleEdit ctrlSetEventHandler ["KeyDown", "_this call TDMC_fnc_aar_onKeyDownTitle"];
_noteEdit ctrlSetEventHandler ["KeyDown", "_this call TDMC_fnc_aar_onKeyDownNote"];
_addButton ctrlSetEventHandler ["MouseButtonClick", "_this call TDMC_fnc_aar_onAddButton"];
_clearButton ctrlSetEventHandler ["MouseButtonClick", "_this call TDMC_fnc_aar_onClearButton"];
_deleteButton ctrlSetEventHandler ["MouseButtonClick", "_this call TDMC_fnc_aar_onDeleteButton"];
_lineBreakButton ctrlSetEventHandler ["MouseButtonClick", "_this call TDMC_fnc_aar_onLineBreakButton"];
_notesLb ctrlSetEventHandler ["lbselchanged", "_this call TDMC_fnc_aar_onNotesLbSelChanged"];

//Preview Text
if (_isAdmin || _isLeader) then
{
	_previewText ctrlSetStructuredText parseText format
	["
		<t size='1.25' font='Zeppelin33'>%1</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
	", ctrlText _titleEdit, ctrlText _noteEdit];
}
else
{
	_previewText ctrlSetStructuredText parseText "<t size='1.25' font='Zeppelin33'>You do not have permission to post reports, only read the ones already reported.</t>";
	_addButton ctrlEnable false;
	_clearButton ctrlEnable false;
	_deleteButton ctrlEnable false;
	_lineBreakButton ctrlEnable false;
	_titleEdit ctrlEnable false;
	_noteEdit ctrlEnable false;
};

//LB Background and Text
if (count _array > 0) then 
{
	_reportsText ctrlSetStructuredText parseText "Reports";
	_listBackground ctrlSetFade 0.5;
	_listBackground ctrlCommit 1;
}
else
{
	_reportsText ctrlSetStructuredText parseText "";
	_listBackground ctrlSetFade 1;
	_listBackground ctrlCommit (if (ctrlFade _listBackground != 0.5) then { 0 } else { 1 });
};

//Update LB
uiNameSpace setVariable ["TDMC_dlg_aarUpdateLbLoop", true];
[] spawn
{
	disableSerialization;
	
	private ["_dis", "_lb"];
	_dis = findDisplay 601000;
	_lb = _dis displayCtrl 601004;
	
	waitUntil 
	{
		_lb call TDMC_fnc_aar_updateLb;
		isNil { uiNameSpace getVariable "TDMC_dlg_aarUpdateLbLoop" }
	};
};
