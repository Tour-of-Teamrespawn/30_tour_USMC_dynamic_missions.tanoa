_weapon_accessories = [
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
	"rhsusf_acc_elcan_ard_3d",
	"rhsusf_acc_grip4_bipod",
	"rhsusf_acc_anpeq16a_light_top",
	"rhsusf_acc_elcan_3d",
	"rhs_optic_maaws",
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [

];

_weapons = [	
	"rhs_weap_m16a4_imod",
	"rhs_weap_m4",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1",
	"rhs_m4_acog_usmc",
	"rhs_weap_m27iar",
	"rhs_weap_m27iar_grip"
];

_launchers = [

];

_static = 
[
	"rhs_m2_gun_bag",
	"rhs_m252_gun_bag",
	"rhs_tow_gun_bag",
	"rhs_mk19_gun_bag"
];

_backpacks = 
[
	"b_carryall_cbr",
	"b_carryall_green_f"
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
	"UK3CB_BAF_H_Earphone",
	"UK3CB_BAF_H_Headset_PRR"
];

_uniform_glasses = 
[
	//glassess balaclava's
];

_uniform_helmet = 
[
	"rhsusf_lwh_helmet_M1942",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatwd_blk_ess",
	"rhsusf_lwh_helmet_marpatwd_ess"
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
	"rhsusf_spc_rifleman"
];

_bis_items = 
[
	"binocular"
];

_bis_magazines = 
[

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
			(_weapons + _launchers), 
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks + _static)
			];

_array
