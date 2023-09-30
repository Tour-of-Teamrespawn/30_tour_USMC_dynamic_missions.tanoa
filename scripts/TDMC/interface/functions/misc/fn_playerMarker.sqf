private ["_unit", "_name", "_mkr"];
_unit = _this;
_name = name _unit;
_mkr = createMarkerLocal [format ["TDMC_dlg_marker_%1", _name], getPosATL vehicle _unit];

_mkr setMarkerSizeLocal [1,1];
_mkr setMarkerTypeLocal "mil_arrow";
_mkr setMarkerTextLocal format ["%1", _name];
_mkr setMarkerColorLocal "ColorGreen";

while { !isNil { uiNameSpace getVariable "TDMC_dlg_playerMarkers" } } do
{
	_mkr setMarkerPosLocal (getPosATL vehicle _unit);
	_mkr setMarkerDirLocal (getDir vehicle _unit);
	
	sleep 0.1;
};

deleteMarkerLocal _mkr;
