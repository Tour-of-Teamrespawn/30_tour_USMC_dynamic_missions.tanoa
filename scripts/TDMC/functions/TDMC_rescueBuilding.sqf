private ["_bInfo"];

_bInfo = switch (toLower worldName) do 
{
	case "cup_chernarus_a3": {["Land_IndustrialShed_01_F", [1, 2, 12, 19, 20]]};
	case "cam_lao_nam": {["Land_vn_o_prop_cong_cage_01", [0]]};
	case "altis": {["Land_i_Shed_Ind_F", [0, 2]]};
	case "lythium": {["Land_i_Shed_Ind_F", [0, 2]]};
	case "enoch": {["Land_IndustrialShed_01_F", [1, 2, 12, 19, 20]]};
	case "takistan": {["Land_House_C_10_EP1", [0, 4, 5, 10]]};
	case "tanoa": {["Land_i_Shed_Ind_F", [0, 2]]};
};

_bInfo
