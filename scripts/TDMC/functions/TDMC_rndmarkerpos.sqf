/*
	RANDOM MARKER INTERNAL POSITION GENERATOR
	by Mr.Ben

	parmas passed in array:

	0 = marker name, string
*/

private ["_marker", "_centrepos", "_pos", "_width", "_height", "_angle", "_shape", "_random_angle", "_endofradiusrelative", "_endofradiusnew", "_newangle", "_centrepos", "_distance", "_newangle2", "_random_distance", "_fullwidth", "_fullheight"];

_marker = (_this select 0);
_centrepos = getmarkerpos _marker;
_pos = [0,0,0];
_width = (getmarkersize _marker select 0);
_height = (getmarkersize _marker select 1);
_angle = markerdir _marker;
_shape = (markershape _marker);
  
if (_shape == "ELLIPSE") then
{//ellipse
	_random_angle = 0;
	_random_angle = switch (ceil random 4) do
	{
		case 1:
		{
			0 + ceil (random 90);
		};
		case 2:
		{
			90 + ceil (random 90);
		};
		case 3:
		{
			180 + ceil (random 90);
		};
		case 4:
		{
			270 + ceil (random 90);
		};
	};
	_endofradiusrelative = [(_width * (cos _random_angle)), (_height * (sin _random_angle))];
	_endofradiusnew = ([(_centrepos select 0) + (_endofradiusrelative select 0), (_centrepos select 1) + (_endofradiusrelative select 1)]);
	_newangle = ceil (((_centrepos select 0) - (_endofradiusnew select 0)) atan2 ((_centrepos select 1) - (_endofradiusnew select 1)));
	if(_newangle < 0) then 
	{
		_newangle = _newangle + 360;
	};
	_distance = _endofradiusnew distance _centrepos;
	_newangle2 = _newangle + _angle;
	_random_distance = ceil (random _distance);
	_pos = ([_centrepos, _random_distance, _newangle2] call BIS_fnc_relPos);
	_pos = [ceil (_pos select 0),ceil (_pos select 1), 0];
}
else
{//rectangle
	_fullwidth = _width * 2;
	_fullheight = _height * 2;
	_pos = [(((_centrepos select 0) - _width) + (ceil (random _fullwidth))), (((_centrepos select 1) - _height) + (ceil (random _fullheight)))];
	_newangle = ((_centrepos select 0) - (_pos select 0)) atan2 ((_centrepos select 1) - (_pos select 1));
	if(_newangle < 0) then {_newangle = _newangle + 360;};
	_distance = _pos distance _centrepos;
	_newangle2 = _newangle + _angle;
	_pos = ([_centrepos, (ceil _distance), _newangle2] call BIS_fnc_relPos);
};

_pos