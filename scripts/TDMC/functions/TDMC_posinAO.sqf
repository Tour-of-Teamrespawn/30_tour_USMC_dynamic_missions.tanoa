/*
	File: inTrigger.sqf
	Author: Karel Moricky

	Description:
	Detects whether is position within trigger area.

	Parameter(s):
		_this select 0: Trigger
		_this select 1: Position
		_this select 2: OPTIONAL - scalar result (distance from border)

	Returns:
	Boolean (true when position is in area, false if not).
	
	MODIFIED BY MR.BEN, TO WORK WITH MARKERS RATHER THAN TRIGGERS + FIXED ELLIPSE AND RECTANGLE WHICH DIDNT WORK WITH LARGER SIZES
*/
private ["_marker","_object","_posx","_posy","_tarea","_tx","_ty","_tdir","_tshape","_in","_dir"];

_marker = _this select 0;
_position = _this select 1;
_scalarresult = if (count _this > 2) then {_this select 2} else {false};

_posx = (getMarkerPos _marker) select 0;
_posy = (getMarkerPos _marker) select 1;
_tx = (markerSize _marker) select 0; 
_ty = (markerSize _marker) select 1;
_tdir = markerDir _marker;
_tshape = markerShape _marker;
_in = false;

if (_tshape == "RECTANGLE") then {

	//--- RECTANGLE
	_difx = (_position select 0) - _posx;
	_dify = (_position select 1) - _posy;
	_dir = atan (_difx / _dify);
	if (_dify < 0) then {_dir = _dir + 360};
	_relativedir = _tdir - _dir;
	_adis = abs (_tx / cos (90 - _relativedir));
	_bdis = abs (_ty / cos _relativedir);
	_borderdis = _adis min _bdis;
	_positiondis = _position distance (getMarkerPos _marker);

	_in = if (_scalarresult) then {
		_positiondis - _borderdis;
	} else {
		if (_positiondis < _borderdis) then {true} else {false};
	};

} else {
	//--- ELLIPSE---- COMPLETELY REWROTE BY MR.BEN
	_centre = getMarkerPos _marker;
	_markerdir = markerDir _marker;
	_markersize = getmarkerSize _marker;
//	hint ((str _markersize) + " " + (str _markerDir) + " " + (str _position));
	_dir = _centre getDir _position;
	_relative =  [((_markersize select 0) * (cos (90 - _dir))),((_markersize select 1) * (sin (90 - _dir)))];
	_endofradiusnew = ([(_centre select 0) + (_relative select 0), (_centre select 1) + (_relative select 1)]);
	_distance1 = _endofradiusnew distance _centre;
	_distance2 = _position distance _centre;;
	if (_distance1 < _distance2) then
	{
		_in = false;
	}else
	{
		_in = true;
	};
	//_internal
};

_in
