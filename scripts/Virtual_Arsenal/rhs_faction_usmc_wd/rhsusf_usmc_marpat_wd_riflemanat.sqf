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
	"rhsusf_acc_grip4_bipod",
	"rhsusf_acc_anpeq16a_light_top",
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [
	//standard mags
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
	"rhs_weap_M136", 
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_m72a7"
];

_static = 
[
	//static backpacks
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

];

_uniform_bowman = 
[

];

_uniform_glasses = 
[

];

_uniform_helmet = 
[
	"rhsusf_lwh_helmet_M1942",
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatd_headset",
	"rhsusf_lwh_helmet_marpatwd",
	"rhsusf_lwh_helmet_marpatwd_blk_ess",
	"rhsusf_lwh_helmet_marpatwd_headset_blk2",
	"rhsusf_lwh_helmet_marpatwd_headset_blk",
	"rhsusf_lwh_helmet_marpatwd_headset",
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
	"Binocular"
];

_bis_magazines = 
[
	//specific mags.... usually explosives etc
];

_ACE_items =
[	
	//general items
	"ACE_IR_Strobe_Item",
	"ACE_CableTie",
	"ACE_EntrenchingTool",
	"ACE_Chemlight_HiOrange", "ACE_Chemlight_HiRed", "ACE_Chemlight_HiYellow", "ACE_Chemlight_HiWhite", "2ACE_Chemlight_Orange", "ACE_Chemlight_White", "ACE_Chemlight_IR",
	"ACE_ConcertinaWireCoil",

	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_Earplugs",
	"ACE_wirecutter",
	"ACE_MapTools",
	
	//medical common
	"ACE_atropine",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_bodyBag",
	"ACE_bodyBagObject", 
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_packingBandage",
	"ACE_personalAidKit",
	"ACE_tourniquet",

	"ACE_Altimeter"

];

_ctab = 
[
	"ItemMicroDAGR",
	"ItemcTabHCam"
];

_array = [
			(_weapons + _launchers + _static), 
			(_ctab + _ace_items + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks)
			];

_array