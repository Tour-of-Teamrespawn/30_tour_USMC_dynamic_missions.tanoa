private 
[
	"_display", "_combo", "_index", "_text", "_textHelp", "_sliderCars", "_sliderMechanized", "_sliderArmored",
	"_sliderChoppers", "_sliderPlanes", "_sliderBoats", "_textFaction", "_picFaction", "_comboMission", "_mission","_faction"
];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_text = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_comboMission = _display displayCtrl 121205;
_sliderInfantry = _display displayCtrl 121210;
_sliderCars = _display displayCtrl 121211;
_sliderMechanized = _display displayCtrl 121212;
_sliderArmored = _display displayCtrl 121213;
_sliderChoppers = _display displayCtrl 121214;
_sliderPlanes = _display displayCtrl 121215;
_sliderBoats = _display displayCtrl 121228;
_textFaction = "";
_picFaction = "";
_mission = toLower (_comboMission lbText (lbCurSel _comboMission));
{ _x ctrlEnable true } forEach [_sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes, _sliderBoats];
_faction = "error";

_sliderInfantry sliderSetPosition 0;
_sliderCars sliderSetPosition 0;
_sliderMechanized sliderSetPosition 0;
_sliderArmored sliderSetPosition 0;
_sliderChoppers sliderSetPosition 0;
_sliderPlanes sliderSetPosition 0;
_sliderBoats sliderSetPosition 0;

{ _x ctrlEnable true } forEach [_sliderInfantry, _sliderCars, _sliderMechanized, _sliderArmored, _sliderChoppers, _sliderPlanes];

