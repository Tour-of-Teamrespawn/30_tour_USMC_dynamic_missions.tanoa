private ["_display", "_combo", "_index", "_text", "_textHelp", "_comboFaction", "_textSide", "_factions", "_pic"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_text = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_comboFaction = _display displayCtrl 121207;
_sliderInfantry = _display displayCtrl 121210;
_sliderCars = _display displayCtrl 121211;
_sliderMechanized = _display displayCtrl 121212;
_sliderArmored = _display displayCtrl 121213;
_sliderChoppers = _display displayCtrl 121214;
_sliderPlanes = _display displayCtrl 121215;
_sliderBoats = _display displayCtrl 121228;
_textSide = "";
_factions = [];
_pic = "";

switch (toLower _text) do
{
	case "east":
	{
		if (!isNil "TDMC_mod_RHS") then
		{
			{ _factions set [count _factions, _x] } forEach [	
																"Armed Forces of the Russian Federation",
																"CHDKZ",
																"CSAT (MTP)",
																"CSAT (Tropical)",																
																"FIA (East)",
																"Takistani Army",
																"Takistani Militia",
																"USSR Armed Forces"
															];
		}else
		{
			if ((toLower worldName) in ["cam_lao_nam", "khe_sanh"]) then
			{
				{ _factions set [count _factions, _x] } forEach [	
																	"Vietcong",
																	"North Vietnamese Army"
																];
			}else
			{
				{ _factions set [count _factions, _x] } forEach [	
																	"CSAT (MTP)",
																	"CSAT (Tropical)",																
																	"FIA (East)"
																];		
			};
		};
		_pic = "\a3\ui_f\data\map\diary\icons\playerbriefeast_ca.paa";	
	};
	case "west":
	{
		if (!isNil "TDMC_mod_RHS") then
		{
			{ _factions set [count _factions, _x] } forEach [
															//	"British Armed Forces (UK3CB Arctic)",
																"British Armed Forces (MTP)",
															//	"British Armed Forces (UK3CB Tropical)",
																"British Armed Forces (Woodland)",
																"FIA (West)",
																"NATO (MTP)",
																"NATO (Tropical)",
																"US Armed Forces (Cold War)",
																"US Army (MTP)",
																"US Army (Desert)",
																"USMC (Woodland)"
															];
		}else
		{
			if (worldName == "cam_lao_nam") then
			{
				{ _factions set [count _factions, _x] } forEach [	

																];
			}else
			{
				{ _factions set [count _factions, _x] } forEach [	
																"FIA (West)",
																"NATO (MTP)",
																"NATO (Tropical)"
																];		
			};		
		};
		_pic = "\a3\ui_f\data\map\diary\icons\playerbriefwest_ca.paa";
	};
	case "resistance":
	{
		if (!isNil "TDMC_mod_RHS") then
		{
			{ _factions set [count _factions, _x] } forEach [	
																"AAF",
																"AAF (UK3CB)",
																"FIA (Independent)", 
																"LDF",
																"Syndikat",
																"Takistani Tribal Fighters"
															];
		}else
		{
			if (worldName == "cam_lao_nam") then
			{
					{ _factions set [count _factions, _x] } forEach [	

																	];		
			}else
			{
					{ _factions set [count _factions, _x] } forEach [	
																	"AAF",
																	"FIA (Independent)", 
																	"LDF",
																	"Syndikat"
																	];			
			};
		};
		_pic = "\a3\ui_f\data\map\diary\icons\playerbriefguer_ca.paa";
	};
	default {_factions = [];};
};

if (count _factions == 0) then
{
	_textSide = "There are no available enemy factions for this side.";
}else
{
	_textSide = "Enemy factions of this side can be the";
	{
	if (_forEachIndex < ((count _factions) -1)) then
	{
		_textSide = _textSide + ", " + _x;
	}else
	{
		_textSide = _textSide + " or the " + _x + ".";
	};
	}forEach _factions;
};

//Add Factions
lbClear _comboFaction; { _comboFaction lbAdd _x } forEach _factions;
if (lbCurSel _comboFaction != -1) then { _comboFaction lbSetCurSel 0 };
_sliderInfantry sliderSetPosition 0;
_sliderCars sliderSetPosition 0;
_sliderMechanized sliderSetPosition 0;
_sliderArmored sliderSetPosition 0;
_sliderChoppers sliderSetPosition 0;
_sliderPlanes sliderSetPosition 0;
_sliderBoats sliderSetPosition 0;

{ _x ctrlEnable false } forEach [_sliderInfantry, _sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes, _sliderBoats];
{ _x ctrlEnable true } forEach [_comboFaction];

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='%1'/> <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _pic, _text, _textSide];
