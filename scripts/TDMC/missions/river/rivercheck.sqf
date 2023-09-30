private ["_time", "_positions", "_veh", "_endposition", "_waypoints", "_taskText", "_assignedwaypoint"];

_positions = _this select 0;
_taskText = _this select 1;
_endposition = _positions select ((count _positions) - 1);
_assignedwaypoint = 0;

while {true} do
{
	if ({((vehicle _x) distance (_positions select _assignedwaypoint)) < 50} count playableUnits + switchableUnits > 0) then
	{	
		_assignedwaypoint = _assignedwaypoint + 1;
		call compile format ["[""TDMC_tsk_river"", {""Patrol along the designated route from <marker name=""""%1"""">start</marker> to <marker name=""""%2"""">finish</marker>, hitting all %5 waypoints in order to complete the task.<br/><br/>Be on the lookout for %4.<br/><br/>Waypoints Remaining: %5<br/><br/>%3""}, {""Patrol River""}, {""Patrol River""}] call A2S_setSimpleTaskDescription;", _taskText select 0, _taskText select 1, _taskText select 2, _taskText select 3, ((count _positions) - _assignedwaypoint)];
		["TDMC_tsk_river", "UPDATED"] call A2S_setTaskState;
		"TDMC_tsk_river" call A2S_taskCommit;
		if (_assignedwaypoint < count _positions) then
		{
			"TDMC_tsk_river" call A2S_taskHint;
		};
	};
	if (_assignedwaypoint >= count _positions) exitWith {};
	if (TDMC_mission_complete) exitWith {};
	sleep 5;
};

if 
(
	_assignedwaypoint >= count _positions
) then
{
	["TDMC_tsk_river", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_river" call A2S_taskCommit;
	"TDMC_tsk_river" call A2S_taskHint;	
}else
{
	["TDMC_tsk_river", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_river" call A2S_taskCommit;
	"TDMC_tsk_river" call A2S_taskHint;
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_river" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";