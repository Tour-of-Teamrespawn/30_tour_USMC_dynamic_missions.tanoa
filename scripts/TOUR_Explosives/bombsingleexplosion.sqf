_pos = _this;

_object_array = (nearestObjects [_pos,["Land_Ind_Oil_Tower_EP1", "Land_Ind_Oil_Pump_EP1"],250]);
if (isServer) then
{
	{
		if (damage _x < 1) then 
		{
			_pos = getPosATL _x;
			sleep 0.7;_secondary = "ammo_Bomb_SDB" createVehicle [getposATL _x select 0, getPosATL _x select 1, 0.3];_x setdamage 1;
			if ((_x iskindof "Land_Ind_Oil_Tower_EP1")or(_x iskindof "Land_Ind_Oil_Pump_EP1")) then
			{
				_s = "#particlesource" createVehicleLocal (getpos _pos);
				_s setParticleClass "SmokeMedium";
				_f = "#particlesource" createVehicleLocal (getpos _pos);
				_f setParticleClass "MediumDestructionFire";
				_s setPos _pos;
				_f setPos _pos;
				[_s, _f] spawn
				{
					waitUntil {!TDMC_mission_running};
					deleteVehicle (_this select 0);
					deleteVEhicle (_this select 1);
				};
			};
		};
	}foreach _object_array;
	TDMC_bombs_detonated = true;
}else
{
	{
		_pos = getPosATL _x;
		sleep 0.7;_x setdamage 1;
		if ((_x iskindof "Land_Ind_Oil_Tower_EP1")or(_x iskindof "Land_Ind_Oil_Pump_EP1")) then
		{
			_s = "#particlesource" createVehicleLocal (getpos _pos);
			_s setParticleClass "SmokeMedium";
			_f = "#particlesource" createVehicleLocal (getpos _pos);
			_f setParticleClass "MediumDestructionFire";
			_s setPos _pos;
			_f setPos _pos;
			[_s, _f] spawn
			{
				waitUntil {!TDMC_mission_running};
				deleteVehicle (_this select 0);
				deleteVEhicle (_this select 1);
			};
		};
	}foreach _object_array;
};