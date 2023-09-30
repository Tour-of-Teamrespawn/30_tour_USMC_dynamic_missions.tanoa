_weapon_accessories = [
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_g33_xps3_tan",
	"rhsusf_acc_ACOG_usmc",
	"rhsusf_acc_ACOG2_usmc",
	"rhsusf_acc_ACOG3_usmc",
	"rhsusf_acc_eotech",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_eotech_552_d",
	"rhsusf_acc_eotech_552_wd",
	"rhsusf_acc_compm4",
	"rhsusf_acc_mrds",
	"rhsusf_acc_mrds_c",
	"rhsusf_acc_eotech_xps3",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk_top",
	"rhsusf_acc_anpeq15_bk_light",
	"ace_muzzle_mzls_l",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_grip4_bipod",
	"rhsusf_acc_anpeq16a_light_top",
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [
	//standard mags
];

_weapons = [
	"rhs_weap_m4",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1",
	"rhs_m4_acog_usmc",
	"rhs_weap_m27iar",
	"rhs_weap_m27iar_grip"
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
	"rhsusf_lwh_helmet_marpatd_headset",
	"rhsusf_lwh_helmet_marpatwd_headset"
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
	"rhsusf_spc_corpsman"
];

_bis_items = 
[
	"Binocular"
];

_bis_magazines = 
[
	//specific mags.... usually explosives etc
];

_ACE_items =
[	

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
