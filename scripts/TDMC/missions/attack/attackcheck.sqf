private ["_pos"];

_pos = _this select 0;

waitUntil {(({(alive _x) && (side _x == TDMC_currentside)}count (nearestObjects [_pos, ["man", "landvehicle"], 250])) == 0) or TDMC_mission_complete};

if (!TDMC_mission_complete) then
{
	["TDMC_tsk_capture", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_capture" call A2S_taskCommit;
	"TDMC_tsk_capture" call A2S_taskHint;	
}else
{
	["TDMC_tsk_capture", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_capture" call A2S_taskCommit;
	"TDMC_tsk_capture" call A2S_taskHint;	
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_capture" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";



