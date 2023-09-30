/*
Description: Removes the faction side from the group name of a unit.
Example:"B Bravo 1-1-A" becomes "Bravo 1-1-A"
Return value: String
Author: Mr.Ben
Tour of Teamrespawn
*/

private ["_playergroup", "_array", "_arraymodified"];
_array = toArray (_this select 0);
_arraymodified = [];
{
	if (_forEachIndex > 1) then
	{
		_arraymodified set [count _arraymodified, _x];
	};
}forEach _array;
_playergroup = toString _arraymodified;

_playergroup