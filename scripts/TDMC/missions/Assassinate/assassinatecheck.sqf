waitUntil {(TDMC_MIS_assassinatecomplete)or(!TDMC_mission_running)};
sleep 2;
if 
(
	!TDMC_MIS_assassinatecomplete
) then
{
	["TDMC_tsk_assassinate", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_assassinate" call A2S_taskCommit;
	"TDMC_tsk_assassinate" call A2S_taskHint;			
}else
{
	["TDMC_tsk_assassinate", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_assassinate" call A2S_taskCommit;
	"TDMC_tsk_assassinate" call A2S_taskHint;	
};
	
TDMC_mission_complete = true;

// reset all elements from the mission
TDMC_MIS_assassinatecomplete = nil;

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;
TDMC_MIS_assassinatecomplete = nil;
TDMC_mission_complete = false;

sleep 10;
"TDMC_tsk_assassinate" call A2S_removeTask;


