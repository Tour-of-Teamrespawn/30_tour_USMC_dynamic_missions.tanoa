// Add action to confirm the boss assassination.
if (isNull _this) exitWith {hint "The Target Has Not Spawned!"};

[
	_this,
	"Confirm Identity",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"cursorTarget == _target && !alive _target && _this distance _target < 2",
	"cursorTarget == _target && !alive _target && _this distance _target < 2",
	{},
	{},
	{
		[
			[_target, _caller],
			{
				(_this select 0) removeAction (_this select 2);
				(_this select 1) directSay "TDMC_gotthebastard";
				if (isServer) then
				{
					TDMC_MIS_assassinatecomplete = true;
				};
			}
		] remoteExecCall
		[
			"BIS_fnc_Spawn",
			0,
			true
		];
	},
	{},
	[],
	3,
	6,
	true,
	false
] call BIS_fnc_holdActionAdd;