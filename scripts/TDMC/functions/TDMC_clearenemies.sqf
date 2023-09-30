
if (count TDMC_mission_units > 0) then
{
	{
		if (!isNull _x) then
		{
			deleteVehicle _x;
		};
	}forEach TDMC_mission_units;
};
TDMC_mission_units = [];

if (count TDMC_mission_groups > 0) then
{
	{
		if (!isNull _x) then
		{
			deleteGroup _x;
		};
	}forEach TDMC_mission_groups;
};
TDMC_mission_groups = [];

if (count TDMC_mission_objects > 0) then
{
	{
		if (typeName _x == "STRING") then
		{
			deleteMarker _x;
		}else
		{
			if (!isNull _x) then
			{
				deleteVehicle _x;
			};
		};
	}forEach TDMC_mission_objects;
};
TDMC_mission_objects = [];

{
	if (!isNull _x) then
	{
		deleteVehicle _x;
	};
}forEach (TDMC_core getVariable "TOUR_IEDs");
TDMC_core setVariable ["TOUR_IEDs", [], true];