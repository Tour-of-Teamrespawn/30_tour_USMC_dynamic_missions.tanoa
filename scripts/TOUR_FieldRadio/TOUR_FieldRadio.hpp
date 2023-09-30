/*
	Field Radio Controls, all machines
*/

#define CT_STATIC           0
#define CT_BUTTON           1

#define ST_CENTER         0x02

#define ST_FRAME          0x40

#define	CN_COLOR_1			{0.91,0.15,0.19,1}
#define CN_COLOR_2			{0.90,0.17,0.21,1}
#define CN_COLOR_3			{0.89,0.19,0.23,1}
#define	CN_COLOR_4			{0.88,0.21,0.25,1}
#define	CN_COLOR_5			{0.87,0.23,0.27,1}
#define	CN_COLOR_6			{0.86,0.25,0.29,1}
#define	CN_COLOR_7			{0.85,0.27,0.31,1}
#define	CN_COLOR_8			{0.84,0.29,0.33,1}
#define	CN_COLOR_9			{0.83,0.31,0.35,1}
#define	CN_COLOR_10			{0.82,0.33,0.37,1}

class TOUR_FR_BOX
{ 
	type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	shadow = 2;
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	colorBackground[] = { 0.69,0.75,0.5,0.9 }; 
	text = ""; 
};

class TOUR_FR_RscFrame
{
	type = CT_STATIC;
	idc = -1;
	style = ST_FRAME;
	shadow = 2;
	colorBackground[] = {1,1,1,1};
	colorText[] = {1,1,1,0.8};
	font = "PuristaMedium";
	sizeEx = (safeZoneH / 65) + (safeZoneH / 65);
	text = "";
};

