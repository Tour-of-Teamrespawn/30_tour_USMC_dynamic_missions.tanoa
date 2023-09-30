private ["_convoy", "_time", "_positions", "_veh", "_endposition", "_waypoints"];
_convoy = _this select 0;
_positions = _this select 1;
_time = time + 1800;   //default 1800s
_endposition = _positions select ((count _positions) - 1);
_waypoints = [];
{
	if (_forEachIndex != 0) then
	{
		_waypoints set [count _waypoints, _x];
	};
}forEach _positions;

while {true} do
{
	if (({(!isNull _x) && (canMove _x)} count _convoy) == 0) exitWith {};
	if (({side _x == TDMC_playerside}count (nearestObjects [(_positions select 0), ["LANDVEHICLE", "AIR", "MAN"], TDMC_safeDistance])) > 0) exitWith {};
	if (_time < time) exitWith {};
	if (TDMC_mission_complete) exitWith {};
	sleep 5;
};

if !(TDMC_mission_complete) then
{
	[
			_waypoints,
			_convoy,
			[1,7,14],
			false
	] execVM "scripts\NEO_convoy\init_convoy.sqf";

	if 
	(
		(({side _x == TDMC_playerside}count (nearestObjects [(_positions select 0), ["LANDVEHICLE", "AIR", "MAN"], TDMC_safeDistance])) > 0)
	) then
	{
		{
			[]spawn
			{
				enableRadio true;
				sleep 1;
				TDMC_HQ sideChat "All elements be advised, you have been sighted, convoy is on the move! HQ OUT";
				sleep 1;
				enableRadio false;
			};
		} remoteExec ["BIS_fnc_call"];
	}else
	{
		if (time > _time) then
		{ 		
			{
				[]spawn
				{
					enableRadio true;
					sleep 1;
					TDMC_HQ sideChat "All elements be advised, UAV recon indicates that the convoy is onroute! HQ OUT";
					sleep 1;
					enableRadio false;
				};
			} remoteExec ["BIS_fnc_call"];
		};
	};
};
while {true} do
{
	if (({(!isNull _x) && (canMove _x)} count _convoy) == 0) exitWith {};
	if (({(!isNull _x)&&((_endposition distance _x) < 200)}count _convoy) > 0) exitWith {};
	if (TDMC_mission_complete) exitWith {};
	sleep 5;
};

if 
(
	(({(!isNull _x) && (canMove _x)} count _convoy) == 0)
) then
{
	["TDMC_tsk_convoy", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_convoy" call A2S_taskCommit;
	"TDMC_tsk_convoy" call A2S_taskHint;	
}else
{
	["TDMC_tsk_convoy", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_convoy" call A2S_taskCommit;
	"TDMC_tsk_convoy" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_convoy" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";