switch (toLower _text) do
{
	case "aaf" : 
	{
		_textFaction = "Most of the AAF's hardware consists of outdated or long-since decommissioned for service equipment used by NATO forces.<br /><br />Much of this equipment also dates back to the era of the pre-civil war AAF. Post-war acquisitions have since been obtained from the militaries of other Southern European nations facing total economic collapse, or provided/loaned to them at no cost by CSAT.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\AAF_ca.paa";
	};
	case "aaf (uk3cb)" : 
	{
		_textFaction = "Most of the AAF's hardware consists of outdated equipment used by Soviet forces.<br /><br />Much of this equipment also dates back to the era of the end of the cold war period. Post-war acquisitions have since been obtained from the militaries from European and other NATO countrys.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\AAF_ca.paa";
	};
	case "armed forces of the russian federation" : 
	{
		_textFaction = "commonly known as the Russian Armed Forces, are the military forces of the Russian Federation, established after the dissolution of the Soviet Union. It is the most powerful military in Europe, is one of the largest military forces in the world, and also possess the largest stockpile of nuclear warheads in the world.<br /><br />They have a wide range of modern equipment, boasting firepower and heavy armour on land, sea and air. The infantry also include a special forces devision.";
		_picFaction = "\ca\data\flag_rus_co.paa";
	};
	case "british armed forces (arctic)" : 
	{
		_textFaction = "The British Armed Forces, also known as Her Majesty's Armed Forces, are the military services responsible for the defence of the United Kingdom, its overseas territories and the Crown dependencies. They also promote the UK's wider interests, support international peacekeeping efforts and provide humanitarian aid.<br /><br /> They have robost equipment, well proven in the field, consisting of a range of ground support vehicles, and helicopter assets. Their special forces teams are well trained and are considered the best in the world.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\uk_ca.paa";
	};
	case "british armed forces (mtp)" : 
	{
		_textFaction = "The British Armed Forces, also known as Her Majesty's Armed Forces, are the military services responsible for the defence of the United Kingdom, its overseas territories and the Crown dependencies. They also promote the UK's wider interests, support international peacekeeping efforts and provide humanitarian aid.<br /><br /> They have robost equipment, well proven in the field, consisting of a range of ground support vehicles, and helicopter assets. Their special forces teams are well trained and are considered the best in the world.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\uk_ca.paa";
	};
	case "british armed forces (woodland)" : 
	{
		_textFaction = "The British Armed Forces, also known as Her Majesty's Armed Forces, are the military services responsible for the defence of the United Kingdom, its overseas territories and the Crown dependencies. They also promote the UK's wider interests, support international peacekeeping efforts and provide humanitarian aid.<br /><br /> They have robost equipment, well proven in the field, consisting of a range of ground support vehicles, and helicopter assets. Their special forces teams are well trained and are considered the best in the world.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\uk_ca.paa";
	};
	case "british armed forces (tropical)" : 
	{
		_textFaction = "The British Armed Forces, also known as Her Majesty's Armed Forces, are the military services responsible for the defence of the United Kingdom, its overseas territories and the Crown dependencies. They also promote the UK's wider interests, support international peacekeeping efforts and provide humanitarian aid.<br /><br /> They have robost equipment, well proven in the field, consisting of a range of ground support vehicles, and helicopter assets. Their special forces teams are well trained and are considered the best in the world.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\uk_ca.paa";
	};
	case "chdkz" : 
	{
		_textFaction = "Insurgents mostly wear old military fatigues camouflaged with the Soviet-era Kamyshovy risunok (podlesok) pattern mixed with civilian clothes. Aside from vehicle crews, fighters do not wear combat helmets and simply don ski masks/balaclavas to conceal their identities. Since they lack the logistical infrastructure of the CDF, the ChDKZ mostly relies on salvaged equipment obtained from depots captured from government forces. They also rely extensively on arms smugglers and covert arms shipments from the Russians to supply their fighters on the field.";
		_picFaction = "\UK3CB_Factions\addons\UK3CB_Factions_CHD\Flag\chd_flag_red_marker_co.paa";
	};
	case "csat (mtp)" : 
	{
		_textFaction = "CSAT equipment is predominately made up of assets acquired from various countries; namely Russian arms manufacturers. Iranian and Chinese defence industries have also collaborated heavily in order to reverse engineer several weapons systems that are of both Eastern and Western design in origin.<br /><br />Nonetheless, their forces utilise extremely advanced hardware that is on par with, if not superior to, their Western counterparts in almost every way!";
		_picFaction = "\a3\ui_f\data\map\markers\flags\CSAT_ca.paa";
	};
	case "csat (tropical)" : 
	{
		_textFaction = "CSAT equipment is predominately made up of assets acquired from various countries; namely Russian arms manufacturers. Iranian and Chinese defence industries have also collaborated heavily in order to reverse engineer several weapons systems that are of both Eastern and Western design in origin.<br /><br />Nonetheless, their forces utilise extremely advanced hardware that is on par with, if not superior to, their Western counterparts in almost every way!";
		_picFaction = "\a3\ui_f\data\map\markers\flags\CSAT_ca.paa";
	};
	case "fia (independent)" : 
	{
		_textFaction = "The post-civil war FIA was less well-equipped in comparison, and mainly relied on a mixture of hardware smuggled in from arms dealers around the Mediterranean, along with equipment scavenged in raids against CSAT forces and the AAF.<br /><br />Unlike their loyalist predecessors, the current FIA also lacked the ability to obtain or maintain heavy vehicles. As a result, it relies exclusively on re-purposed civilian vehicles for transportation. Nonetheless, their forces utilise extremely advanced hardware that is on par with, if not superior to, their Western counterparts in almost every way!";
		_picFaction = "\a3\ui_f\data\map\markers\flags\FIA_ca.paa";
	};
	case "fia (east)" : 
	{
		_textFaction = "The post-civil war FIA was less well-equipped in comparison, and mainly relied on a mixture of hardware smuggled in from arms dealers around the Mediterranean, along with equipment scavenged in raids against CSAT forces and the AAF.<br /><br />Unlike their loyalist predecessors, the current FIA also lacked the ability to obtain or maintain heavy vehicles. As a result, it relies exclusively on re-purposed civilian vehicles for transportation. Nonetheless, their forces utilise extremely advanced hardware that is on par with, if not superior to, their Western counterparts in almost every way!";
		_picFaction = "\a3\ui_f\data\map\markers\flags\FIA_ca.paa";
	};
	case "fia (west)" : 
	{
		_textFaction = "The post-civil war FIA was less well-equipped in comparison, and mainly relied on a mixture of hardware smuggled in from arms dealers around the Mediterranean, along with equipment scavenged in raids against CSAT forces and the AAF.<br /><br />Unlike their loyalist predecessors, the current FIA also lacked the ability to obtain or maintain heavy vehicles. As a result, it relies exclusively on re-purposed civilian vehicles for transportation. Nonetheless, their forces utilise extremely advanced hardware that is on par with, if not superior to, their Western counterparts in almost every way!";
		_picFaction = "\a3\ui_f\data\map\markers\flags\FIA_ca.paa";
	};
	case "ldf" : 
	{
		_textFaction = "Structured around defending the tiny NATO member state's territory, the bulk of its forces consist of light infantry and motorised/mechanised elements. Its air force - while not significant, is still a sizeable presence to be reckoned with. Due to Livonia being a landlocked country, the LDF does not possess a naval force and exclusively conducts ground-based operations.<br /><br />As an active member of the NATO alliance, the LDF's soldiers are well-equipped with some of the latest in Western-made hardware and electronics.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\nato_ca.paa";
	};
	case "nato (mtp)" : 
	{
		_textFaction = "North Atlantic Treaty Association - First signed in 1949, NATO is an intergovernmental military alliance that was formed between several North American and European countries.Predominately consisting of U.S. Army and other European special forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\nato_ca.paa";
	};
	case "nato (tropical)" : 
	{
		_textFaction = "North Atlantic Treaty Association - First signed in 1949, NATO is an intergovernmental military alliance that was formed between several North American and European countries.Predominately consisting of U.S. Army and other European special forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\nato_ca.paa";
	};
	case "syndikat" : 
	{
		_textFaction = "The Syndikat have expanded throughout Tanoa province and other neighbouring regions around the Pacific. They primarily target Non-Government Organisation (NGO) run camps and anyone else that opposes them; particularly members of the Horizon Islands' law enforcement agencies.<br /><br /> The bulk of their forces mainly consist of anti-government paramilitary types mixed in with bandits, petty criminals, as well as drugs and weapon smugglers.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\syndicat_ca.paa";
		_faction = "UK3CB_TKA_O";
	};
	case "usmc (woodland)" : 
	{
		_textFaction = "The United States Marine Corps, is the maritime land force service branch of the United States Armed Forces responsible for conducting expeditionary and amphibious operations[12] through combined arms, implementing its own infantry, armor, artillery, aerial and special operations forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\usa_ca.paa";
	};
	case "usmc (desert)" : 
	{
		_textFaction = "The United States Marine Corps, is the maritime land force service branch of the United States Armed Forces responsible for conducting expeditionary and amphibious operations[12] through combined arms, implementing its own infantry, armor, artillery, aerial and special operations forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\usa_ca.paa";
	};
	case "us armed forces (cold war)" : 
	{
		_textFaction = "The United States Armed Forces in the height of the cold war (ca. 1980s) was a world leader in armed warfare technologies, sporting such iconic brands that stood the test of time such as the A-10, Huey, Blackhawk and HUMVEE.<br /><br />Their equipment contains land sea and air assets.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\usa_ca.paa";
	};
	case "us army (mtp)" : 
	{
		_textFaction = "The United States Army (USA) is the land service branch of the United States Armed Forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\usa_ca.paa";
	};
	case "us army (desert)" : 
	{
		_textFaction = "The United States Army (USA) is the land service branch of the United States Armed Forces.<br /><br />Their equipment is vast and built on the latest technologies, supporting armoured ground and air support.";
		_picFaction = "\a3\ui_f\data\map\markers\flags\usa_ca.paa";
	};
	case "ussr armed forces" : 
	{
		_textFaction = "The Union of Soviet Socialist Republics were the armed forces of the the Soviet Union (1922-1991). The Soviet Union established an indigenous arms industry as part of Stalin's industrialization program in the 1920s and 1930s.";
		_picFaction = "\UK3CB_Factions\addons\UK3CB_Factions_CW_SOV\Flag\cw_sov_flag_marker_co.paa";
	};
	case "takistani army" : 
	{
		_textFaction = "The Army is mainly composed of conventional ground forces supported by a few air assets, and is funded by the steady flow of income generated by crude oil, natural gas, as well as mineral exports. Though their hardware is incomparable to modern Western armies, Takistani soldiers are well accustomed to fighting and surviving in the barren hills of Takistan.<br /><br />Its forces are equipped to handle most internal threats and possessed a considerable range of outdated and modern assets acquired from both the East and West.";
		_picFaction = "\ca\ca_E\data\flag_tka_co.paa";
		_faction = "UK3CB_TKA_O";
	};
	case "takistani militia" : 
	{
		_textFaction = "Essentially a fanatical paramilitary wing of the Takistani Army, Republican Militias consist of pro-government supporters from tribes all across Takistan. They answer to no one other than their great leader: hero of the Takistani Socialists, Colonel Aziz, who brought them victory in the revolution against the Royalist monarchy.<br /><br />Logistically backed by the government, the Republican Militias are equipped with a myriad of imported and pre-civil war equipment and rifles. Most groups also do not possess heavy vehicles and utilise all-terrain trucks, surplus armoured personnel carriers and motorbikes to patrol the countryside.";
		_picFaction = "\ca\ca_E\data\flag_tkm_co.paa";
		_faction = "UK3CB_TKM_O";
	};
	case "takistani tribal fighters" : 
	{
		_textFaction = "Essentially a fanatical paramilitary group dedicated to the cause of freeing their country from the hold of the Takistani Army and foreign invaders consisting of anti-goverment tribes all across Takistan. They answer to no one other than themselves.<br /><br />They are financially backed by the historic wealth of the oil fields. The Tribal Fighters are equipped with a myriad of imported and pre-civil war equipment and rifles. Most groups also do not possess heavy vehicles and utilise all-terrain trucks, surplus armoured personnel carriers and motorbikes to patrol the countryside.";
		_picFaction = "\ca\ca_E\data\flag_tkm_co.paa";
		_faction = "UK3CB_TKM_I";
	};
	case "vietcong" : 
	{
		_textFaction = "The Viet Cong, officially known as the National Liberation Front of South Vietnam, was an armed communist political revolutionary organization in South Vietnam and Cambodia.<br /><br /> They are well drilled infantry based units with some tank and artillery support.";
		_picFaction = "\vn\objects_f_vietnam\markers\vn_mrk_vc_ca.paa";
		_faction = "o_vc";
	};
	case "north vietnamese army" : 
	{
		_textFaction = "The People's Army of Vietnam (PAVN) contains the NVA as a branch of the total Vietnamese forces, who are well equipped from their Communist allies.<br /><br />They contain well drilled infantry forces, with the additional support of air, tank and artillery units.";
		_picFaction = "\vn\objects_f_vietnam\markers\vn_mrk_pavn_ca.paa";
		_faction = "o_vc";
	};
	
};

