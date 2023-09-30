//create diary record for enemy

if !(isDedicated) then
{
	private _enemy = TDMC_enemyType call TDMC_fnc_factionToText;
	
	if (!isNil "TDMC_diaryRecord") then
	{
		player removeDiaryRecord ["Diary", TDMC_diaryRecord];
	};

	TDMC_diaryRecord = player createDiaryRecord 
	["Diary", ["Enemy",( format [
		"
			<font size='20' align='center' color='#0080ff'>Enemy Faction</font>
			<br/>
			<br/>
			The current enemy active in the area of operations are the %1.
			", _enemy])
	]];
};