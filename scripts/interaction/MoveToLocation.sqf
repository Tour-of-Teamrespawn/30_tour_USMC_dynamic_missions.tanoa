// set player to new position
if (isDedicated) exitWith {};

player enableSimulation false;
player allowDamage false;
_view = viewDistance;
titleText [format ["Moving To %1!", _this select 1], "BLACK OUT",1,true,false];
1 fadeSound 0;
sleep 1.5;
setviewDistance 500;
player setPosATL (_this select 0);
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
sleep 5;
player allowDamage true;
