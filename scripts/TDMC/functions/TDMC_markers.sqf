private ["_mkr", "_name", "_type", "_colour", "_dir", "_text", "_pos"];
{
	_name = (_x select 0);
	_type = (_x select 1);
	_colour = (_x select 2);
	_dir = (_x select 3);
	_text = (_x select 4);
	_pos = (_x select 5);
	_size = (_x select 6);
	_shape = (_x select 7);
	_brush = (_x select 8);
	
	_mkr = createMarkerLocal [_name, _pos];
	_mkr setMarkerTypeLocal _type;
	_mkr setMarkerColorLocal _colour;
	_mkr setMarkerDirLocal _dir;
	_mkr setMarkerTextLocal _text;
	_mkr setMarkerSizeLocal _size;
	_mkr setMarkerShapeLocal _shape;
	_mkr setMarkerBrushLocal _brush;
}forEach TDMC_PV_JIPmarkers;