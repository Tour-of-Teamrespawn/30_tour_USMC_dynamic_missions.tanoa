// Sets viewDistance slowly over time

_startDistance = _this select 0;
_endDistance = _this select 1;
_time = _this select 2;
_timeInc = _this select 3;

_distanceInc = (_endDistance - _startDistance) / (_time / _timeinc);

_increasing = if (_endDistance > _startdistance) then
{
	true
}else
{
	false
};

setViewDistance _startDistance;

while {(_increasing && (viewDistance < _endDistance)) or (!_increasing && (viewDistance > _endDistance))} do
{
	if (_increasing) then
	{
		setViewDistance (viewDistance + _distanceInc)
	}else
	{
		setViewDistance (viewDistance - _distanceInc)
	};
	sleep _timeInc;
};

setViewDistance _endDistance;