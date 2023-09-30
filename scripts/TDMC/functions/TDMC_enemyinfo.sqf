//create radio message
if (!isServer) exitWith {};
private ["_player", "_pos", "_pos1", "_pos2", "_array", "_array1", "_array2", "_name"];
_player = _this;	
if (count TDMC_AI_EOA_array > 0) then
{
	_pos = getPosATL (vehicle (leader (TDMC_AI_EOA_array call BIS_fnc_selectRandom)));
	_array1 = [];
	_pos1 = str (round (_pos select 0));
	_pos1 = toArray _pos1;
	if (count _pos1 == 3) then
	{	
		_pos1 = [48] + [48] +_pos1;
	};	
	if (count _pos1 == 4) then
	{
		_pos1 = [48] +_pos1;
	};	
	{
		if (_forEachIndex < 3) then
		{
			_array1 set [count _array1, _x];
		};
	}forEach _pos1;
	_array2 = [];
	_pos2 = str (round (_pos select 1));
	_pos2 = toArray _pos2;
	if (count _pos2 == 3) then
	{
		_pos1 = [48] + [48] +_pos1;
	};
	if (count _pos2 == 4) then
	{
		_pos1 = [48] +_pos1;
	};
	{
		if (_forEachIndex < 3) then
		{
			_array2 set [count _array2, _x];
		};
	}forEach _pos2;
	_array = "[" + (toString _array1) + "," + (toString _array2) + "]";
	[[_array, _player], {
		_name = (str (group (_this select 1))) call TDMC_fnc_groupnamefix;
		enableRadio true;
		sleep 1;
		(_this select 1) sideChat format ["HQ, this is %1, requesting information on enemy locations. OVER", _name];
		sleep 3;
		TDMC_HQ sideChat (format ["%2, UAV recon indicates possible enemy presence in %1, OUT", (_this select 0), _name]);
		sleep 1;
		enableRadio false;
	}] remoteExec ["spawn"];

}else
{
	[[_player], {
		_name = (str (group (_this select 1))) call TDMC_fnc_groupnamefix;
		enableRadio true;
		sleep 1;
		(_this select 0) sideChat format ["HQ, this is %1, requesting information on enemy locations. OVER", _name];
		sleep 3;
		TDMC_HQ sideChat format ["%1, UAV recon indicates no enemy presence in the AO, OUT", _name];
		sleep 1;
		enableRadio false;
	}] remoteExec ["spawn"];
};
sleep 6;
TOUR_SI_core setVariable ["TOUR_SI_inUse", nil, true];