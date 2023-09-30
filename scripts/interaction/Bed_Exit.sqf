private ["_bed", "_dir"];

_unit = _this select 0;
_id = _this select 2;
_unit removeAction _id;

_numarray = (toArray (str player));
_last = [_numarray select 12];
if (count _numarray > 12) then {_last = _last + [_numarray select 13]};
_new = toString _last;

_bed = call compile format ["TOUR_bed_%1", _new];

[player, "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutlow"] remoteExec ["switchMove", 0];
player setDir (getDir _bed) + 90; 
_pos = _bed modelToWOrld [0.8, 0,0.3];
player setposATL _pos;
