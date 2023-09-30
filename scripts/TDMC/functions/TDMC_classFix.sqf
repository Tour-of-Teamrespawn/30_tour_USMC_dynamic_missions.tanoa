private ["_class"];

if (((toLower TDMC_enemytype) in ["opf_f","opf_t_f"])&&(toLower _this == "motorized")) then 
{
	_class = "Motorized_MTP";
}else
{
	_class = _this;
};

_class