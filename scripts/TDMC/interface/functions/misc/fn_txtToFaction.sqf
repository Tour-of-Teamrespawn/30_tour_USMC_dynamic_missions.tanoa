//Text To Faction

_return = switch (toLower _this) do
{
	case "aaf" : { "IND_F" };
	case "aaf (uk3cb)" : { "UK3CB_AAF_I" };
	case "armed forces of the russian federation" : { "rhs_faction_vdv" };
	case "british armed forces (arctic)" : { "uk3cb_baf_faction_army_arctic" };
	case "british armed forces (mtp)" : { "uk3cb_baf_faction_army_mtp" };
	case "british armed forces (tropical)": { "uk3cb_baf_faction_army_tropical" };
	case "british armed forces (woodland)": { "uk3cb_baf_faction_army_woodland" };
	case "csat (mtp)" : { "OPF_F" };
	case "csat (tropical)" : { "OPF_T_F" };
	case "chdkz" : { "rhsgref_faction_chdkz" };
	case "fia (east)" : { "OPF_G_F" };
	case "fia (independent)" : { "IND_G_F" };
	case "fia (west)" : { "Guerilla" };
	case "ldf" : { "IND_E_F" };
	case "nato (mtp)" : { "BLU_F" };
	case "nato (tropical)" : { "BLU_T_F" };
	case "syndikat" : { "IND_C_F" };
	case "us armed forces (cold war)" : { "uk3cb_cw_us_b_late" };
	case "ussr armed forces" : { "uk3cb_cw_sov_o_late" };
	case "us army (mtp)" : { "rhs_faction_usarmy_wd" };
	case "us army (desert)" : { "rhs_faction_usarmy_d" };
	case "usmc (woodland)" : { "rhs_faction_usmc_wd" };
	case "takistani tribal fighters" : { "uk3cb_tkm_i" };
	case "takistani army" : { "uk3cb_tka_o" };
	case "takistani militia" : { "uk3cb_tkm_o" };
	case "vietcong" : { "vn_vc" };
	case "north vietnamese army" : { "vn_pavn" };
	default {"error"};
};

_return