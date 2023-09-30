private ["_probabilities", "_groundprob", "_vehicleprob", "_mechprob", "_armoredprob", "_chopperprob", "_planeprob", "_gprob", "_vprob", "_aprob", "_sprob", "_string", "_number", "_iedprob", "_iedchance"];

_probabilities = _this;

_groundprob = _probabilities select 0; // infantry
_vehicleprob = _probabilities select 1; // wheeled
_mechprob = _probabilities select 2; // mech
_armoredprob = _probabilities select 3; // armored
_planeprob = _probabilities select 4; // plane
_chopperprob = _probabilities select 5; // chopper 
_boatprob = _probabilities select 6; // chopper 
_iedprob = _probabilities select 7;

_gprob = _groundprob;
_vprob = _vehicleprob;
_aprob = _mechprob + _armoredprob;
_sprob = _chopperprob + _planeprob;
_bprob = _boatprob;

if (_iedprob) then
{
	_iedprob = "High";
}else
{
	_iedprob = "Low";
};

_number = "Negligable";
if (_bprob > 0) then
{
	_number = "Low";
};
if (_bprob > 3) then
{
	_number = "Medium";
};
if (_bprob > 6) then
{
	_number = "High";
};
if (_bprob > 9) then
{
	_number = "Very High";
};					
_bprob = _number;

_number = "Negligable";
if (_sprob > 0) then
{
	_number = "Low";
};
if (_sprob > 1) then
{
	_number = "Medium";
};
if (_sprob > 2) then
{
	_number = "High";
};
if (_sprob > 3) then
{
	_number = "Very High";
};				
_sprob = _number;

_number = "Negligable";
if (_aprob > 0) then
{
	_number = "Low";
};
if (_aprob > 3) then
{
	_number = "Medium";
};
if (_aprob > 6) then
{
	_number = "High";
};
if (_aprob > 9) then
{
	_number = "Very High";
};		
_aprob = _number;

_number = "Negligable";
if (_vprob > 0) then
{
	_number = "Low";
};
if (_vprob > 3) then
{
	_number = "Medium";
};
if (_vprob > 6) then
{
	_number = "High";
};
if (_vprob > 9) then
{
	_number = "Very High";
};		
_vprob = _number;

_number = "Negligable";
if (_gprob > 0) then
{
	_number = "Low";
};
if (_gprob > 3) then
{
	_number = "Medium";
};
if (_gprob > 6) then
{
	_number = "High";
};
if (_gprob > 9) then
{
	_number = "Very High";
};			
_gprob = _number;

_string = format ["Enemy Threat Level:<br/><br/>Infantry: %1<br/>Technicals: %2<br/>Tracked: %3<br/>Aircraft: %4<br/>Naval: %5<br/>IEDs: %6", _gprob, _vprob, _aprob, _sprob, _bprob, _iedprob];

_string