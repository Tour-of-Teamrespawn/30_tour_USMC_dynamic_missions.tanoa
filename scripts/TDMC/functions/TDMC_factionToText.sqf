//Faction To Text

_enemyName = switch (toLower TDMC_enemytype) do
{
	case "ind_f" : { "AAF" };
	case "uk3cb_aaf_i" : { "AAF (UK3CB)" };
	case "rhs_faction_vdv" : { "Armed Forces of the Russian Federation" };
	case "uk3cb_baf_faction_army_arctic" : { "British Armed Forces (Arctic)" };
	case "uk3cb_baf_faction_army_mtp" : { "British Armed Forces (MTP)" };
	case "uk3cb_baf_faction_army_tropical": { "British Armed Forces (Tropical)" };
	case "uk3cb_baf_faction_army_woodland": { "British Armed Forces (Woodland)" };
	case "opf_f" : { "CSAT (MTP)" };
	case "opf_t_f" : { "CSAT (Tropical)" };
	case "opf_g_f" : { "FIA (East)" };
	case "ind_g_f" : { "FIA (Independent)" };
	case "guerilla" : { "FIA (West)" };
	case "ind_e_f" : { "LDF" };
	case "blu_f" : { "NATO (MTP)" };
	case "blu_t_f" : { "NATO (Tropical)" };
	case "ind_c_f" : { "Syndikat" };
	case "rhs_faction_usarmy_wd" : { "US Army (MTP)" };
	case "rhs_faction_usarmy_d" : { "US Army (Desert)" };
	case "rhs_faction_usmc_wd" : { "USMC (Woodland)" };
	case "rhsgref_faction_chdkz" : {"CHDKZ"};
	case "uk3cb_tkm_i" : { "Takistani Tribal Fighters" };
	case "uk3cb_tka_o" : { "Takistani Army" };
	case "uk3cb_tkm_o" : { "Takistani Militia" };
	case "uk3cb_cw_us_b_late" : { "US Armed Forces (Cold War)" };
	case "uk3cb_cw_sov_o_late" : { "USSR Armed Forces" };
	case "vn_vc" : { "Vietcong" };
	case "vn_pavn" : { "North Vietnamese Army" };
	default {"error"};
};

_enemyName