_weapon_accessories = [
	"rhsusf_acc_m8541",
	"rhsusf_acc_premier",
	"rhsusf_acc_leupoldmk4_2",
	"rhsusf_acc_leupoldmk4_2_d",
	"optic_ams",
	"optic_ams_khk",
	"optic_ams_snd",
	"ace_optic_lrps_pip",
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [
	//standard mags
];

_weapons = [
	"arifle_SPAR_03_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"rhs_weap_mk17_LB",
	"rhs_weap_sr25",
	"rhs_weap_sr25_d",
	"rhs_weap_sr25_wd"
];

_launchers = [
	//launchers
];

_static = 
[
	//static backpacks
];

_backpacks = 
[
	//backpacks
];

_uniform_berets = 
[
	"rhs_8point_marpatwd",
	"rhs_8point_marpatd"
];

_uniform_boonie = 
[
	//boonie
];

_uniform_bowman = 
[

];

_uniform_glasses = 
[
	//glassess balaclava's
];

_uniform_helmet = 
[
	"rhsusf_lwh_helmet_M1942",
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatwd"
];

_uniform_items = 
[
	//nvg's
];

_uniform_uniform = 
[
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_FROG01_d"
];

_uniform_vest = 
[
	"rhsusf_spc_light",
	"rhsusf_spc_marksman"
];

_bis_items = 
[
	"rangefinder"
];

_bis_magazines = 
[
	//specific mags.... usually explosives etc
];

_ACE_items =
[	
	"ACE_Kestrel4500"
];

_ctab = 
[
	"ItemMicroDAGR",
	"ItemcTabHCam"
];

_array = [
			(_weapons + _launchers + _static), 
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks)
			];

_array
