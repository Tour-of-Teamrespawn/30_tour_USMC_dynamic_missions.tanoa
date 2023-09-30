for "_i" from 0 to 100 do
{
	private [(format ["_%1", _i])];
};

_0 = execVM "scripts\TDMC\arrays\CIV_F_arrays.sqf";
_1 = execVM "scripts\TDMC\arrays\IND_C_F_arrays.sqf";
_2 = execVM "scripts\TDMC\arrays\IND_E_F_arrays.sqf";
_3 = execVM "scripts\TDMC\arrays\IND_G_F_arrays.sqf";
_4 = execVM "scripts\TDMC\arrays\IND_F_arrays.sqf";

_5 = execVM "scripts\TDMC\arrays\BLU_F_arrays.sqf";
_6 = execVM "scripts\TDMC\arrays\BLU_T_F_arrays.sqf";
_7 = execVM "scripts\TDMC\arrays\Guerilla_arrays.sqf";

_10 = execVM "scripts\TDMC\arrays\OPF_G_F_arrays.sqf";
_11 = execVM "scripts\TDMC\arrays\OPF_F_arrays.sqf";
_12 = execVM "scripts\TDMC\arrays\OPF_T_F_arrays.sqf";

waitUntil 
{
	(scriptDone _0)
	&&
	(scriptDone _1)
	&&
	(scriptDone _2)
	&&
//	(scriptDone _3)
//	&&
	(scriptDone _4)
	&&
	(scriptDone _5)
	&&
	(scriptDone _6)
	&&
	(scriptDone _7)
	&&
//	(scriptDone _8)
//	&&
//	(scriptDone _9)
//	&&
	(scriptDone _10)
	&&
	(scriptDone _11)
	&&
	(scriptDone _12)
};

//_30 = execVM "scripts\TDMC\arrays\UK3CB_BAF_Faction_Army_Tropical_arrays.sqf";
_31 = execVM "scripts\TDMC\arrays\UK3CB_BAF_Faction_Army_Woodland_arrays.sqf";
_32 = execVM "scripts\TDMC\arrays\UK3CB_BAF_Faction_Army_MTP_arrays.sqf";
_33 = execVM "scripts\TDMC\arrays\UK3CB_CW_sov_o_LATE_arrays.sqf";
_34 = execVM "scripts\TDMC\arrays\UK3CB_CW_US_B_LATE_arrays.sqf";


waitUntil 
{
//	(scriptDone _30)
//	&&
	(scriptDone _31)
	&&
	(scriptDone _32)
	&&
	(scriptDone _33)
	&&
	(scriptDone _34)
};

_35 = execVM "scripts\TDMC\arrays\UK3CB_AAF_I_arrays.sqf";
_36 = execVM "scripts\TDMC\arrays\UK3CB_TKA_O_arrays.sqf";
_37 = execVM "scripts\TDMC\arrays\UK3CB_TKM_O_arrays.sqf";
_38 = execVM "scripts\TDMC\arrays\UK3CB_TKM_I_arrays.sqf";

waitUntil 
{
	(scriptDone _35)
	&&
	(scriptDone _36)
	&&
	(scriptDone _37)
	&&
	(scriptDone _38)
};

_40 = execVM "scripts\TDMC\arrays\rhs_faction_army_ocp_arrays.sqf";
_41 = execVM "scripts\TDMC\arrays\rhs_faction_army_ucp_arrays.sqf";
_42 = execVM "scripts\TDMC\arrays\rhs_faction_usmc_wd_arrays.sqf";
_43 = execVM "scripts\TDMC\arrays\rhs_faction_vdv_arrays.sqf";
_44 = execVM "scripts\TDMC\arrays\rhsgref_faction_chdkz_arrays.sqf";

waitUntil 
{
	(scriptDone _40)
	&&
	(scriptDone _41)
	&&
	(scriptDone _42)
	&&
	(scriptDone _43)
	&&
	(scriptDone _44)
};

_50 = execVM "scripts\TDMC\arrays\VN_PAVN_arrays.sqf";
_51 = execVM "scripts\TDMC\arrays\VN_VC_arrays.sqf";

waitUntil 
{
	(scriptDone _50)
	&&
	(scriptDone _51)
};

true
