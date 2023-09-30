private ["_position"];

_building = _this select 0;
_pos = _this select 1;

_spawn = (_building buildingpos _pos);

_grp = createGroup TDMC_playerSide; 
waitUntil {!isNull _grp};

_manType = switch (toLower TDMC_playerfaction) do 
{
	case "b_macv": {"vn_b_men_sog_23"};
	case "vn_vc": {"vn_o_men_vc_local_16"};
	case "vn_nva": {"vn_o_men_nva_06"};
	case "rhsgref_faction_cdf_ground": {"rhsgref_cdf_reg_rifleman"};
	case "uk3cb_baf_faction_army_mtp": {"uk3cb_baf_rifleman_mtp"};
	case "uk3cb_baf_faction_army_woodland": {"uk3cb_baf_rifleman_dpmw"};
	case "rhs_faction_usarmy_d": {"rhsusf_army_ocp_rifleman"};
	case "uk3cb_tkm_o": {"uk3cb_tkm_o_rif_1"};
	case "uk3cb_cw_sov_o_late": {"uk3cb_cw_sov_o_late_vdv_rif_1"};
	case "rhs_faction_usarmy_wd": {"rhsusf_army_ucp_rifleman"};
	case "rhs_faction_usmc_wd": {"rhsusf_usmc_marpat_wd_rifleman_light"};
	case "uk3cb_aaf_i": {"uk3cb_aaf_i_rif_1"};
	case "uk3cb_tkm_i": {"uk3cb_tkm_i_rif_1"};
	default {"rhsgref_cdf_reg_rifleman"};
};

TDMC_captiveUnit = _grp createUnit [ _manType, [0,0,0], [], 0, "FORM"];
sleep 1;
//hint str TDMC_captiveUnit;
TDMC_captiveUnit setCaptive true;
TDMC_captiveUnit setDamage 0.7; 
TDMC_captiveUnit setvariable ["ACE_isUnconscious", true, true];
TDMC_captiveUnit setUnconscious true;
TDMC_mission_units set [count TDMC_mission_units, TDMC_captiveUnit];
TDMC_mission_groups set [count TDMC_mission_groups, _grp];
removeAllWeapons TDMC_captiveUnit;

sleep 1;
TDMC_captiveUnit setPos _spawn;
TDMC_captiveUnit setDir ((getDir _building) +  180);

waitUntil {sleep 1; (TDMC_captiveUnit distance _spawn > 4) or (isNull TDMC_captiveUnit)};

if(!isNull TDMC_captiveUnit) then 
{
	if (alive TDMC_captiveUnit) then 
	{
		TDMC_captiveUnit setCaptive false;
	};
};
