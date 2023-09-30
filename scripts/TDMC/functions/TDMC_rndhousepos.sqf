/*
	Find usable buildings within a given distance and select a random position
	
	by mr.ben
	
	usage: pass array of 
	0 = position, array, 3d/2d co-ord
	1 = distance, integer
*/

private ["_buildings", "_positions", "_pos", "_test", "_house", "_max"];

_positions = [];
_buildings = [];

switch (toLower worldName) do
{
	case "chernarus":
	{
		{
			if (((_this select 0) distance _x) < (_this select 1)) then
			{
				_positions set [count _positions, _x];
			};
		}forEach ("PatrolPoints" call TDMC_fnc_locations);
		
		if (count _positions > 0) then 
		{
			_centrepos = _positions call BIS_fnc_selectRandom;
			_buildings = _centrepos nearObjects ["House", 250];			
		};
	};
	case "takistan":
	{
		_buildings = nearestobjects [(_this select 0), ["Land_House_L_8_EP1","Land_House_C_1_EP1","Land_House_C_1_v2_EP1","Land_House_C_2_EP1","Land_House_C_3_EP1","Land_House_C_4_EP1","Land_House_C_5_EP1","Land_House_C_5_V2_EP1","Land_House_C_5_V3_EP1","Land_House_C_9_EP1","Land_House_C_10_EP1","Land_House_C_11_EP1","Land_House_C_12_EP1","Land_House_L_3_EP1","Land_House_L_4_EP1","Land_House_L_6_EP1","Land_House_L_7_EP1","Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1","Land_House_K_8_EP1"], (_this select 1)];
	};
};

_test = 0;

if (count _buildings == 0) exitWith 
{
	_pos = [0,0,0]; 
	_pos
};

_house = _buildings call BIS_fnc_selectRandom;
while { format ["%1", _house buildingPos _test] != "[0,0,0]" } do {_test = _test + 1;};
_max = _test - 1;

if (1 > _max) exitWith 
{
	_pos = [0,0,0]; 
	_pos
};

_pos = _house buildingPos (random (floor (_max + 1)));

_pos