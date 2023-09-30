waitUntil 
{
	sleep 1;
	(
		(!alive TDMC_captiveUnit)
		or
		(TDMC_captiveUnit distance (getMarkerPos TDMC_friendlybase) > 300)
		or
		(TDMC_mission_complete)
	)
};

waitUntil 
{
	sleep 1;
	(
		(!alive TDMC_captiveUnit)
		or
		(TDMC_captiveUnit distance (getMarkerPos TDMC_friendlybase) < 250)
		or
		(TDMC_mission_complete)
	);
};

if (TDMC_captiveUnit distance getMarkerPos TDMC_friendlybase < 250) then
{
	["TDMC_tsk_rescue", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_rescue" call A2S_taskCommit;
	"TDMC_tsk_rescue" call A2S_taskHint;
}else
{
	["TDMC_tsk_rescue", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_rescue" call A2S_taskCommit;
	"TDMC_tsk_rescue" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

TDMC_MIS_clearao_completed = nil;

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;

waitUntil {!TDMC_mission_running};
sleep 10;
"TDMC_tsk_rescue" call A2S_removeTask;
TDMC_mission_complete = false;
TDMC_current_mission = "";



