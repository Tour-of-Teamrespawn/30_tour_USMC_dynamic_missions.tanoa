_debug = _this select 0;
_player = _this select 1;

if (TDMC_current_mission != "") then
{
	TDMC_current_mission call A2S_removeTask;
};
TDMC_current_mission = "";

[] spawn TDMC_fnc_PV_markerremove;
[] spawn TDMC_fnc_clearenemies;

[["error", (format ["Sorry! Mission setup has bugged out in %1 script. Please try again.", _debug])], {hint (_this call TDMC_fnc_hint)}] remoteExec ["BIS_fnc_call", _player];

