
[]spawn 
{
	_time = time + 3600 + (random 3600);
	while {(_time > time) && TDMC_mission_running} do {sleep 1;};
	{
		if (!isNull _x) then
		{
			_x execVM "scripts\TOUR_Explosives\bombDetonate.sqf";
			sleep (2 + (random 3));
		};
	}forEach TDMC_bomb_array;
};

waitUntil {({!isNull _x}count TDMC_bomb_array == 0)or(TDMC_bombs_detonated)or(!TDMC_mission_running)};

if 
(
	TDMC_bombs_detonated
) then
{
	["TDMC_tsk_bombs", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_bombs" call A2S_taskCommit;
	"TDMC_tsk_bombs" call A2S_taskHint;			
}else
{
	if ({!isNull _x}count TDMC_bomb_array == 0) then
	{
		["TDMC_tsk_bombs", "SUCCEEDED"]call A2S_setTaskState;
		"TDMC_tsk_bombs" call A2S_taskCommit;
		"TDMC_tsk_bombs" call A2S_taskHint;
	}else
	{
		["TDMC_tsk_bombs", "FAILED"]call A2S_setTaskState;
		"TDMC_tsk_bombs" call A2S_taskCommit;
		"TDMC_tsk_bombs" call A2S_taskHint;			
	};
};
	
TDMC_mission_complete = true;

// reset all elements from the mission
TDMC_bombs_detonated = false;

waitUntil {!TDMC_mission_running};
sleep 10;
	
"TDMC_tsk_bombs" call A2S_removeTask;
	
[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;
	
TDMC_mission_complete = false;


