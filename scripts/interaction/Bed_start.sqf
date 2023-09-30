private ["_bed", "_dir", "_anim"];
waitUntil {player == player};

_numarray = (toArray (str player));
_last = [_numarray select 12];
if (count _numarray > 12) then {_last = _last + [_numarray select 13]};
_new = toString _last;
_bed = call compile format ["TOUR_bed_%1", _new];

switch (floor random 2) do
{
	case 0: {_anim = "Acts_InjuredLyingRifle01";_dir = (getDir _bed - 20)};
	case 1: {_anim = "Acts_InjuredLyingRifle02";_dir = (getDir _bed - 20)};
	case 2: {_anim = "Acts_LyingWounded_loop";_dir = (getDir _bed)};
};


[player, _anim ] remoteExec ["switchMove", 0];
_pos = _bed modelToWOrld [0,-0.3,1.25];
player setDir _dir;
player setposATL _pos;
titleText ["", "BLACK OUT",0,true,false];
sleep 3;
titleText ["", "BLACK IN",2,true,false];
sleep 2;
titleText ["", "BLACK OUT",2,true,false];
sleep 2;
titleText ["", "BLACK IN",2,true,false];
sleep 2;

player addAction ["Get Out Of Bed", "scripts\interaction\Bed_Exit.sqf", true, 0, false, true, "", ""];

