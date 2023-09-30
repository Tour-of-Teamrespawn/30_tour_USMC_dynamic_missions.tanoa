// set player to halo position
if (isDedicated) exitWith {};

if !(backpack player == "B_parachute") exitWith
{
	hint (["warning", "You do not have a steerable parachute for HALO!"]call TDMC_fnc_hint);
};

if (str (getMarkerPos "TDMC_haloMarker") != "[0,0,0]") then
{
	player enableSimulation false;
	player allowDamage false;
	_view = viewDistance;
	titleText ["Initiating HALO Jump!", "BLACK OUT",1,true,false];
	1 fadeSound 0;
	sleep 1.5;
	setviewDistance 500;
	player setPosATL [(getMarkerPos "TDMC_haloMarker") select 0, (getMarkerPos "TDMC_haloMarker") select 1, 10000];
	_view spawn
	{
		_distance = viewDistance;
		while {viewdistance < _this} do
		{
			_distance = _distance + 100;
			setViewDistance _distance;
			sleep 1;
		};
		setViewDistance _this;
	};
	sleep 1;
	player enableSimulation true;
	titleText ["", "BLACK IN",1,true,false];
	1 fadeSound 1;
	sleep 10;
	player allowDamage true;
}else
{
	hint "HALO is not currently available.";
};