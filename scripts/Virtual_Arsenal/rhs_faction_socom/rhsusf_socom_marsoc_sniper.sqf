_weapon_accessories = [

	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq16a",
	"rhsusf_acc_anpeq16a_light",
	
	"rhsusf_acc_rotex5_grey",

	"rhsusf_acc_harris_bipod",
	"rhs_acc_harris_swivel",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_su230_mrds_3d",
	"rhsusf_acc_su230_mrds_c_3d",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_rvg_blk",

	"rhsuf_acc_Premier",
	"rhsuf_acc_Premier_mrds",
	"rhsusf_acc_ACOG_RMR"
];

_magazines = [];

_weapons = [
	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_d",
	"rhs_weap_hk416d145_d_2",
	"rhs_weap_hk416d145_wd",
	"rhs_weap_hk416d145_wd_2",

	"rhs_weap_m40A5",
	"rhs_weap_m40A5_d",
	"rhs_weap_m40A5_wd",

	"rhs_weap_sr25",
	"rhs_weap_sr25_d",
	"rhs_weap_sr25_wd",

	"rhs_weap_m107",
	"rhs_weap_m107_d",
	"rhs_weap_m107_sd",

	"arifle_SDAR_F",
	"rhsusf_weap_glock17g4"
];

_launchers = [

];

_static = 
[
	"rhs_Tow_Gun_Bag",
	"RHS_M2_Gun_Bag",
	"RHS_Mk19_Gun_Bag"
];

_backpacks = 
[
	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_falconii_coy"
];

_uniform_berets = 
[

];

_uniform_boonie = 
[
	"rhs_booniehat2_marpatd",
	"rhs_booniehat2_marpatwd"
];

_uniform_bowman = 
[
	"rhsusf_Bowman",
	"rhsusf_bowman_cap"
];

_uniform_glasses = 
[
	"G_B_Diving"
];

_uniform_helmet = 
[
	"rhsusf_mich_bare_norotos_alt_tan_headset",
	"rhsusf_mich_bare_norotos_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_semi",
	"rhsusf_opscore_mar_ut_pelt",
	"rhsusf_mich_bare_norotos_arc_alt_tan",
	
	"H_Bandanna_gry",
	"H_Bandanna_khk_hs",
	"H_Bandanna_mcamo",
	"H_Watchcap_blk",
	
	"rhsusf_patrolcap_ucp",
	"rhsusf_patrolcap_ocp"
];

_uniform_items = 
[
	"rhsusf_ANPVS_15",
	"rhsusf_bino_lrf_Vector21"
];

_uniform_uniform = 
[
	"U_B_Wetsuit",
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_aor2",
	"rhs_uniform_g3_blk",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_tan",
	"u_b_fullghillie_sard",
	"u_b_ghilliesuit",
	"u_b_t_fullghillie_tna_f"
];

_uniform_vest = 
[
	"V_RebreatherB",
	"rhsusf_mbav",
	"rhsusf_mbav_light"
];

_bis_items = 
[
	"rhsusf_bino_m24",
	"leupold_mk4"
];

_bis_magazines = 
[
	"claymoredirectionalmine_remote_mag"
];

_ACE_items =
[	
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_HuntIR_monitor",
	"ACE_HuntIR_M203",
	"ACE_Kestrel4500",
	"ACE_DAGR",
	"ACE_Vector",
	"ACE_VectorDay",
	"ACE_Yardage450",
	"ACE_MX2A",
	"ACE_SpottingScope",
	"ACE_RangeCard"
];

_ctab = 
[
	"ItemMicroDAGR",
	"ItemAndroid",
	"ItemcTab",
	"ItemcTabHCam"
];

_array = [
			(_weapons + _launchers + _static), 
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_backpacks)
			];

_array
