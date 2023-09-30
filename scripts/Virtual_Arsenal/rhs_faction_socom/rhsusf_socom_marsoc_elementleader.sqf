_weapon_accessories = [
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [

];

_weapons = [
	"rhs_weap_hk416d10_m320",
	"rhs_weap_hk416d145_m320"
];

_launchers = [

];

_static = 
[
];

_backpacks = 
[
];

_uniform_berets = 
[

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
	"rhsusf_opscore_paint",
	"rhsusf_opscore_paint_pelt",
	"rhsusf_opscore_paint_pelt_nsw",
	"rhsusf_opscore_paint_pelt_nsw_cam",
	"rhsusf_opscore_rg_cover",
	"rhsusf_opscore_rg_cover_pelt",
	"rhsusf_opscore_ut",
	"rhsusf_opscore_ut_pelt",
	"rhsusf_opscore_ut_pelt_cam",
	"rhsusf_opscore_ut_pelt_nsw",
	"rhsusf_opscore_ut_pelt_nsw_cam",
	"rhsusf_opscore_mar_fg",
	"rhsusf_opscore_mar_fg_pelt",
	"rhsusf_opscore_mar_ut",
	"rhsusf_opscore_mar_ut_pelt"
];

_uniform_items = 
[
	//nvg's
];

_uniform_uniform = 
[
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_tan"
];

_uniform_vest = 
[
	//vests
];

_bis_items = 
[
	//binos GPS etc
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
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks)
			];

_array
