private ["_finished", "_time", "_enemys", "_pos", "_man", "_listsafe", "_listsafeinf"];

_enemys = _this select 0;
_marker = _this select 1;
_pos = getMarkerPos (_this select 1);
_listsafe = _this select 2;
_listsafeinf = _this select 3;
_time = time + 100000;

waitUntil 
{
	(({(alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)}count (playableUnits + switchableUnits)) > 0)
	or
	(TDMC_mission_complete)
};

if (!TDMC_mission_complete) then
{
	{
		if ((alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)) exitWith
		{
			 _man = _x;
		};
	}forEach (playableUnits + switchableUnits);
	
	_name = (str group _man) call TDMC_fnc_groupnamefix; 		
	[[_man, _name], {
		_this spawn
		{
			enableRadio true;
			sleep 1;
			(_this select 0) sideChat format ["HQ, this is %1, we have arrived at base. OVER", (_this select 1)];
			sleep 5;
			TDMC_HQ sideChat format ["Copy that %1, guard it for 1 hour, HQ OUT", (_this select 1)];
			sleep 1;
			enableRadio false;
		};
	}] remoteExec ["BIS_fnc_call"];
	
	_time = time + 3600;
	//_time = time + 60;
	_finished = false;
	_e = [_enemys,_marker,_listsafe,_listsafeinf, TDMC_missionSkill] execVM "scripts\TDMC\AI\TDMC_defend_AI.sqf";
	
	while {true} do
	{
		if (_time < time) exitWith {};
		if (TDMC_mission_complete) exitWith {};
		if (({(alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)}count (playableUnits + switchableUnits)) == 0) exitWith
		{
			_finished = true;
		};
		sleep 1;
	};
};

if (_time < time) then
{
	["TDMC_tsk_defend", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_defend" call A2S_taskCommit;
	"TDMC_tsk_defend" call A2S_taskHint;	
}else
{
	["TDMC_tsk_defend", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_defend" call A2S_taskCommit;
	"TDMC_tsk_defend" call A2S_taskHint;	
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_defend" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";



