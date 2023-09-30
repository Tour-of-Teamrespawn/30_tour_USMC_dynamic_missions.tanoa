private ["_marker","_passed_angle","_centrepos","_width","_height","_angle","_shape","_pos","_pos1","_pos2","_pos3","_endofradiusrelative","_endofradiusnew","_newangle","_distance","_newangle2"];

_marker = _this select 0;
_passed_angle = _this select 1;
_centrepos = getmarkerpos _marker;
_width = (getmarkersize _marker select 0);
_height = (getmarkersize _marker select 1);
_angle = markerdir _marker;
_shape = (markershape _marker);
_pos3 = _centrepos;

if (_shape == "ELLIPSE") then
{//Ellipse
	_endofradiusrelative = [(_width * (cos (90 + _passed_angle))), (_height * (sin (90 + _passed_angle)))];
	_endofradiusnew = ([(_centrepos select 0) + (_endofradiusrelative select 0), (_centrepos select 1) + (_endofradiusrelative select 1)]);
	_newangle = ceil (((_centrepos select 0) - (_endofradiusnew select 0)) atan2 ((_centrepos select 1) - (_endofradiusnew select 1)));
	if(_newangle < 0) then 
	{
		_newangle = _newangle + 360;
	};
	_distance = _endofradiusnew distance _centrepos;
	_newangle2 = _newangle + _angle;
	_pos = ([_centrepos, _distance, _newangle2] call BIS_fnc_relPos);
	_pos1 = [ceil (_pos select 0),ceil (_pos select 1), 0];
	
	_endofradiusrelative = [(_width * (cos (90+(360-_passed_angle)))), (_height * (sin (90+(360-_passed_angle))))];
	_endofradiusnew = ([(_centrepos select 0) + (_endofradiusrelative select 0), (_centrepos select 1) + (_endofradiusrelative select 1)]);
	_newangle = ceil (((_centrepos select 0) - (_endofradiusnew select 0)) atan2 ((_centrepos select 1) - (_endofradiusnew select 1)));
	if(_newangle < 0) then 
	{
		_newangle = _newangle + 360;
	};
	_distance = _endofradiusnew distance _centrepos;
	_newangle2 = _newangle + _angle;
	_pos = ([_centrepos, _distance, _newangle2] call BIS_fnc_relPos);
	_pos2 = [ceil (_pos select 0),ceil (_pos select 1), 0];	
	_distance = _pos1 distance _pos2;
	_width = _distance / 2;
	
	_pos3 = [_pos1, (_distance / 2), ([_pos1,_pos2]call BIS_fnc_dirTo)]call BIS_fnc_relPos;
	
};

[_pos3, _width]