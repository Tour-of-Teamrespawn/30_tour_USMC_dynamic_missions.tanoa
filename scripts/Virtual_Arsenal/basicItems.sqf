if (isDedicated) exitWith {};

removeUniform player;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removebackpack player;
removeVest player;
removeHeadGear player;

private _uniform = "";

_uniform = switch (toLower TypeOf player) do 
{
	case "rhsusf_socom_marsoc_cso_breacher": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_cso": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_marksman": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_sarc": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_teamleader": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_spotter": {"rhs_uniform_g3_aor2"};
	case "rhsusf_socom_marsoc_sniper": {"rhs_uniform_g3_aor2"};
	default {"rhs_uniform_frog01_wd"};
};

player addUniform _uniform;

{
	player addItem _x;
	player assignItem _x;
}forEach ["ItemMap","ItemCompass","ItemWatch"];

{
	player addItemToUniform _x;
}forEach 
[
	"ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot",
	"ACE_tourniquet","ACE_tourniquet",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_500",
	"ACE_Earplugs",
	"ACRE_PRC343",
	"ACE_Flashlight_XL50"
];