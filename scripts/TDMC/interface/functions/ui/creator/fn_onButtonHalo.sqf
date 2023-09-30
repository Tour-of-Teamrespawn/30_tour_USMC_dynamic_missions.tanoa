_display = findDisplay 121200;
_textHelp = _display displayCtrl 121204;
_buttonHalo = _display displayCtrl 121227;

if (str (getMarkerPos "TDMC_dlg_creator_haloMarker") != "[0,0,0]") then
{
	TDMC_dlg_creator_haloPosSelect = false;
	if (str (getMarkerPos "TDMC_dlg_creator_haloMarker") != "[0,0,0]") then
	{
		deleteMarkerLocal "TDMC_dlg_creator_haloMarker";
	};
	if (str (getMarkerPos "TDMC_dlg_creator_haloMarkerLimit") != "[0,0,0]") then
	{
		deleteMarkerLocal "TDMC_dlg_creator_haloMarkerLimit";
	};
	_textHelp ctrlSetStructuredText parseText format
	["
		<img size='3' image='\a3\ui_f\data\map\markers\military\start_ca.paa'/> <t size='1.25' font='puristaMedium'>Halo Insertion</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Halo insertion point removed.</t>
	", worldsize];
}else
{
	if (TDMC_dlg_creator_haloPosSelect) then
	{
		TDMC_dlg_creator_haloPosSelect = false;
		if (str (getMarkerPos "TDMC_dlg_creator_haloMarker") != "[0,0,0]") then
		{
			deleteMarkerLocal "TDMC_dlg_creator_haloMarker";
		};
		if (str (getMarkerPos "TDMC_dlg_creator_haloMarkerLimit") != "[0,0,0]") then
		{
			deleteMarkerLocal "TDMC_dlg_creator_haloMarkerLimit";
		};		
		_textHelp ctrlSetStructuredText parseText format
		["
			<img size='3' image='\a3\ui_f\data\map\markers\military\start_ca.paa'/> <t size='1.25' font='puristaMedium'>Halo Insertion</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Halo insertion map click function inhibited.</t>
		", worldsize];
	}else
	{
		TDMC_dlg_creator_haloPosSelect = true;
		
		_textHelp ctrlSetStructuredText parseText format
		["
			<img size='3' image='\a3\ui_f\data\map\markers\military\start_ca.paa'/> <t size='1.25' font='puristaMedium'>Halo Insertion</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Click on the map to select a 10,000m halo insertion point.<br/><br/>Note that the maximum distance is around 2km for this height!</t>
		", worldsize];	
	};
};


