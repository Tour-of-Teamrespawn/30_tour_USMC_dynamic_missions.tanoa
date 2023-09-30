private ["_display", "_button", "_titleEdit", "_noteEdit", "_previewText", "_lb", "_listBackground", "_name", "_title", "_text", "_countTitle", "_countText"];
_display = findDisplay 601000;
_button = _this select 0;
_titleEdit = _display displayCtrl 601002;
_noteEdit = _display displayCtrl 601003;
_previewText = _display displayCtrl 601010;
_lb = _display displayCtrl 601004;
_listBackground = _display displayCtrl 601001;
_name = name player;
_title = ctrlText _titleEdit;
_text = ctrlText _noteEdit;
_countTitle = count toArray _title;
_countText = count toArray _text;

if (_countTitle < 2) exitWith { hint format ["ERROR:\n\nTitle needs at least 2 characters...\n\nUser input - %1", _countTitle] };
if (_countTitle > 50) exitWith { hint format ["ERROR:\n\nTitle maximum characters is 50...\n\nUser input - %1", _countTitle] };
if (_countText < 10) exitWith { hint format ["ERROR:\n\nText needs at least 10 characters...\n\nUser input - %1", _countText] };
if (_countText > 930) exitWith { hint format ["ERROR:\n\nText maximum characters is 930...\n\nUser input - %1", _countText] };

//Clear Preview + Note add
_titleEdit ctrlSetText "";
_noteEdit ctrlSetText "";
_previewText ctrlSetText "";

//LB background
_listBackground ctrlSetFade 0.5;
_listBackground ctrlCommit 1;

//Update array
private ["_aar", "_viewDistance", "_overcast", "_rain", "_effects"];
_aar = TDMC_dlg_array select 0;
_viewDistance = TDMC_dlg_array select 1;
_overcast = ((TDMC_dlg_array select 2) select 0) select 0;
_rain = ((TDMC_dlg_array select 2) select 0) select 1;
_effects = (TDMC_dlg_array select 2) select 1;

_aar set [count _aar, [_name, _title, _text]];
TDMC_dlg_array = [_aar, _viewDistance, [[_overcast, _rain], _effects]];
publicVariable "TDMC_dlg_array";