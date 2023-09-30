class TDMC_dlg_aar
{
	idd = 601000;
	movingEnable = 0;
	onLoad = "_this call TDMC_fnc_aar_onLoad";
	onUnload = "_this call TDMC_fnc_aar_onUnload";
	
	class controls
	{
		class TDMC_dlg_aarBackground : TDMC_RscBackground
		{
			idc = -1;
			x = "(safeZoneX + (safeZoneW / 10))";
			y = "(safeZoneY + (safeZoneH / 25))";
			w = "(safeZoneW / 1)";
			h = "(safeZoneH / 1.2)";
			text = "\ca\ui\data\ui_background_video_ca.paa";
		};
		
		class TDMC_dlg_aarYDivisor : TDMC_RscBackground
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 100)";
			y = "safeZoneY + (safeZoneH / 6.5)";
			w = "safeZoneW / 1.010";
			h = "safeZoneH / 100";
			text = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		};
		
		class TDMC_dlg_aarXDivisor : TDMC_RscBackground
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 2.000)";
			y = "safeZoneY + (safeZoneH / 6.300)";
			w = "safeZoneW / 250";
			h = "safeZoneH / 1.400";
			text = "scripts\TDMC\interface\img\xDivisor.paa";
		};
		
		class TDMC_dlg_aarLogo : TDMC_RscBackground
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 8)";
			y = "safeZoneY + (safeZoneH / 8.75)";
			w = "(safeZoneW / 30)";
			h = "(safeZoneH / 30)";
			text = "scripts\NEO_radio\img\logo.paa";
		};
		
		class TDMC_dlg_aarTitle : TDMC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 6)";
			y = "safeZoneY + (safeZoneH / 9)";
			w = "safeZoneW / 3.50";
			h = "safeZoneH / 25";
			text = "AFTER ACTION REPORT";
			class Attributes
			{
				color = "#FFFFFF";
				size = "2";
			};
		};
		
		class TDMC_dlg_aarTitleText : TDMC_RscText
		{
			idc = -1;
			text = "Title";
			y = "(safeZoneY + (safeZoneH / 1.620))";
			x = "(safeZoneX + (safeZoneW / 3.550))";
			w = "(safeZoneW / 20)";
			h = "(safeZoneH / 50)";
			class Attributes
			{
				size = "1";
				color = "#FFFFFF";
				align = "center";
			};
		};
		
		class TDMC_dlg_aarTextText : TDMC_dlg_aarTitleText
		{
			idc = -1;
			text = "Text";
			y = "(safeZoneY + (safeZoneH / 1.450))";
		};

		class TDMC_dlg_aarNoteListBackground : TDMC_RscBackground
		{
			idc = 601001;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = "(safeZoneX + (safeZoneW / 2.000))";
			y = "(safeZoneY + (safeZoneH / 1.700))";
			w = "(safeZoneW / 2.100)";
			h = "(safeZoneH / 4.000)";
		};
		
		class TDMC_dlg_aarInputTitle : TDMC_RscEdit 
		{
			idc = 601002;
			text = "Title...";
			x = "(safeZoneX + (safeZoneW / 3.86))";
			y = "(safeZoneY + (safeZoneH / 1.55))";
			w = "(safeZoneW / 10)";
			h = "(safeZoneH / 25)";
			htmlControl = 1;
			autocomplete = 0;
			font = "BitStream";
		};
		
		class TDMC_dlg_aarInputNote : TDMC_dlg_aarinputTitle
		{
			idc = 601003;
			text = "Type your note here...";
			x = "(safeZoneX + (safeZoneW / 7))";
			y = "(safeZoneY + (safeZoneH / 1.4))";
			w = "(safeZoneW / 3.15)";
		};
		
		class TDMC_dlg_aarNotesListBox : TDMC_RscGUIListBox
		{
			idc = 601004;
			text = "";
			rowHeight = 0.08;
			x = "(safeZoneX + (safeZoneW / 1.980))";
			y = "(safeZoneY + (safeZoneH / 1.620))";
			w = "(safeZoneW / 2.700)";
			h = "(safeZoneH / 4.500)";
		};
		
		class TDMC_dlg_aarAddButton : TDMC_RscButton
		{
			idc = 601005;
			text = "Share";
			x = "(safeZoneX + (safeZoneW / 5.5))";
			y = "(safeZoneY + (safeZoneH / 1.205))";
			w = "(safeZoneW / 10)";
			h = "(safeZoneH / 20)";
			default = 1;
		};
		
		class TDMC_dlg_aarClearButton : TDMC_dlg_aarAddButton
		{
			idc = 601006;
			text = "Clear";
			x = "(safeZoneX + (safeZoneW / 3.1))";
		};
		
		class TDMC_dlg_aarDeleteButton : TDMC_dlg_aarAddButton
		{
			idc = 601007;
			text = "Delete Note";
			x = "(safeZoneX + (safeZoneW / 1.900))";
			w = "(safeZoneW / 2.900)";
			class Attributes
			{
				align = "center";
			};
		};
		
		class TDMC_dlg_aarLineBreakButton : TDMC_dlg_aarAddButton
		{
			idc = 601008;
			text = "LineBreak";
			x = "(safeZoneX + (safeZoneW / 2.75))";
			y = "(safeZoneY + (safeZoneH / 1.5))";
			w = "(safeZoneW / 10)";
			h = "(safeZoneH / 20)";
		};
		
		class TDMC_dlg_aarSharedText : TDMC_dlg_aarTitleText
		{
			idc = 601009;
			text = "";
			x = "(safeZoneX + (safeZoneW / 1.500))";
			y = "(safeZoneY + (safeZoneH / 1.720))";
		};
		
		class TDMC_dlg_aarHelpPreview : TDMC_RscText
		{
			idc = 601010;
			text = "";
			x = "(safeZoneX + (safeZoneW / 7.700))";
			y = "(safeZoneY + (safeZoneH / 5.000))";
			w = "(safeZoneW / 2.845)";
			h = "(safeZoneH / 2.650)";
			colorBackground[] = {0,0,0,0.2};
		};
		
		class TDMC_dlg_aarHelpReview : TDMC_dlg_aarHelpPreview
		{
			idc = 601011;
			text = "";
			x = "(safeZoneX + (safeZoneW / 1.920))";
		};
		
		class TDMC_dlg_aarCancel : TDMC_RscButton
		{
			idc = -1;
			action = "closeDialog 0";
			text = "X";
			x = "(safeZoneX + (safeZoneW / 1.185))";
			y = "safeZoneY + (safeZoneH / 14.000)";
			w = "(safeZoneW / 20)";
			h = "safeZoneH / 20";
			default = 1;
			class Attributes
			{
				align = "left";
			};
		};
	};
};
