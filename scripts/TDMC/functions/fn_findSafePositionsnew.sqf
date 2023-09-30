/*
	Author: _neo_
	Function: fn_findSafePositions
	Example: [position player, 200, -1, 10, 10, 0.5, [0, 359], objNull, [], false] call TOUR_fnc_findSafePositions
	Returns: ARRAY of Positions
	Description: Find safe positions within a circle
	
	Position (ARRAY) - Center position
	Radius (NUMBER) - Maximum distance to center
	Number of positions (NUMBER) - Target position count to be returned, use -1 for unlimited / May not return has many has asked
	Minimum Object Distance (NUMBER) - Minimum distance an object can be near
	Minimum Position Distance (NUMBER)(OPTIONAL) - Minimum distance each safe position much be from others
	Maximum Terrain Gradient (NUMBER)(OPTIONAL) - Maximum terrain gradient/elevation/noise
	Closest Positions First (BOOL)(OPTIONAL) - True to get closest positions first, false to get farthest first
	Can be on Road (BOOL)(OPTIONAL) - True positions can be on road, false if not
	Start/End Angle (ARRAY)(OPTIONAL) - Start and end Angle values - [0, 359] / [359.5, 0.5] / [0, 90]
	Ignored Object (OBJECT)(OPTIONAL) - Object to ignore when checking if position is safe, use objNull for no object
	Blacklisted Positions (ARRAY)(OPTIONAL) - Array of arrays - [[_pos, _dist], [_pos, _dist]]
	Debug (BOOL)(OPTIONAL) - Debug Markers
*/
private ["_center", "_radius", "_count", "_minObjDist", "_minPosDist", "_maxGradient", "_closest", "_onRoad", "_angle", "_ignored", "_blacklisted", "_debug"];
_center = _this select 0;
_radius = _this select 1;
_count = _this select 2;
_minObjDist = _this select 3;
_minPosDist = if (count _this > 4) then { _this select 4 } else { _minObjDist }; if (_minPosDist < _minObjDist) then { _minPosDist = _minObjDist };
_maxGradient = if (count _this > 5) then { _this select 5 } else { 0.500 };
_closest = if (count _this > 6) then { _this select 6 } else { true };
_onRoad = if (count _this > 7) then { _this select 7 } else { true };
_angle = if (count _this > 8) then { _this select 8 } else { [0, 359] }; _angle set [2, if ((_angle select 0) > (_angle select 1)) then {-1} else {+1}];
_ignored = if (count _this > 9) then { _this select 9 } else { objNull };
_blacklisted = if (count _this > 10) then { _this select 10 } else { [] };
_debug = if (count _this > 11) then { _this select 11 } else { false };

//Distance Threshold
private ["_dist"];
_dist = if (_closest) then { _minObjDist } else { _radius };

//Gradient Area
private ["_r", "_p", "_gradientArea"];
_r = _minObjDist / 2;
_p = 3.14;
_gradientArea = _p * (_r * _r);

//List to return
private ["_list"];
_list = [];

while 
{
	(
		(
			_closest
			&&
			_dist < _radius
		)
		||
		(
			!_closest
			&&
			_dist > _minObjDist
		)
	)
	&&
	(
		count _list < _count
		||
		_count == -1
	)
}
do
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
			count (_pos isFlatEmpty [_minObjDist, 0, _maxGradient, 10, 0, false, _ignored]) > 0
			&&
			(
				_onRoad
				||
				(
					count (_pos nearRoads _minObjDist) < 1
					&&
					!(isOnRoad _pos)
				)
			)
			&&
			!(surfaceIsWater _pos)
			&&
			(
				count _list < _count
				||
				_count == -1
			)
		)
		then
		{
			_list set [count _list, _pos];
			//_blacklisted set [count _blacklisted, [_pos, _minPosDist]];
		};
	};
	
	_dist = if (_closest) then { _dist + _minObjDist } else { _dist - _minObjDist };
};

//Debug Markers
if (_debug) then
{
	//Border
	private ["_mkr"];
	_mkr = createMarkerLocal [format ["TOUR_fnc_findSafePositions_%1", _center], _center];
	_mkr setMarkerSizeLocal [_radius, _radius];
	_mkr setMarkerShapeLocal "Ellipse";
	_mkr setMarkerBrushLocal "Border";
	_mkr setMarkerColorLocal "ColorRed";
	
	//Positions
	{
		_mkr = createMarkerLocal [format ["NEO_%1", _x], _x];
		_mkr setMarkerTypeLocal "mil_dot";
		_mkr setMarkerColorLocal "ColorRed";
	} forEach _list;
};

//Return list of positions found
_list;