_faction = _textFaction call TDMC_fnc_txtToFaction;
if (str _faction == "error") exitWith {hint "Error In Faction Selection!!!";};

if (toLower _mission == "destroy convoy") then
{
	{_x sliderSetPosition 0}forEach [_sliderInfantry, _sliderChoppers, _sliderPlanes];
	{_x ctrlEnable false}forEach [_sliderInfantry, _sliderChoppers, _sliderPlanes];
	
	_array = (call compile format ["TDMC_array_%1_cars", _faction]);
	if ((count _array) == 0) then
	{
		_sliderCars sliderSetPosition 0;
		_sliderCars ctrlEnable false;
	};
	
	_array = (call compile format ["TDMC_array_%1_APCs", _faction]);
	if ((count _array) == 0) then
	{
		_sliderMechanized sliderSetPosition 0;
		_sliderMechanized ctrlEnable false;
	};
	
	_array = (call compile format ["TDMC_array_%1_Tanks", _faction]);
	if ((count _array) == 0) then
	{
		_sliderArmored sliderSetPosition 0;
		_sliderArmored ctrlEnable false;
	};
}else
{

		_faction = _text call TDMC_fnc_txtToFaction;
		
		_array = (call compile format ["TDMC_array_%1_motorized", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_cars", _faction]);
			if ((count _array) == 0) then
			{
				_sliderCars sliderSetPosition 0;
				_sliderCars ctrlEnable false;
			};
		};
		
		_array = (call compile format ["TDMC_array_%1_mechanized", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_APCs", _faction]);
			if ((count _array) == 0) then
			{
				_sliderMechanized sliderSetPosition 0;
				_sliderMechanized ctrlEnable false;
			};
		};
		
		_array = (call compile format ["TDMC_array_%1_armored", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_Tanks", _faction]);
			if ((count _array) == 0) then
			{
				_sliderArmored sliderSetPosition 0;
				_sliderArmored ctrlEnable false;
			};
		};
		
		_array = (call compile format ["TDMC_array_%1_Air_Heli", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_Choppers", _faction]);
			if ((count _array) == 0) then
			{
				_sliderChoppers sliderSetPosition 0;
				_sliderChoppers ctrlEnable false;
			};
		};
		
		_array = (call compile format ["TDMC_array_%1_Air_Plane", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_Planes", _faction]);
			if ((count _array) == 0) then
			{
				_sliderPlanes sliderSetPosition 0;
				_sliderPlanes ctrlEnable false;
			};
		};
		
		_array = (call compile format ["TDMC_array_%1_Air_Boats", _faction]);
		if ((count _array) == 0) then
		{
			_array = (call compile format ["TDMC_array_%1_Boats", _faction]);
			if ((count _array) == 0) then
			{
				_sliderPlanes sliderSetPosition 0;
				_sliderPlanes ctrlEnable false;
			};
		};
		
		if (toLower _mission == "river patrol") then
		{
			{_x sliderSetPosition 0}forEach [_sliderArmored, _sliderMechanized, _sliderCars, _sliderChoppers, _sliderPlanes, _sliderBoats, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle];
			{_x ctrlEnable false}forEach [_sliderArmored, _sliderMechanized, _sliderCars, _sliderChoppers, _sliderPlanes, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
		};
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	<img size='3' image='%1'/> <t size='1.25' font='puristaMedium'>%2</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%3</t>
", _picFaction, _text, _textFaction];
