
waitUntil {({(!isNull _x) && (damage _x < 0.7)}count TDMC_crates == 0)or(!TDMC_mission_running)};

if ({(!isNull _x) && (damage _x < 0.7)}count TDMC_crates == 0) then
{
	["TDMC_tsk_weapons", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_weapons" call A2S_taskCommit;
	"TDMC_tsk_weapons" call A2S_taskHint;
}else
{
	["TDMC_tsk_weapons", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_weapons" call A2S_taskCommit;
	"TDMC_tsk_weapons" call A2S_taskHint;			
};

TDMC_mission_complete = true;

waitUntil {!TDMC_mission_running};
sleep 10;
	
"TDMC_tsk_weapons" call A2S_removeTask;
	
[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;
	
TDMC_mission_complete = false;


