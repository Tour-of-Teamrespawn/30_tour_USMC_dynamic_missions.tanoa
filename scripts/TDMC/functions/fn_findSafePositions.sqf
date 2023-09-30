/*
	Author: _neo_
	Function: fn_findSafePosNear
	Example: 
	Returns: 
*/
private ["_center", "_radius", "_minObjDist", "_minPosDist", "_maxGradient", "_count", "_angle", "_blacklisted"];
_center = _this select 0;
_radius = _this select 1;
_minObjDist = _this select 2;
_minPosDist = _this select 3; if (_minPosDist < _minObjDist) then { _minPosDist = _minObjDist };
_maxGradient = _this select 4;
_count = _this select 5;
_angle = _this select 6; _angle set [count _angle, if ((_angle select 0) > (_angle select 1)) then {-1} else {+1}];
_blacklisted = _this select 7;

private ["_list", "_dist"];
_list = [];
_dist = _minObjDist;

while { _dist < _radius && (_count == -1 || count _list < _count) } do
{
	for "_i" from (_angle select 0) to (_angle select 1) step (_angle select 2) do
	{
		private ["_dir", "_pos"];
		_dir = _i;
		_pos = [_center, _dist, _dir] call BIS_fnc_relPos;
		
		if 
		(
			{ _pos distance (_x select 0) < (_x select 1) } count _blacklisted < 1
			&&
			count (_pos isFlatEmpty [_minObjDist/2, 0, _maxGradient, _minObjDist, 0, false, objNull]) > 0
		)
		then
		{
			_list set [count _list, _pos];
			_blacklisted set [count _blacklisted, [_pos, _minPosDist]];
		};
	};
	
	_dist = _dist + _minObjDist;
};

//Debug Markers
/*
private ["_mkr"];
_mkr = createMarkerLocal [format ["NEO_%1", _center], _center];
_mkr setMarkerSizeLocal [_radius, _radius];
_mkr setMarkerShapeLocal "Ellipse";
_mkr setMarkerBrushLocal "Border";
_mkr setMarkerColorLocal "ColorRed";
{
	_mkr = createMarkerLocal [format ["NEO_%1", _x], _x];
	_mkr setMarkerTypeLocal "mil_dot";
	_mkr setMarkerColorLocal "ColorRed";
} forEach _list;

player globalChat str count _list;
*/

_list;
