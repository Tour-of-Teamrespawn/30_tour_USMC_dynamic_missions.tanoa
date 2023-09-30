TDMC_garbagearray = [];
private ["_arrayold", "_array", "_unit", "_time", "_grp"];

while {true} do
{
	if (count TDMC_garbagearray > 0) then
	{
		{
			_array = _x;
			_unit = (_array select 0);
			_time = (_array select 1);
			
			if (count _array == 3) then
			{
				_grp = _array select 2;
				if ((!isNull _grp)&&(({alive _x}count units _grp) == 0)) then
				{
					deleteGroup _grp;
				};
			};

			if (!isNull _unit) then
			{
				if (_unit isKindOf "man") then
				{
					if ((_time + 900) < time) then
					{
						hideBody _unit;
					};
				}else
				{
					if (((({(alive _x)&&(_x in playableUnits)} count nearestObjects [_unit, ["landvehicle", "man", "air"], 1000]) == 0))or((_time + 1800) < time)) then
					{
						deleteVehicle _unit;
					};
				};
			};
		}forEach TDMC_garbagearray;
		
		_arrayold = TDMC_garbagearray;
		TDMC_garbagearray = [];
		{
			if (!isNull (_x select 0)) then
			{
				TDMC_garbagearray set [count TDMC_garbagearray, _x];
			};
		}forEach _arrayold;
			
	};
	sleep 10;
};

