waitUntil 
{
	(
		TDMC_MIS_pat_point_1
		&&
		TDMC_MIS_pat_point_2
		&&
		TDMC_MIS_pat_point_3
		&&
		TDMC_MIS_pat_point_4
		&&
		TDMC_MIS_pat_point_5
	)
	or
	(TDMC_mission_complete)
};

if 
(
	TDMC_MIS_pat_point_1
	&&
	TDMC_MIS_pat_point_2
	&&
	TDMC_MIS_pat_point_3
	&&
	TDMC_MIS_pat_point_4
	&&
	TDMC_MIS_pat_point_5
) then
{
	["TDMC_tsk_patrol", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_patrol" call A2S_taskCommit;
	"TDMC_tsk_patrol" call A2S_taskHint;	
}else
{
	["TDMC_tsk_patrol", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_patrol" call A2S_taskCommit;
	"TDMC_tsk_patrol" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission
	
deleteVehicle TDMC_MIS_pat_trigger_1;
deleteVehicle TDMC_MIS_pat_trigger_2;
deleteVehicle TDMC_MIS_pat_trigger_3;
deleteVehicle TDMC_MIS_pat_trigger_4;
deleteVehicle TDMC_MIS_pat_trigger_5;
	
TDMC_MIS_pat_point_1 = nil;
TDMC_MIS_pat_point_2 = nil;
TDMC_MIS_pat_point_3 = nil;
TDMC_MIS_pat_point_4 = nil;
TDMC_MIS_pat_point_5 = nil;



waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_patrol" call A2S_removeTask;

	
TDMC_mission_complete = false;
TDMC_current_mission = "";



