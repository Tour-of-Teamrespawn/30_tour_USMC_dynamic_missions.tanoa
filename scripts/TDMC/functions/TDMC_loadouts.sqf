/*
	Skill Level settings function by Mr.Ben
	
	Usage:
	_this should be a man unit
	_x call function;
	
*/

private ["_guy", "_skillgeneral", "_skillaccuracy", "_skills"];

_guy = _this;
_skillArray = TDMC_skillArray;

_sf = call compile format ["TDMC_array_%1_SF", TDMC_enemytype];
_sniper = call compile format ["TDMC_array_%1_Sniper", TDMC_enemytype];

if ((toLower (typeof _guy)) in _sf) then
{
	// requires skill multiplyer & accuracy setting
	{
		_value = _x select 1;
		if ((_x select 0) == "general") then
		{
			_value = TDMC_missionSkill;
		};
		if ((TDMC_SpecopsGeneralMul * _value) > 1) then
		{
			_value = 1;
		}else
		{
			_value = (TDMC_SpecopsGeneralMul * _value);
		};
		if ((_x select 0) == "aimingAccuracy") then
		{
			_value = TDMC_specopsAccuracy;
		};
		_skillArray set [_forEachIndex, [(_x select 0), _value]];	
	}forEach _skillArray;
}else
{
		// requires general skill and accuracy setting as -per new parameter
	{
		_value = _x select 1;
		if ((_x select 0) == "general") then
		{
			_value = TDMC_missionSkill;
		};
		if ((_x select 0) == "aimingAccuracy") then
		{
			if ((toLower (typeof _guy)) in _sniper) then
			{
				_value = TDMC_sniperAccuracy;
			}else
			{
				_value = TDMC_generalAccuracy;
			};
		};
		_skillArray set [_forEachIndex, [(_x select 0), _value]];
	}forEach _skillArray;
};

if (!isNil "Vcm_ActivateAI") then
{
	(group _guy) setVariable ["VCM_Skilldisable",true]; //This command will disable an AI group from being impacted by Vcom AI skill changes.
	(group _guy) setVariable ["Vcm_Disable",true];	//This command will disable an AI group from running Vcom scripts.
};

if (local _guy) then 
{
	{
		_guy setSkill _x;
	}forEach _skillArray;
	_guy setvariable ["bis_nocoreconversations",true];
}
