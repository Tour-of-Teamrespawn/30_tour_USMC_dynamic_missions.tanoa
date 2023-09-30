private ["_display", "_combo", "_index", "_text", "_textHelp", "_textMission", "_mkrnumber", "_comboIed", "_sliderIed_0", "_sliderIed_1", "_sliderInfantry", "_sliderRadius", "_comboCivs", "_icon", "_sliderMarkerX", "_sliderMarkerY", "_sliderMarkerAngle", "_comboMarkerShape", "_sliderCars", "_sliderMechanized", "_sliderArmored"];
_display = findDisplay 121200;
_combo = _this select 0;
_index = _this select 1;
_text = _combo lbText _index;
_textHelp = _display displayCtrl 121204;
_comboIed = _display displayCtrl 121216;
_sliderIed_0 = _display displayCtrl 121217;
_sliderIed_1 = _display displayCtrl 121218;
_sliderRadius = _display displayCtrl 121209;
_sliderInfantry = _display displayCtrl 121210;
_sliderCars = _display displayCtrl 121211;
_sliderMechanized = _display displayCtrl 121212;
_sliderArmored = _display displayCtrl 121213;
_sliderChoppers = _display displayCtrl 121214;
_sliderPlanes = _display displayCtrl 121215;
_sliderBoats = _display displayCtrl 121228;
_comboCivs = _display displayCtrl 121222;
_sliderMarkerX = _display displayCtrl 121223;
_sliderMarkerY = _display displayCtrl 121224;
_sliderMarkerAngle = _display displayCtrl 121225;
_comboMarkerShape = _display displayCtrl 121226;


_textMission = switch (toLower _text) do
{
	case "patrol from base": { "This mission will require players to patrol from a base of operations to the outer rim of a patrol area, then return home, in order to complete the task." };
	case "patrol" : { "This mission will require players to patrol through an area of operations, in order to complete the task.<br />The direction of the created AO marker will be the required direction for patroling." };
	case "clear ao" : { "This mission will require players to clear the selected area of enemy forces." };
	case "clear tunnels" : { "This mission will require players to search for a entrance and clear out the enemy from the tunnel complex." };
	case "assassination" : { "This mission will require players to assassinate a person of interest.<br />Buildings in the AO, will be required in order for this mission to work." };
	case "ied defusal" : { "This mission will require players defusal any IED encountered within the AO, in order to complete the objective.<br />Roads in the AO, will be required in order for this mission to work." };
	case "bomb defusal" : { "This mission will require players to defuse any bombs found within the AO, in order to complete the objective.<br />Buildings in the AO will be required in order for this mission to work." };
	case "attack" : { "This mission will require players to assault and clear enemy from a stronghold located somewhere within the AO, in order to complete the objective.<br /><br />If an existing military installation is within 300m of the centre of the AO, it will be used as the assasult objective, else a miliary outpost will be spawned within the AO." };
	case "defend" : { "This mission will require players to defend a stronghold for 1 hour, in order to complete the objective.<br />Once friendly forces occupy the base, the timer will start and any enemy selected will spawn and attack randomly.<br /><br />If an existing military installation is within 300m of the centre of the AO, it will be used as the defense objective, else a miliary outpost will be spawned within the AO." };
	case "scud hunt" : { "This mission will require players to destroy scud launchers within the AO, in order to complete the objective." };
	case "aa hunt" : { "This mission will require players to destroy AA positions within the AO, in order to complete the objective." };
	case "arty hunt" : { "This mission will require players to destroy artillery positions within the AO, in order to complete the objective." };
	case "destroy convoy" : { "This mission will require players to destroy all vehicles within a convoy, before it reaches its destination, in order to complete the objective. You will have around 30 minutes to set up before the convoy sets off, unless you move to close to it.<br />You can select the types of convoy vehicles, by using the group selection sliders. Make sure you have a long enough piece of road as your first point on the map for them to spawn." };
	case "mia" : { "This mission will require players to search for missing soldiers within the AO. They must collect the bodies and return to base, in order to complete the objective." };
	case "weapons cache" : { "Search and destroy weapons caches in buildings within the AO, in order to complete the objective." };
	case "river patrol" : { "Patrol along a river, passing through each waypoint to complete the objective.<br />Click on the map to place waypoints along the river, less than 250m appart." };
	case "rescue" : { "Rescue a friendly unit from captivity.<br />Place an AO marker by clicking on the map, to cover at least one of the possible locations (shown by a red dot)." };
};

_icon = switch (toLower _text) do
{
	case "patrol from base" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\arrow_ca.paa'/>" };
	case "patrol" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\arrow_ca.paa'/>" };
	case "clear ao" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\ambush_ca.paa'/>" };
	case "clear tunnels" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\ambush_ca.paa'/>" };
	case "assassination" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconmanofficer_ca.paa'/>" };
	case "ied defusal" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconExplosiveAP_ca.paa'/>" };
	case "bomb defusal" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconExplosiveUW_ca.paa'/>" };
	case "attack" : { "<img size='3' image='\a3\ui_f\data\gui\cfg\gametypes\seize_ca.paa'/>" };
	case "defend" : { "<img size='3' image='\a3\ui_f\data\gui\cfg\gametypes\defend_ca.paa'/>" };
	case "scud hunt" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\warning_ca.paa'/>" };
	case "aa hunt" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconStaticAA_ca.paa'/>" };
	case "arty hunt" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa'/>" };
	case "destroy convoy" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconAPC_ca.paa'/> <img size='3' image='\a3\ui_f\data\map\vehicleicons\iconTruck_ca.paa'/> <img size='3' image='\a3\ui_f\data\map\vehicleicons\iconTruck_ca.paa'/> <img size='3' image='\a3\ui_f\data\map\vehicleicons\iconTank_ca.paa'/>" };
	case "mia" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\unknown_ca.paa'/>" };
	case "weapons cache" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconCrateWpns_ca.paa'/>" };
	case "river patrol" : { "<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconShip_ca.paa'/>" };
	case "rescue" : { "<img size='3' image='\a3\ui_f\data\map\markers\military\unknown_ca.paa'/>" };
};

