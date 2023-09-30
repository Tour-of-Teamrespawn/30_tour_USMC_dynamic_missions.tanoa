//createlightsources for the used base areas

private ["_light"];
{
	_light = "#lightpoint" createVehicleLocal _x;   
	_light setLightBrightness 0.3;
	_light setLightAmbient [1, 1, 1];
	_light setLightColor [1, 1, 1];
}foreach 	[
				[2177.65,13407.8,5],[2216.57,13436.3,5]
			];

{
	_light = "#lightpoint" createVehicleLocal _x;   
	_light setLightBrightness 0.2;
	_light setLightAmbient [1, 1, 1];
	_light setLightColor [1, 1, 1];	
}forEach 	[
				[2105.26,13315,3],
				
				[4578.7,8435.3],
				
				[4509.97,8391.51,3],[4502.31,8404.99,6]
			];