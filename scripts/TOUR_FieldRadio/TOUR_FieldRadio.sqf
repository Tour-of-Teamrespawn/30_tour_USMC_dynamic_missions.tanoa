/*
	Functions for radio interface. Run on startup.
*/
TOUR_FR_CORE = [_this,0,objNull,[objNull]] call BIS_fnc_param;
TOUR_FR_multiChan = [_this,1,true,[true]] call BIS_fnc_param;
TOUR_var_FR_createDisplayTimer = false;

if ((isServer)&& !(isNull TOUR_FR_CORE)) then
{
	private ["_r1","_r2","_r3","_r4","_r5","_r6","_r7","_r8","_r9","_r10"];
	_r1 = radioChannelCreate [[0.91,0.15,0.19,1],"Channel 1","Chan1: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r2 = radioChannelCreate [[0.90,0.17,0.21,1],"Channel 2","Chan2: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r3 = radioChannelCreate [[0.89,0.19,0.23,1],"Channel 3","Chan3: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r4 = radioChannelCreate [[0.88,0.21,0.25,1],"Channel 4","Chan4: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r5 = radioChannelCreate [[0.87,0.23,0.27,1],"Channel 5","Chan5: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r6 = radioChannelCreate [[0.86,0.25,0.29,1],"Channel 6","Chan6: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r7 = radioChannelCreate [[0.85,0.27,0.31,1],"Channel 7","Chan7: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r8 = radioChannelCreate [[0.84,0.29,0.33,1],"Channel 8","Chan8: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r9 = radioChannelCreate [[0.83,0.31,0.35,1],"Channel 9","Chan9: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	_r10 = radioChannelCreate [[0.82,0.33,0.37,1],"Channel 10","Chan10: %UNIT_GRP_NAME (%UNIT_NAME)",[],true];
	
	TOUR_FR_CORE setVariable
	[
		"TOUR_var_FR_radioChannels",
		[
			[_r1,false,[2201,2202],"Channel 01"],
			[_r2,false,[2211,2212],"Channel 02"],
			[_r3,false,[2221,2222],"Channel 03"],
			[_r4,false,[2231,2232],"Channel 04"],
			[_r5,false,[2241,2242],"Channel 05"],
			[_r6,false,[2251,2252],"Channel 06"],
			[_r7,false,[2261,2262],"Channel 07"],
			[_r8,false,[2271,2272],"Channel 08"],
			[_r9,false,[2281,2282],"Channel 09"],
			[_r10,false,[2291,2292],"Channel 10"]
		],
		true
	];
};

if ((!isDedicated)&& !(isNull TOUR_FR_CORE)) then
{
	waitUntil { !(isNil { TOUR_FR_CORE getVariable "TOUR_var_FR_radioChannels" }) };
	TOUR_FR_radio = (TOUR_FR_CORE getVariable "TOUR_var_FR_radioChannels");

	TOUR_fnc_FR_radioSetup =
	{
		private  ["_b"];
		_b = 2201;
		{
			ctrlShow [_b,!(_x select 1)];
			ctrlShow [(_b+1),(_x select 1)];
			ctrlSetText [_b,(_x select 3)];
			ctrlSetText [(_b+1),(_x select 3)];
			_b = (_b+10);
		} forEach TOUR_FR_radio;
	};

	TOUR_fnc_FR_channelSwitch =
	{
		if ((count _this)==3) then
		{
			ctrlShow [(_this select 0),false];
			ctrlShow [(_this select 1),true];
			private ["_cc"];
			_cc = (TOUR_FR_radio select (_this select 2));
			_cc set [1,!(_cc select 1)];
			TOUR_FR_radio set [(_this select 2),_cc];
			
			if (_cc select 1) then
			{
				(_cc select 0) radioChannelAdd [player];
				if (!TOUR_FR_multiChan) then
				{
					{
						if (((_cc select 0)!=(_x select 0))&&(_x select 1)) then
						{
							_x set [1,false];
							(_x select 0) radioChannelRemove [player];
							ctrlShow [((_x select 2) select 0),true];
							ctrlShow [((_x select 2) select 1),false];
						};
					} forEach TOUR_FR_radio;
				};
			}
			else
			{
				(_cc select 0) radioChannelRemove [player];
			};
		};
	};

	[] spawn
	{
		sleep 1;
		while { true } do
		{
			if ((((alive player)&&(!("ItemRadio" in (assignedItems player))))||(!(alive player)))&&(({ (_x select 1) } count TOUR_FR_radio)>0)) then
			{
				{
					if (_x select 1) then
					{
						_x set [1,false];
						(_x select 0) radioChannelRemove [player];
					};
				} forEach TOUR_FR_radio;
			};
			sleep 0.5;
		};
	};
	
	player addAction ["<t color=""#99cc66"">"+"FIELD RADIO", "scripts\TOUR_FieldRadio\TOUR_FieldRadioAction.sqf", "", 0, false, true, "", "(alive player) && (""ItemRadio"" in (assignedItems player))"];
	player addEventHandler ["Respawn" ,{player addAction ["<t color=""#99cc66"">"+"FIELD RADIO", "scripts\TOUR_FieldRadio\TOUR_FieldRadioAction.sqf", "", 0, false, true, "", "(alive player) && (""ItemRadio"" in (assignedItems player))"];}];
};

_div = "----------------------------------------";
player createDiarySubject ["About", "About"];
player createDiaryRecord
[
	"About",
	[
		"Tour Field Radio",
		format ["%1 <br/><br/><font face='PuristaBold'><font size=18>Tour Field Radio</font></font> <br/>Created by: Outlander <br/>Version: RC1 <br/><br/>%1 <br/><br/>Description: <br/><br/>A menu for custom radio channels. Any player equipped with a radio can bring up the menu, and use any or all of the 10 custom radio channels. <br/><br/>%1 <br/><br/>Usage: <br/><br/>To bring up the menu, you must use the mouse wheel selectable action 'FIELD RADIO'.<br/><br/>%1 <br/><br/>In the menu, you will find one button for each available radio channel. <br/>* Press the button for the channel you wish to open. <br/>* The button will become colored, indicating that the channel is open. <br/>* You can now scroll to the channel in your chat menu, and use it for text- and voicechat, just like any of the default channels. <br/>* Press the button again to close the channel, the button will turn grey again. <br/><br/>%1 <br/>",_div]
	]
];

