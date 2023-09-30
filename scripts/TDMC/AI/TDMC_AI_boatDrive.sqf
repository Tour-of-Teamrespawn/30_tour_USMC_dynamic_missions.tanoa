private ["_pat_distance", "_wps"];

_boat = _this select 0;
_initPos = getPos _boat;
if (typeName (_this select 1) == "ARRAY") then
{
	_wps = _this select 1;
	_Pat_distance = 0;
}else
{
	_wps = [];
	_Pat_distance = _this select 1;
};

while {!isNull _boat} do
{
	if !(canMove _boat) exitWith {};
	_blacklist = [];
	_possiblepos = [];
	if (count _wps > 0) then
	{
		_possiblepos = _wps call BIS_fnc_selectRandom;
	}else
	{
		_possiblepos = [_initPos, 0, _Pat_distance, 10, 2, 1, 0, _blacklist] call BIS_fnc_findSafePos;
	};
	_boat setSpeedmode "LIMITED";
	if (count _possiblepos > 1) then
	{
		if ((str _possiblepos != "[0,0,0]")&& (((ASLToATL [_possiblePos select 0, _possiblePos select 1, 0]) select 2) > 2)) then
		{
			_possiblepos set [2, 0];
			_boat doMove _possiblepos;
			waitUntil {(!isNull _boat) or (!canMove _boat) or (moveToCompleted _boat) or (moveToFailed _boat)};
			sleep 5;
		};
	};
};
