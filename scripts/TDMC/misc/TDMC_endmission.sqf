_player = _this select 0;
_officer = _this select 1;
_task = _this select 2;

if (isServer) then 
{
	TDMC_mission_complete = true;
};

_player directSay "TDMC_reportingback";
sleep 5;
_officer directSay "TDMC_welcomeback";
sleep 5;

if ((_task call A2S_taskState) != "SUCCEEDED") then
{
	_player directSay "TDMC_playernotgood";
	sleep 5;
	_officer directSay "TDMC_officernotgood";
}else
{
	_player directSay "TDMC_playergood";
	sleep 5;
	_officer directSay "TDMC_officergood";
};
sleep 3;
if (isServer) then 
{
	TDMC_mission_running = false;
};

