_this spawn 
{
	_units = _this;
	TDMC_MIA_names = [];
	{
		TDMC_MIA_names set [count TDMC_MIA_names, toLower (name _x)];
	}forEach _units;
	while {!TDMC_mission_complete} do
	{
		if ({(toLower ((_x call ace_dogtags_fnc_getDogtagData) select 0)) in TDMC_MIA_names}count (nearestObjects [getMarkerPos TDMC_friendlybase, ["ACE_bodyBagObject"], 500]) == (count TDMC_MIA_names)) exitWith
		{
			TDMC_MIS_MIA_complete = true;
		};
	};	

};

waitUntil 
{
	(!isNil "TDMC_MIS_MIA_complete")
	or
	(TDMC_mission_complete)
};

if 
(
	(!isNil "TDMC_MIS_MIA_complete")
) then
{
	["TDMC_tsk_mia", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_mia" call A2S_taskCommit;
	"TDMC_tsk_mia" call A2S_taskHint;	
}else
{
	["TDMC_tsk_mia", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_mia" call A2S_taskCommit;
	"TDMC_tsk_mia" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

if (!isNil "TDMC_MIS_MIA_complete") then
{
	TDMC_MIS_MIA_complete = nil;
};

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_mia" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";

