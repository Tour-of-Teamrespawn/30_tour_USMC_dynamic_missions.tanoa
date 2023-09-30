#include "common.hpp"

class TDMC_dlg_interfaceCreator
{
	idd = 121200;
	onLoad = "_this call TDMC_fnc_cre_onLoad";
	onUnload = "_this call TDMC_fnc_cre_onUnload";

	class controlsBackground
	{
		class TDMC_dlg_background : TDMC_RscBackground
		{
			idc = -1;
			x = "(safeZoneX + (safeZoneW / 10))";
			y = "(safeZoneY + (safeZoneH / 19))";
			w = "(safeZoneW / 1.2)";
			h = "(safeZoneH / 1.10)";
			colorBackground[] = { 0, 0.025, 0.05, 0.8 };
			text = "";
			moving = 0;
		};
		
		class TDMC_dlg_divisor : TDMC_RscBackground
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 8.6)";
			y = "safeZoneY + (safeZoneH / 6.5)";
			w = "safeZoneW / 1.25";
			h = "safeZoneH / 100";
			colorBackground[] = { 0, 0.5, 1, 1 };
			text = "";
			moving = 0;
		};
		
		class TDMC_dlg_logo : TDMC_RscBackground
		{
			idc = -1;
			style = 48;
			x = "safeZoneX + (safeZoneW / 8)";
			y = "safeZoneY + (safeZoneH / 8.75)";
			w = "(safeZoneW / 30)";
			h = "(safeZoneH / 30)";
			text = "scripts\TDMC\interface\img\logo.paa";
		};

		
		class TDMC_dlg_textMain : TDMC_RscText
		{
			idc = 121204;
			x = "(safeZoneX + (safeZoneW / 2))";
			y = "safeZoneY + (safeZoneH / 5)";
			w = "(safeZoneW / 2.55)";
			h = "(safeZoneH / 3.65)";
			text = "";
			colorBackground[] = { 1, 1, 1, 0.1 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				shadowColor = "#000000";
				color = "#FFFFFF";
				size = "2";
			};
		};
		
		class TDMC_dlg_titleText : TDMC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 6)";
			y = "safeZoneY + (safeZoneH / 9)";
			w = "safeZoneW / 3.50";
			h = "safeZoneH / 25";
			text = "DYNAMIC MISSION CREATOR";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes
			{
				color = "#0080ff";
				size = "2";
			};
		};
		
		class TDMC_dlg_textMissionEnemy : TDMC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 8.95)";
			y = "safeZoneY + (safeZoneH / 5)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 50";
			text = "MISSION AND ENEMY";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				color = "#0080ff";
				size = "1";
			};
		};
		
		class TDMC_dlg_textEnviroment : TDMC_dlg_textMissionEnemy
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.690)";
			text = "ENVIRONMENT";
		};
		
		class TDMC_dlg_textMission : TDMC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 8.95)";
			y = "safeZoneY + (safeZoneH / 4.1)";
			w = "safeZoneW / 5.25";
			h = "safeZoneH / 50";
			text = "MISSION PRESET:";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "right";
				valign = "middle";
				color = "#0080ff";
				shadowColor = "#000000";
				size = "0.8";
			};
		};
		
		class TDMC_dlg_textSide : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 3.765)";
			text = "ENEMY SIDE:";
		};
		
		class TDMC_dlg_textFaction : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 3.470)";
			text = "ENEMY FACTION:";
		};
		
		class TDMC_dlg_textSkill : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 3.225)";
			text = "ENEMY SKILL:";
		};
		
		class TDMC_dlg_textRadius : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 3.015)";
			text = "ENEMY PATROL RADIUS:";
		};
		
		class TDMC_dlg_textInfantry : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.825)";
			text = "ENEMY INFANTRY GROUPS:";
		};
		
		class TDMC_dlg_textCars : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.66)";
			text = "ENEMY MOTORIZED GROUPS:";
		};
		
		class TDMC_dlg_textMechanized : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.515)";
			text = "ENEMY MECHANIZED GROUPS:";
		};
		
		class TDMC_dlg_textArmored : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.385)";
			text = "ENEMY ARMORED GROUPS:";
		};
		
		class TDMC_dlg_textChoppers : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.265)";
			text = "ENEMY CHOPPER GROUPS:";
		};
		
		class TDMC_dlg_textPlanes : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.160)";
			text = "ENEMY PLANE GROUPS:";
		};

		class TDMC_dlg_textBoats : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.06)";
			text = "ENEMY BOAT GROUPS:";
		};
		
		class TDMC_dlg_textIeds_0 : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.970)";
			text = "IED'S:";
		};
		
		class TDMC_dlg_textIeds_1 : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.890)";
			text = "MINIMUM IED'S:";
		};
		
		class TDMC_dlg_textIeds_2 : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.800)";
			text = "MAXIMUM IED'S:";
		};
		
		class TDMC_dlg_textTimeOfDay : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.568)";
			text = "TIME OF DAY:";
		};
		
		class TDMC_dlg_textWeather : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.517)";
			text = "WEATHER:";
		};
		
		class TDMC_dlg_textEffects : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.468)";
			text = "FOG:";
		};
		
		class TDMC_dlg_textCivs : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.422)";
			text = "AMBIENT LIFE:";
		};
		
		class TDMC_dlg_textMarkerX : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.378)";
			text = "A.O. X RADIUS:";
		};
		
		class TDMC_dlg_textMarkerY : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.338)";
			text = "A.O. Y RADIUS:";
		};
		
		class TDMC_dlg_textAngle : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.300)";
			text = "A.O. ANGLE:";
		};
		
		class TDMC_dlg_textShape : TDMC_dlg_textMission
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 1.262)";
			text = "A.O. SHAPE:";
		};
		
	};

	class controls
	{

		class TDMC_dlg_map : TDMC_RscMap
		{
			idc = 121201;
			x = "(safeZoneX + (safeZoneW / 2))";
			y = "(safeZoneY + (safeZoneH / 2.1))";
			w = "(safeZoneW / 2.55)";
			h = "(safeZoneH / 2.55)";
		};
		
		class TDMC_dlg_buttonEnd : TDMC_RscButton
		{
			idc = 121202;
			default = 0;
			x = "safeZoneX + (safeZoneW / 8.95)";
			y = "safeZoneY + (safeZoneH / 1.13)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 20";
			text = "END CURRENT MISSION";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
				valign = "top";
			};
		};
		
		class TDMC_dlg_buttonCreate : TDMC_dlg_buttonEnd
		{
			idc = 121203;
			default = 0;
			y = "safeZoneY + (safeZoneH / 1.22)";
			h = "safeZoneH / 20";
			text = "CREATE MISSION";
			align = "center";
			valign = "top";
		};

		class TDMC_dlg_buttonHaloPos : TDMC_dlg_buttonEnd
		{
			idc = 121227;
			default = 0;
			x = "safeZoneX + (safeZoneW / 1.95)";
			h = "safeZoneH / 20";
			text = "CONFIGURE HALO POSITION";
			align = "center";
			valign = "top";
		};

		class TDMC_dlg_comboMission : TDMC_RscComboBox
		{
			idc = 121205;
			x = "safeZoneX + (safeZoneW / 3.30)";
			y = "safeZoneY + (safeZoneH / 4.1)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TDMC_dlg_comboSide : TDMC_dlg_comboMission
		{
			idc = 121206;
			y = "safeZoneY + (safeZoneH / 3.765)";
		};
		
		class TDMC_dlg_comboFaction : TDMC_dlg_comboMission
		{
			idc = 121207;
			y = "safeZoneY + (safeZoneH / 3.470)";
		};
		
		class TDMC_dlg_sliderSkill : TDMC_RscSlider
		{
			idc = 121208;
			x = "safeZoneX + (safeZoneW / 3.30)";
			y = "safeZoneY + (safeZoneH / 3.225)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TDMC_dlg_sliderRadius : TDMC_dlg_sliderSkill
		{
			idc = 121209;
			y = "safeZoneY + (safeZoneH / 3.015)";
		};
		
		class TDMC_dlg_sliderInfantry : TDMC_dlg_sliderSkill
		{
			idc = 121210;
			y = "safeZoneY + (safeZoneH / 2.825)";
		};
		
		class TDMC_dlg_sliderCars : TDMC_dlg_sliderSkill
		{
			idc = 121211;
			y = "safeZoneY + (safeZoneH / 2.66)";
		};
		
		class TDMC_dlg_sliderMechanized : TDMC_dlg_sliderSkill
		{
			idc = 121212;
			y = "safeZoneY + (safeZoneH / 2.515)";
		};
		
		class TDMC_dlg_sliderArmored : TDMC_dlg_sliderSkill
		{
			idc = 121213;
			y = "safeZoneY + (safeZoneH / 2.385)";
		};
		
		class TDMC_dlg_sliderChoppers : TDMC_dlg_sliderSkill
		{
			idc = 121214;
			y = "safeZoneY + (safeZoneH / 2.265)";
		};
		
		class TDMC_dlg_sliderPlanes : TDMC_dlg_sliderSkill
		{
			idc = 121215;
			y = "safeZoneY + (safeZoneH / 2.160)";
		};

		class TDMC_dlg_sliderBoats : TDMC_dlg_sliderSkill
		{
			idc = 121228;
			y = "safeZoneY + (safeZoneH / 2.060)";
		};
		
		class TDMC_dlg_comboIeds_0 : TDMC_dlg_comboMission
		{
			idc = 121216;
			y = "safeZoneY + (safeZoneH / 1.970)";
		};
		
		class TDMC_dlg_sliderIeds_1 : TDMC_dlg_sliderSkill
		{
			idc = 121217;
			y = "safeZoneY + (safeZoneH / 1.880)";
		};
		
		class TDMC_dlg_sliderIeds_2 : TDMC_dlg_sliderSkill
		{
			idc = 121218;
			y = "safeZoneY + (safeZoneH / 1.800)";
		};
		
		class TDMC_dlg_comboTimeOfDay : TDMC_dlg_comboMission
		{
			idc = 121219;
			y = "safeZoneY + (safeZoneH / 1.568)"; // formerly 1.625
		};
		
		class TDMC_dlg_comboWeather : TDMC_dlg_comboMission
		{
			idc = 121220;
			y = "safeZoneY + (safeZoneH / 1.517)";
		};
		
		class TDMC_dlg_comboEffects : TDMC_dlg_comboMission
		{
			idc = 121221;
			y = "safeZoneY + (safeZoneH / 1.468)";
		};
		
		class TDMC_dlg_sliderCivs : TDMC_dlg_comboMission
		{
			idc = 121222;
			y = "safeZoneY + (safeZoneH / 1.422)";
		};
		
		class TDMC_dlg_sliderMarkerX : TDMC_dlg_sliderSkill
		{
			idc = 121223;
			y = "safeZoneY + (safeZoneH / 1.378)";
		};
		
		class TDMC_dlg_sliderMarkerY : TDMC_dlg_sliderSkill
		{
			idc = 121224;
			y = "safeZoneY + (safeZoneH / 1.338)";
		};
		
		class TDMC_dlg_sliderAngle : TDMC_dlg_sliderSkill
		{
			idc = 121225;
			y = "safeZoneY + (safeZoneH / 1.300)";
		};
		
		class TDMC_dlg_comboShape : TDMC_dlg_comboMission
		{
			idc = 121226;
			y = "safeZoneY + (safeZoneH / 1.262)";
		};
		
		class TDMC_dlg_creButtonCancel : TDMC_RscButton
		{
			idc = -1;
			action = "closeDialog 0";
			text = "X";
			x = "(safeZoneX + (safeZoneW / 1.185))";
			y = "safeZoneY + (safeZoneH / 14.000)";
			w = "(safeZoneW / 20)";
			h = "safeZoneH / 20";
			default = 0;
			class Attributes
			{
				align = "center";
			};
		};
	};
};
