_unit = _this select 0;
_player = _this select 1;

_player directSay "TDMC_gotthebastard";

if (!isNil "TDMC_MIS_bossAction") then
{
	_unit removeAction TDMC_MIS_bossAction;
};

if (isServer) then
{
	[]spawn
	{
		sleep 3;
		TDMC_MIS_assassinatecomplete = true;
	};
};