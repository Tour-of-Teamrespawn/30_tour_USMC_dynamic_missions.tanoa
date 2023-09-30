//[nil, TDMC_core, "loc", rSPAWN, [player], {[_this select 0] call TDMC_fnc_enemyinfo;}]call RE;
[player, {_this call TDMC_fnc_enemyinfo}] remoteExec ["BIS_fnc_call", TDMC_core];