_weapon_accessories = [
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_elcan_ard_3d",
	"rhsusf_acc_grip4_bipod",
	"rhsusf_acc_anpeq16a_light_top",
	"rhsusf_acc_elcan_3d"
];

_magazines = [
	//standard mags
];

_weapons = [
	//primary and secondary weapons
	"rhs_weap_m249",
	"rhs_weap_m249_pip",
	"rhs_weap_m249_light_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_ris",
	"rhs_weap_m249_light_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_light_L_elcan"
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

];

_uniform_uniform = 
[
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_FROG01_d"
];

_uniform_vest = 
[
	"rhsusf_spc_light",
	"rhsusf_spc_iar"
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
