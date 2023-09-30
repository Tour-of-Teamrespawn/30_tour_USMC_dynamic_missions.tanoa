waitUntil {({!isNull _x}count (TDMC_core getVariable "TOUR_IEDs") == 0)or(TDMC_IED_detonated)or(!TDMC_mission_running)};

if 
(
	TDMC_IED_detonated
) then
{
	["TDMC_tsk_IED", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_IED" call A2S_taskCommit;
	"TDMC_tsk_IED" call A2S_taskHint;			
}else
{
	if ({!isNull _x}count (TDMC_core getVariable "TOUR_IEDs") == 0) then
	{
		["TDMC_tsk_IED", "SUCCEEDED"]call A2S_setTaskState;
		"TDMC_tsk_IED" call A2S_taskCommit;
		"TDMC_tsk_IED" call A2S_taskHint;
	}else
	{
		["TDMC_tsk_IED", "FAILED"]call A2S_setTaskState;
		"TDMC_tsk_IED" call A2S_taskCommit;
		"TDMC_tsk_IED" call A2S_taskHint;			
	};
};
	
TDMC_mission_complete = true;

// reset all elements from the mission
TDMC_IED_detonated = false;

waitUntil {!TDMC_mission_running};
sleep 10;
	
"TDMC_tsk_IED" call A2S_removeTask;
	
[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;
	
TDMC_mission_complete = false;


