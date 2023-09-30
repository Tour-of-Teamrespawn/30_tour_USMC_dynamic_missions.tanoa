waitUntil 
{
	(TDMC_MIS_clearao_completed)
	or
	(TDMC_mission_complete)
};

if (TDMC_MIS_clearao_completed) then
{
	sleep 2;
	["TDMC_tsk_clearao", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_clearao" call A2S_taskCommit;
	"TDMC_tsk_clearao" call A2S_taskHint;
}else
{
	["TDMC_tsk_clearao", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_clearao" call A2S_taskCommit;
	"TDMC_tsk_clearao" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

deleteVehicle TDMC_MIS_clearao_trigger;

TDMC_MIS_clearao_completed = nil;

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;

waitUntil {!TDMC_mission_running};
sleep 10;
"TDMC_tsk_clearao" call A2S_removeTask;
TDMC_mission_complete = false;
TDMC_current_mission = "";



