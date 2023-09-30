private ["_patRadius", "_skill", "_finished", "_time", "_enemys", "_pos", "_man", "_listsafe", "_listsafeinf", "_rimReached", "_returned"];

_enemys = _this select 0;
_marker = _this select 1;
_pos = getMarkerPos (_this select 1);
_listsafe = _this select 2;
_listsafeinf = _this select 3;
_patRadius = _this select 4;
_skill = _this select 5;
_time = time + 100000;

waitUntil 
{
	(({(alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)}count (playableUnits + switchableUnits)) == ({(alive _x) && (side _x == TDMC_playerside)}count (playableUnits + switchableUnits)))
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
			TDMC_HQ sideChat format ["Copy that %1, get patrolling and good look, HQ OUT", (_this select 1)];
			sleep 1;
			enableRadio false;
		};
	}] remoteExec ["BIS_fnc_call"];
	
	_time = time + 3600;
	//_time = time + 60;
	_finished = false;
	_enemy = [TDMC_enemytype,"TDMC_mkr_AO_1", _enemys, _patradius, _skill, _listsafe, _listsafeinf] execVM "scripts\TDMC\AI\TDMC_create_AO_patrols.sqf";
	_enemyhouse = ["TDMC_mkr_AO_1", TDMC_currentside, 8, 15, "patrol from base"] execVM "scripts\TDMC\AI\TDMC_create_AO_enemyhouse.sqf";		

	_rimReached = false;
	_returned = false;
	
	while {true} do
	{
		if (!_rimReached && (({(alive _x) && (side _x == TDMC_playerside) && !((vehicle _x) inArea "TDMC_mkr_AO_1") && (((vehicle _x) distance (getMarkerPos "TDMC_mkr_AO_1")) < (((getMarkerSize "TDMC_mkr_AO_1") select 0) + 100))}count (playableUnits + switchableUnits)) > 0)) then 
		{
			_rimReached = true;
			[[], {
				_this spawn
				{
					enableRadio true;
					sleep 5;
					TDMC_HQ sideChat "This is HQ, good job on the patrol, make your way back to base, HQ OUT";
					sleep 1;
					enableRadio false;
				};
			}] remoteExec ["BIS_fnc_call"];			
		};
		if (_rimReached && (({(alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)}count (playableUnits + switchableUnits)) == ({(alive _x) && (side _x == TDMC_playerside)}count (playableUnits + switchableUnits)))) exitWith {_returned = true};
		if (TDMC_mission_complete) exitWith {};
//		if (({(alive _x) && (side _x == TDMC_playerside) && (_x inArea _marker)}count (playableUnits + switchableUnits)) == 0) exitWith
		if (({(alive _x) && (side _x == TDMC_playerside)}count (playableUnits + switchableUnits)) == 0) exitWith
		{
			_finished = true;
		};
		sleep 1;
	};
};

if (_returned) then
{
	["TDMC_tsk_basePatrol", "SUCCEEDED"]call A2S_setTaskState;
	"TDMC_tsk_basePatrol" call A2S_taskCommit;
	"TDMC_tsk_basePatrol" call A2S_taskHint;	
}else
{
	["TDMC_tsk_basePatrol", "FAILED"]call A2S_setTaskState;
	"TDMC_tsk_basePatrol" call A2S_taskCommit;
	"TDMC_tsk_basePatrol" call A2S_taskHint;	
};

waitUntil {TDMC_mission_complete};

// reset all elements from the mission

waitUntil {!TDMC_mission_running};

[]call TDMC_fnc_PV_markerremove;
[]call TDMC_fnc_clearenemies;	
sleep 10;
"TDMC_tsk_basePatrol" call A2S_removeTask;

TDMC_mission_complete = false;
TDMC_current_mission = "";



