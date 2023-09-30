private 
[
	"_display", "_textHelp", "_sliderMarkerX", "_sliderMarkerY", "_sliderMarkerAngle", "_comboMarkerShape",
	"_map", "_key", "_x", "_y", "_pos", "_dir", "_size", "_shape", "_mkr", "_comboMission", "_mkrnumber", "_loc", "_warning", "_mission"
];
_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_comboMission = _display displayCtrl 121205;
_sliderMarkerX = _display displayCtrl 121223;
_sliderMarkerY = _display displayCtrl 121224;
_sliderMarkerAngle = _display displayCtrl 121225;
_comboMarkerShape = _display displayCtrl 121226;
_map = _this select 0;
_key = _this select 1;
_x = _this select 2;
_y = _this select 3;
_pos = _map ctrlMapScreenToWorld [_x, _y];
_dir = sliderPosition _sliderMarkerAngle;
_size = [sliderPosition _sliderMarkerX, sliderPosition _sliderMarkerY];
_shape = _comboMarkerShape lbText (lbCurSel _comboMarkerShape);
_mission = toLower (_comboMission lbText (lbCurSel _comboMission));

If (TDMC_dlg_creator_haloPosSelect) then
{
		//create marker
		_mkrHalo = createMarkerLocal ["TDMC_dlg_creator_haloMarker", _pos];
		_mkrHalo setMarkerTypeLocal "mil_start";
		_mkrHalo setMarkerColorLocal "Colorblue";
		_mkrHalo setMarkerTextLocal "Halo Insertion (10,000m)";

		_mkrHaloLimit = createMarkerLocal ["TDMC_dlg_creator_haloMarkerLimit", _pos];
		_mkrHaloLimit setMarkerBrushLocal "FDiagonal";
		_mkrHaloLimit setMarkerColorLocal "ColorBlue";
		_mkrHaloLimit setMarkerShapeLocal "ELLIPSE";
		_mkrHaloLimit setMarkerSizeLocal [2000, 2000];

		//Help Text
		_grid = format ["[ %1 , %2 ]", (floor (_pos select 0)), (floor (_pos select 1))];
		_textHelp ctrlSetStructuredText parseText format
		["
			<img size='3' image='\a3\ui_f\data\map\markers\military\start_ca.paa'/> <t size='1.25' font='puristaMedium'>Halo Insertion</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>10,000m halo jump insertion position added to map.<br/><br/>Grid Ref: %1</t>
		", _grid];
		TDMC_dlg_creator_haloPosSelect = false;
		
}else
{
	if (TDMC_dlg_creator_convoycreation) then
	{
		if (_key == 0) then
		{
			if ((count (_pos nearRoads 30)) > 0) then
			{
				_pos = getPosATL ((_pos nearRoads 30) select 0);
				_mkrnumber = 1;
				while {true} do
				{		
					if (str (getMarkerPos format ["TDMC_convoy_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
					{
						_mkr = createMarkerLocal [format ["TDMC_convoy_marker_%1", _mkrnumber], _pos];
						if (_mkrnumber == 1) then
						{
							_mkr setMarkerTypeLocal "hd_start";
						}else
						{
							_mkr setMarkerTypeLocal "hd_end";
							if ((_mkrnumber - 1) > 1) then
							{
								(format ["TDMC_convoy_marker_%1", (_mkrnumber - 1)]) setMarkerTypeLocal "Waypoint";
							};
						};
						_mkr setMarkerColorLocal "ColorRed";
					};
					_mkrnumber = _mkrnumber +1;
				};
			}else
			{
				hint "You cannot place waypoints here, there are no near roads";
			};
		//Help Text
		_textHelp ctrlSetStructuredText parseText format
		["
			<img size='3' image='A3\ui_f\data\map\groupicons\waypoint.paa'/> <t size='1.25' font='puristaMedium'>Waypoints</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Click on the map for the next waypoint / endpoint. You must have at least 3 waypoints in order for the mission to be accepted.</t>
		", worldName];		
			
		};
	}else
	{
		if (toLower _mission == "river patrol") then
		{
			if (_key == 0) then
			{
				if (surfaceIsWater _pos) then
				{
					_mkrnumber = 1;
					while {true} do
					{		
						if (str (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
						{
							if ((_mkrnumber == 1) or ((_mkrnumber != 1) && (_pos distance (getMarkerPos format ["TDMC_river_marker_%1", _mkrnumber - 1]) < 250))) then
							{
								_mkr = createMarkerLocal [format ["TDMC_river_marker_%1", _mkrnumber], _pos];
								if (_mkrnumber == 1) then
								{
									_mkr setMarkerTypeLocal "hd_start";
								}else
								{
									_mkr setMarkerTypeLocal "hd_end";
									if ((_mkrnumber - 1) > 1) then
									{
										(format ["TDMC_river_marker_%1", (_mkrnumber - 1)]) setMarkerTypeLocal "Waypoint";
									};
								};
								_mkr setMarkerColorLocal "ColorGreen";
							}else
							{
								["warning", "You must place waypoints less than 250m appart."] call TDMC_fnc_hint;
							};
						};
						_mkrnumber = _mkrnumber +1;
					};
				}else
				{
					["warning", "You must place waypoints on water."] call TDMC_fnc_hint;
				};
			};
		}else
		{
			_mkr = uinamespace getVariable "TDMC_dlg_dmcMarker";
			if (_key == 0) then
			{
				_mkr setMarkerBrushLocal "Solid";
				_mkr setMarkerColorLocal "ColorRed";
				_mkr setMarkerPosLocal _pos;
				_mkr setMarkerShapeLocal _shape;
				_mkr setMarkerSizeLocal _size;
				_mkr setMarkerDirLocal _dir;
				_mkr setMarkerAlphaLocal 1;
				
				uiNameSpace setVariable ["TDMC_dlg_dmcMarkerCreated", _mkr];
			};

			//Help Text
			_loc = (getMarkerPos TDMC_friendlybase) getpos [TDMC_safeDistance, ((getMarkerPos TDMC_friendlybase) getDir (getMarkerPos _mkr))];
			if ((_loc inArea _mkr) or (((getMarkerPos _mkr) distance ((getMarkerPos TDMC_friendlybase))) < TDMC_safeDistance)) then 
			{
				_warning = format ["<br/><br/><br/>WARNING: Your mission AO is within %1m of the base! Create mission AO further away.", TDMC_safeDistance];
			}else
			{
				_warning = "";
			};

			_textHelp ctrlSetStructuredText parseText format
			["
				<img size='3' image='\a3\ui_f\data\map\markers\military\unknown_ca.paa'/> <t size='1.25' font='puristaMedium'>Area of Operation</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You can select a Ellipse or Retangle AO and change the X, Y and Angle values to make the area fit your needs.%1</t>
			", _warning];
		};
	};
};

//Map Animation
_map ctrlMapAnimAdd [0.1, ctrlMapScale _map, _pos];
ctrlMapAnimCommit _map;