class TOUR_FR_RscButton
{
	access = 0;
	type = CT_BUTTON;
	text = "";
	colorText[] = {0,0,0,1};
	colorDisabled[] = {0.4,0.4,0.4,0};
	colorBackground[] = {0.73,0.73,0.73,0.8};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0.73,0.73,0.75,0.8};
	colorFocused[] = {0.73,0.73,0.73,0.8};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.055589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = (safeZoneH / 95) + (safeZoneH / 95);
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class TOUR_FR_radioControl
{
	idd = 4587;
	movingenable = true;
	enableSimulation = true;
	onLoad = "[] spawn TOUR_fnc_FR_radioSetup;TOUR_var_FR_createDisplayTimer = false;";
	onUnload = "TOUR_var_FR_createDisplayTimer = true;";
	
	class Controls
	{
		class TOUR_FR_background: TOUR_FR_BOX
		{
			idc = -1;
			text = "";
			moving = true;
			x = 0.0358213 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.268192 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = { 0.6941,0.7686,0.4823,0.9 };
		};
		class TOUR_FR_frame: TOUR_FR_RscFrame
		{
			idc = -1;
			text = "TOUR Field Radio";
			x = 0.0461363 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.247562 * safezoneW;
			h = 0.506 * safezoneH;
		};
		//Exit button
		class TOUR_FR_exit: TOUR_FR_RscButton
		{
			idc = 2200;
			text = "Exit";
			x = 0.242123 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0361028 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = (safeZoneH / 120) + (safeZoneH / 120);
			colorText[] = {1,1,1,0.8};
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "closeDialog 0";
		};
		//Channel 1
		class TOUR_FR_channel01_ON: TOUR_FR_RscButton
		{
			idc = 2201;
			text = "Channel 1";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_1;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2201,2202,0] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel01_OFF: TOUR_FR_RscButton
		{
			idc = 2202;
			text = "Channel 1";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_1;
			colorBackgroundActive[] = CN_COLOR_1;
			colorFocused[] = CN_COLOR_1;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2202,2201,0] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 2
		class TOUR_FR_channel02_ON: TOUR_FR_RscButton
		{
			idc = 2211;
			text = "Channel 2";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_2;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2211,2212,1] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel02_OFF: TOUR_FR_RscButton
		{
			idc = 2212;
			text = "Channel 2";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_2;
			colorBackgroundActive[] = CN_COLOR_2;
			colorFocused[] = CN_COLOR_2;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2212,2211,1] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 3
		class TOUR_FR_channel03_ON: TOUR_FR_RscButton
		{
			idc = 2221;
			text = "Channel 3";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_3;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2221,2222,2] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel03_OFF: TOUR_FR_RscButton
		{
			idc = 2222;
			text = "Channel 3";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_3;
			colorBackgroundActive[] = CN_COLOR_3;
			colorFocused[] = CN_COLOR_3;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2222,2221,2] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 4
		class TOUR_FR_channel04_ON: TOUR_FR_RscButton
		{
			idc = 2231;
			text = "Channel 4";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_4;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2231,2232,3] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel04_OFF: TOUR_FR_RscButton
		{
			idc = 2232;
			text = "Channel 4";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_4;
			colorBackgroundActive[] = CN_COLOR_4;
			colorFocused[] = CN_COLOR_4;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2232,2231,3] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 5
		class TOUR_FR_channel05_ON: TOUR_FR_RscButton
		{
			idc = 2241;
			text = "Channel 5";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_5;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2241,2242,4] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel05_OFF: TOUR_FR_RscButton
		{
			idc = 2242;
			text = "Channel 5";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_5;
			colorBackgroundActive[] = CN_COLOR_5;
			colorFocused[] = CN_COLOR_5;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2242,2241,4] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 6
		class TOUR_FR_channel06_ON: TOUR_FR_RscButton
		{
			idc = 2251;
			text = "Channel 6";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_6;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2251,2252,5] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel06_OFF: TOUR_FR_RscButton
		{
			idc = 2252;
			text = "Channel 6";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_6;
			colorBackgroundActive[] = CN_COLOR_6;
			colorFocused[] = CN_COLOR_6;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2252,2251,5] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 7
		class TOUR_FR_channel07_ON: TOUR_FR_RscButton
		{
			idc = 2261;
			text = "Channel 7";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_7;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2261,2262,6] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel07_OFF: TOUR_FR_RscButton
		{
			idc = 2262;
			text = "Channel 7";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_7;
			colorBackgroundActive[] = CN_COLOR_7;
			colorFocused[] = CN_COLOR_7;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2262,2261,6] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 8
		class TOUR_FR_channel08_ON: TOUR_FR_RscButton
		{
			idc = 2271;
			text = "Channel 8";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_8;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2271,2272,7] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel08_OFF: TOUR_FR_RscButton
		{
			idc = 2272;
			text = "Channel 8";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_8;
			colorBackgroundActive[] = CN_COLOR_8;
			colorFocused[] = CN_COLOR_8;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2272,2271,7] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 9
		class TOUR_FR_channel09_ON: TOUR_FR_RscButton
		{
			idc = 2281;
			text = "Channel 9";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_9;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2281,2282,8] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel09_OFF: TOUR_FR_RscButton
		{
			idc = 2282;
			text = "Channel 9";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_9;
			colorBackgroundActive[] = CN_COLOR_9;
			colorFocused[] = CN_COLOR_9;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2282,2281,8] spawn TOUR_fnc_FR_channelSwitch";
		};
		//Channel 10
		class TOUR_FR_channel10_ON: TOUR_FR_RscButton
		{
			idc = 2291;
			text = "Channel 10";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = CN_COLOR_10;
			colorBackground[] = {0.75,0.75,0.75,1};
			colorBackgroundActive[] = {0.75,0.75,0.75,1};
			colorFocused[] = {0.75,0.75,0.75,1};
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2291,2292,9] spawn TOUR_fnc_FR_channelSwitch";
		};
		class TOUR_FR_channel10_OFF: TOUR_FR_RscButton
		{
			idc = 2292;
			text = "Channel 10";
			x = 0.061609 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.154726 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.2,0.2,0.2,0.2,0.8};
			colorBackground[] = CN_COLOR_10;
			colorBackgroundActive[] = CN_COLOR_10;
			colorFocused[] = CN_COLOR_10;
			colorShadow[] = {0.023529,0,0.0313725,1};
			colorBorder[] = {0.023529,0,0.0313725,1};
			action = "[2292,2291,9] spawn TOUR_fnc_FR_channelSwitch";
		};
	};
};

