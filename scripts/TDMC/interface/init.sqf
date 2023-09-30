waitUntil { !isNil { BIS_fnc_init } };

private ["_functions"];
_functions = [] execVM "scripts\TDMC\interface\functions\fn_init.sqf";
waitUntil {scriptDone _functions};

private ["_viewDistance"];
_viewDistance = if (count _this > 0) then { _this select 0 } else { 2500 };

if (isServer) then
{
	//Array containing all needed info
	TDMC_dlg_array = [[], _viewDistance, [overcast, rain, fog]];
	publicVariable "TDMC_dlg_array";
};

if (!isDedicated) then
{
	waitUntil { !isNil { player } };
	waitUntil { !isNull player };
	waitUntil { !(player != player) };
	waitUntil { !isNil { TDMC_dlg_array } };
	
	private ["_aar", "_viewDistance", "_overcast", "_rain", "_fog"];
	_aar = TDMC_dlg_array select 0;
	_viewDistance = TDMC_dlg_array select 1;
	_overcast = ((TDMC_dlg_array select 2) select 0);
	_rain = ((TDMC_dlg_array select 2) select 1);
	_fog = ((TDMC_dlg_array select 2) select 2);
	
	//View Distance
	setViewDistance _viewDistance;
	
	//Weather/Effects
	0 setOvercast _overcast;
	0 setRain _rain;
	0 setFog _fog;
	//if (_effects > 0) then { TDMC_dlg_particlesArray = [player, -1, 0.8, if (_effects > 1) then { true } else { false }] call TDMC_fnc_dlg_sandstorm };
	
	//Actions
	TDMC_missionobject addAction ["<t color=""#0080ff"">"+"DYNAMIC MISSION CREATOR", "scripts\TDMC\interface\action.sqf", "creator", 10, false, true, "", "(_this distance _target < 2.5)"];
//	TDMC_reportobject addAction ["After Action Report", "scripts\TDMC\interface\action.sqf", "report", 5, true, true, "", "(_this distance _target < 2)"];
};