//Help Text
_textHelp ctrlSetStructuredText parseText format
["
	%3 <t size='1.25' font='puristaMedium'>%1</t>
	<br />
	<br />
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
", _text, _textMission, _icon];

//stop IEDs dependant on mission
if (toLower _text in ["ied defusal", "destroy convoy", "defend"]) then
{
	{_x ctrlEnable false}forEach [_comboIed, _sliderIed_0, _sliderIed_1];
	_sliderIed_0 sliderSetPosition 0;
	_sliderIed_1 sliderSetPosition 0;
}else
{
	{_x ctrlEnable true}forEach [_comboIed, _sliderIed_0, _sliderIed_1];
};

//stop patrol radius slider being used
if (toLower _text in ["defend", "destroy convoy", "river patrol"]) then
{
	{
		_x sliderSetPosition 0; 
		_x ctrlEnable false;
	}forEach [_sliderRadius];
}else
{
	{_x ctrlEnable true;}forEach [_sliderRadius];
};

// create/delete markers to select defend position from
if ((toLower _text) in ["defend", "attack", "patrol from base"]) then
{
	//add defend markers
	_mkrnumber = 1;
	{
		_mkrs = createMarkerLocal [format ["TDMC_comppos_marker_%1", _mkrnumber], _x select 5];
		_mkrs setMarkerTypeLocal "hd_flag";
		_mkrs setMarkerColorLocal "ColorRed";
		_mkrnumber = _mkrnumber +1;
	}forEach (["military", "map"] call TDMC_fnc_locations);	
	
}else
{
	// remove defend markers
	_mkrnumber = 1;
	while {true} do
	{		
		if (str (getMarkerPos format ["TDMC_comppos_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
		deleteMarkerLocal (format ["TDMC_comppos_marker_%1", _mkrnumber]);
		_mkrnumber = _mkrnumber +1;
	};
};

if (toLower _text == "rescue") then 
{
	_building = call TDMC_fnc_rescueBuilding;

	_mkrnumber = 1;
	{
		if (((0 boundingBox _x) select 2) > 2) then 
		{
			_mkrs = createMarkerLocal [format ["TDMC_resue_marker_%1", _mkrnumber], getPos _x];
			_mkrs setMarkerTypeLocal "hd_dot";
			_mkrs setMarkerColorLocal "ColorRed";
			_mkrnumber = _mkrnumber +1;
		};
	}forEach (nearestObjects [[worldSize / 2, worldSize / 2, 0], [(_building select 0)], worldSize]);	
}else 
{
	_mkrnumber = 1;
	while {true} do
	{
		if (str (getMarkerPos format ["TDMC_resue_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
		deleteMarkerLocal (format ["TDMC_resue_marker_%1", _mkrnumber]);
		_mkrnumber = _mkrnumber +1;
	};	
};
       
if !(toLower _text == "destroy convoy") then
{
	TDMC_dlg_creator_convoycreation = false;

	if (toLower _text == "patrol from base") then
	{
		{_x sliderSetPosition 1000}forEach [_sliderMarkerX, _sliderMarkerY];
		_comboMarkerShape lbSetCurSel 0;
		{_x ctrlEnable false}forEach [_comboMarkerShape, _sliderMarkerY];
	}else
	{
		{_x ctrlEnable true}forEach [_sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
	};
	if (toLower _text == "river patrol") then
	{
		{_x sliderSetPosition 0}forEach [_sliderArmored, _sliderMechanized, _sliderCars, _sliderChoppers, _sliderPlanes, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle];
		{_x ctrlEnable false}forEach [_sliderArmored, _sliderMechanized, _sliderCars, _sliderChoppers, _sliderPlanes, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
		{_x ctrlEnable false}forEach [_sliderArmored, _sliderMechanized, _sliderCars, _sliderChoppers, _sliderPlanes, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
	};
}else
{
	{_x sliderSetPosition 0}forEach [_sliderInfantry, _sliderChoppers, _sliderPlanes, _sliderBoats, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle];
	{_x ctrlEnable false}forEach [_sliderInfantry, _sliderChoppers, _sliderPlanes, _sliderBoats, _sliderMarkerX, _sliderMarkerY, _sliderMarkerAngle, _comboMarkerShape];
	TDMC_dlg_creator_convoycreation = true;
};

// remove markers
_mkrnumber = 1;
while {true} do
{
	if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_convoy_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};
_mkrnumber = 1;
while {true} do
{
	if (str (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith {};
	deleteMarkerLocal (format ["TDMC_river_marker_%1", _mkrnumber]);
	_mkrnumber = _mkrnumber +1;
};
if (toLower _text in ["destroy convoy", "river patrol"]) then
{
	deleteMarkerLocal "TDMC_dlg_dmcMarker";
};