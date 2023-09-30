_launchers = _this;
waitUntil 
{
	(
		({(damage _x) < 0.8} count _launchers) == 0
	)
	or
	(TDMC_mission_complete)
};

if 
(
	({damage _x < 0.8} count _launchers) == 0
) then
{
	["TDMC_tsk_aa", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_aa" call A2S_taskCommit;
	"TDMC_tsk_aa" call A2S_taskHint;	
}else
{
	["TDMC_tsk_aa", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_aa" call A2S_taskCommit;
	"TDMC_tsk_aa" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_aa" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";



