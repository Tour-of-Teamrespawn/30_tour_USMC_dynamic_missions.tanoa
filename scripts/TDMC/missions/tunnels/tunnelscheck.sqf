private ["_side", "_position"];
params ["_side", "_position"];

{
	if ((side _x == TDMC_currentSide) && (_x distance _position < 150)) then
	{
		_x enableDynamicSimulation false;
		TDMC_mission_units set [count TDMC_mission_units, _x];
		TDMC_mission_groups set [count TDMC_mission_groups, group _x];
		_x call TDMC_fnc_garbageEH;
		_x call TDMC_fnc_loadouts;
	};
}forEach allunits;

TDMC_MIS_cleartunnels_trigger = createTrigger["EmptyDetector", _position]; 
TDMC_MIS_cleartunnels_trigger setTriggerArea[150,150,0, true, -1];
TDMC_MIS_cleartunnels_trigger setTriggerActivation["ANY", "PRESENT", false];
TDMC_MIS_cleartunnels_trigger setTriggerStatements["{(_x in TDMC_mission_units) && (alive _x)}count thisList == 0", "TDMC_MIS_cleartunnels_completed = true;", ""];

waitUntil 
{
	(TDMC_MIS_cleartunnels_completed)
	or
	(TDMC_mission_complete)
};

if (TDMC_MIS_cleartunnels_completed) then
{
	sleep 2;
	["TDMC_tsk_cleartunnels", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_cleartunnels" call A2S_taskCommit;
	"TDMC_tsk_cleartunnels" call A2S_taskHint;
}else
{
	["TDMC_tsk_cleartunnels", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_cleartunnels" call A2S_taskCommit;
	"TDMC_tsk_cleartunnels" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

deleteVehicle TDMC_MIS_cleartunnels_trigger;

TDMC_MIS_cleartunnels_completed = nil;

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;

waitUntil {!TDMC_mission_running};
sleep 10;
"TDMC_tsk_cleartunnels" call A2S_removeTask;
TDMC_mission_complete = false;
TDMC_current_mission = "";



