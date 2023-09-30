private ["_array", "_name"];

_array = TDMC_PV_JIPmarkers;
{
	_name = (_x select 0);	
	deleteMarker _name;
}forEach _array;

TDMC_PV_JIPmarkers = [];
publicVariable "TDMC_PV_JIPmarkers";

if (str (getMarkerPos "TDMC_mkr_AO_1") != "[0,0,0]") then
{
	deleteMarker "TDMC_mkr_AO_1";
};

if (str (getMarkerPos "TDMC_haloMarker") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_haloMarker";
};

if (str (getMarkerPos "TDMC_attack_milMarker") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_attack_milMarker";
};

if (str (getMarkerPos "TDMC_attack_posmkr") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_attack_posmkr";
};

if (str (getMarkerPos "TDMC_defend_milMarker") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_defend_milMarker";
};

if (str (getMarkerPos "TDMC_defend_posmkr") != "[0,0,0]") then
{
	deleteMarkerLocal "TDMC_defend_posmkr";
};

//remove defend markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_comppos_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_comppos_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};

// remove convoy markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
	{
	};
	deleteMarkerLocal (format ["TDMC_convoy_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};

// remove river markers
_mkrnumber = 1;
while {true} do
{		
	if (str (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
	{
	};
	deleteMarkerLocal (format ["TDMC_river_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};