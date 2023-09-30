private ["_return", "_loctype", "_locarea"];

_return = [0,0,0];
_loctype = _this select 0;
if (count _this > 1) then
{
	_locarea = _this select 1;
}else
{
	_locarea = "map";
};

switch (toLower worldName) do
{
	case "altis":
	{
		switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[2726.13,22067.8,0],
						[3059.7,18167.7,0],
						[4243.51,16440.4,0],
						[3306.4,14105.4,0],
						[3135.73,11754.8,0],
						[2730.78,9838.71,0],
						[7495.49,10850.3,0],
						[9271.47,10910.5,0],
						[12111.3,12401.6,0],
						[13712.4,14969.4,0],
						[16300.4,15695.5,0],
						[18023.2,19181.3,0],
						[17352.9,19507.1,0],
						[16820.8,19905.8,0],
						[16636.1,20645.9,0],
						[16972.8,21988,0],
						[16099.3,21997.3,0],
						[13961.3,23140.7,0],
						[12180.2,22920.4,0],
						[11072.4,22582.2,0],
						[8807.41,23426.8,0],
						[6567.02,22644.9,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[10083.4,10232.8,0],
						[9763.8,9643.22,0],
						[8578.45,7356.38,0],
						[13755.9,6406.86,0],
						[12879.3,9826.26,0]
					]
				};
				if (_locarea == "island3") then
				{
					_return =
					[
						[16751.8,13635.1,0],
						[14963,11056.5,0],
						[16438.4,9869.58,0],
						[18612.1,6307.3,0],
						[22267.5,5112.63,0],
						[21937,6484.17,0],
						[22191.5,8513.55,0],
						[21615.9,9233.45,0],
						[21864.1,10961.8,0],
						[21457.6,11897.4,0],
						[22764,13819.7,0]
					]
				};
				if (_locarea == "island4") then
				{
					_return =
					[
						[24123.1,16150.1,0],
						[25177.5,18891.4,0],
						[26682.5,20562.4,0],
						[28043.2,21980.5,0],
						[27833.7,23612.7,0],
						[28266.6,25739.8,0],
						[26238.8,24171.2,0],
						[25113.9,23395.4,0],
						[24108.5,24064.1,0],
						[23438.3,24298.4,0],
						[23599.6,23078.9,0],
						[22290.2,21958.7,0],
						[21689.4,21201.3,0],
						[22009,20188.2,0],
						[21520.3,19918.2,0],
						[20704.2,20334,0]
					]
				};						
			};
			case "patrolpoints":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[4522.37,21442.9,0],
						[3836.38,17508.3,0],
						[5051.99,16155.1,0],
						[3771.05,13650.5,0],
						[3477.35,13108.9,0],
						[4149.89,11740.4,0],
						[3625.46,10373.4,0],
						[5100.77,11253.2,0],
						[7221.59,11033.1,0],
						[8964.25,11982.5,0],
						[10674.8,12266.5,0],
						[10984.4,13521.4,0],
						[11695,13788.3,0],
						[12571.6,14357.7,0],
						[11131.8,14562.5,0],
						[12981.2,15025.7,0],
						[12342,15683.6,0],
						[16635,16054.4,0],
						[16351.2,17274.2,0],
						[17822.1,18133.7,0],
						[16685.6,20438.9,0],
						[14464.1,17718.6,0],
						[14062.3,18764.4,0],
						[14646,20751,0],
						[11745.3,18313.6,0],
						[12735.8,19707.6,0],
						[9514.78,20322.8,0],
						[8624.99,18287.5,0],
						[9673.03,22271.4,0],
						[9282.89,15859.3,0],
						[7358.84,15441.9,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[11573.1,9431.69,0],
						[11532.5,7106.44,0],
						[8971.22,7686.29,0],
						[9343.58,8134.68,0],
						[10654.8,8170.68,0],
						[11904.9,8576.12,0],
						[11569.8,9435.66,0],
						[10798.7,10545,0]
					]		
				};
				if (_locarea == "island3") then
				{
					_return =
					[
						[17584.6,14468,0],
						[19742.2,15061.7,0],
						[22201.9,15260,0],
						[21651.6,14027.5,0],
						[20273,11718.2,0],
						[21240.8,11016.2,0],
						[20485,8851.72,0],
						[21743.3,7518.28,0],
						[22717.8,6949.3,0],
						[20786.1,6781.73,0],
						[19645.1,7760.44,0],
						[16920.4,9969.98,0],
						[14962.3,11123.5,0],
						[16687.4,12736.2,0],
						[19401.3,13248,0]
					]		
				};
				if (_locarea == "island4") then
				{
					_return =
					[
						[16892.9,15474.6,0],
						[18185.3,15224.8,0],
						[18838.4,16655.4,0],
						[19283.2,17620.7,0],
						[20169.4,19948.7,0],
						[22453,20010.2,0],
						[23200.7,19957.6,0],
						[21695.4,20981,0],
						[23732.8,21855.6,0],
						[25745.2,23481.6,0],
						[27093.5,23298.6,0],
						[26839.8,21249.9,0],
						[25797.2,21448.5,0],
						[23909.2,20172.3,0],
						[24753.2,19154.2,0],
						[20911.5,16984.8,0],
						[21375.4,16435.6,0],
						[19500.7,15414.6,0]
					]		
				};
			};
			case "military":
			{
				_return =
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",130,"Molos Airstrip",[26932,24772.2,0],[300,150],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",190,"Radar Station",[25277,21827,0],[150,100],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",203,"FOB",[23593,21103,0],[200,125],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[20641,20089,0],[120,75],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Research Station",[20943,19251,0],[140,140],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",170,"Military Outposts",[20486,18790,0],[175,75],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",141,"Military Outposts",[23068,7291,0],[125,100],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",278,"Feres Airfield",[20984,7345,0],[325,300],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[20050,6693,0],[120,120],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",223,"Military Outposts",[16738,12168,0],[200,100],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",227,"FOB",[17463,13195,0],[140,140],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Lookout",[17628,17276,0],[140,140],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Research Facility",[16082,16997,0],[190,190],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Gravia Airport Military Base",[15161,17261,0],[300,210],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Gravia Airport Military Hangers",[14371,16341,0],[300,210],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Gravia Airport & Military Base",[14748,16559,0],[1100,400],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Military Installation",[12822,16695,0],[200,150],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[12467,15193,0],[90,50],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[14299,13060,0],[90,70],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",124,"Therisa Airfield",[11571,11692,0],[375,250],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Lookout",[12296,8890,0],[80,80],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Comms Relay",[8298,10079,0],[80,80],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Comms Relay",[4556,15416,0],[80,80],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[6832,16057,0],[50,50],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[9861,19390,0],[200,110],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",142,"NW Altis Airstrip",[9099,21520,0],[220,110],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Outpost",[14172,21222,0],[100,100],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",136,"Military Outpost",[13810,18960,0],[75,40],"ELLIPSE","Border"]

				]
				
			};
			case "industrial":
			{
				_return =
				[
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Thronos Castle",[4859,21932,0],[150,125],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Factory",[5397,17915,0],[100,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Factory",[6186,16227,0],[250,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Power Plant",[4426,15083,0],[100,75],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",151,"Factory",[5364,14530,0],[100,75],"RECTANGLE","Border"],	
					["TDMC_rescueMarker", "Empty","ColorRed",133,"Military Silo's",[4186,12843,0],[200,120],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",133,"Kastro Castle",[3091,13186,0],[225,175],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",160,"Factory",[3273,12450,0],[50,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",135,"Factory",[3823,12411,0],[110,60],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",135,"Solar Power Array",[8199,10903,0],[100,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",140,"Small Factory",[9282,12137,0],[50,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",237,"Factory",[10192,14944,0],[250,150],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",237,"Factory Complex",[9540,15155,0],[300,200],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Old Factory",[8835,15921,0],[115,115],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",216,"Building Site",[11393,14214,0],[150,135],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",220,"Factory Complex",[12590,16382,0],[185,160],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",134,"Gravia Airport Terminal",[14583,16827,0],[185,130],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",172,"Power Plant",[15506,16134,0],[350,400],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",135,"Factory Complex",[14338,18950,0],[150,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Charkia Storage Facility",[18318,15569,0],[170,120],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",160,"Charkia Storage Facility",[21864,20997,0],[320,170],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",151,"Factory",[25409,20339,0],[65,75],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",140,"Factory",[27004,21522,0],[110,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",144,"Factory",[28324,25767,0],[60,70],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Solar Array Complex",[20629,15828,0],[275,275],"RECTANGLE","Border"]
					
				]
			};
		};
	};

	case "cup_chernarus_a3":
	{
		_return =  switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "map") then
				{
					[
						[12.5014,13260.2,0],
						[1429.66,15344.6,0],
						[1849.66,15349.6,0],
						[3257.81,15352.9,0],
						[4309.14,15352.3,0],
						[4520.85,15354.7,0],
						[6709.75,15354.1,0],
						[6202.49,15340.1,0],
						[9316.76,15354.4,0],
						[9598.99,15342,0],
						[10101,15328,0],
						[11797.5,15354.3,0],
						[28.6781,1588.74,0],
						[12.2718,8811.07,0],
						[27.858,9648.39,0],
						[9.79543,10483.6,0],
						[49.8293,3789.06,0],
						[265.786,5595.46,0]
					]
				};
			};
			case "patrolpoints":
			{
				if (_locarea == "map") then
				{
					[
						[2855.06,15184.8,0],
						[3414.11,14812.7,0],
						[3669.45,14888.5,0],
						[4943.19,15075,0],
						[5821.16,15258.2,0],
						[6610.27,15173.3,0],
						[11631.2,15020.4,0],
						[12951.6,15094.6,0],
						[14078.9,15014.8,0],
						[14811.9,14557.9,0],
						[13575.8,14038.5,0],
						[13945.3,13270.2,0],
						[11998,14397.4,0],
						[11604.9,14630.4,0],
						[10797.8,14417.6,0],
						[12548.6,14766.7,0],
						[9409.55,14636.2,0],
						[9587.68,13752.9,0],
						[8479.59,14037.8,0],
						[6672.38,14476,0],
						[1530.27,11974.9,0],
						[2855.03,12377.8,0],
						[3570.53,12580.8,0],
						[4908.44,12882.9,0],
						[5427.7,12708.6,0],
						[5631.8,13147.6,0],
						[5890.17,13554.8,0],
						[7688.56,12638.1,0],
						[8049.09,12727.1,0],
						[12121,13691.9,0],
						[13325,12948.5,0],
						[11244,12239.4,0],
						[8760.36,11647.4,0],
						[8097.33,11600.3,0],
						[5981.33,10348.2,0],
						[1136.25,10005.3,0],
						[2745.82,9998.27,0],
						[1557.53,8958.09,0],
						[3804.13,8870.55,0],
						[5333.12,8587.44,0],
						[6065.92,7768.87,0],
						[7071.48,7683.4,0],
						[9454.26,8816.53,0],
						[10420.7,9841.85,0],
						[9943.99,10383.3,0],
						[12045.2,9093.2,0],
						[12311.6,9558.33,0],
						[12954,10191,0],
						[12300.2,10912.8,0],
						[12988.5,8034.99,0],
						[10683.6,8044.25,0],
						[3059.75,7917.1,0],
						[991.42,7676.72,0],
						[1271.14,6315.49,0],
						[445.668,5175.39,0],
						[2356.91,5273.65,0],
						[2778.12,5374.96,0],
						[2527.53,6384.92,0],
						[4412.46,6414.45,0],
						[4765.08,6760.5,0],
						[7545.42,5145.47,0],
						[8407.84,5984.33,0],
						[8424.06,6678.62,0],
						[9654.04,6555.4,0],
						[11233.9,6551.87,0],
						[13409.5,6245.04,0],
						[12153.2,7266.67,0],
						[12991.8,8036.03,0],
						[12781.4,4453.57,0],
						[11275.2,5493.44,0],
						[10096.4,5495.91,0],
						[9153.15,3901.02,0],
						[5838.23,4781.15,0],
						[4361.01,4679.63,0],
						[1692.01,3842.37,0],
						[1124.23,2374.26,0],
						[1911.87,2244.19,0],
						[1693.92,3843.15,0],
						[3665.61,2481.54,0],
						[4499.79,2454.58,0],
						[3317.17,3935.16,0],
						[6904.9,2394.94,0],
						[6601.24,2429.82,0],
						[6779.74,2692.45,0],
						[7975.95,3301.74,0],
						[10047.9,1796.69,0],
						[10527.3,2252.87,0],
						 [12076.8,3560.47,0]
					]
				};
			};
			case "military":
			{
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",240,"Grishino Airfield",[4508,10241,0],[1075,400],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",240,"Pobeda Miltary Barracks",[3675,14851,0],[140,70],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",35,"Kemensk Miltary Base",[7906,14694,0],[335,215],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",22,"Krasnostav Airbase",[12150,12533,0],[375,250],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Zelenogorsk Miltary Depot",[2491,5120,0],[120,100],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Chernogorsk Military Outpost",[7292,3059,0],[180,180],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",30,"Chernogorsk Military Outpost",[4934,2420,0],[400,125],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",240,"Military Base",[1468,14010,0],[600,500],"RECTANGLE","Border"]
				]
			};
			case "industrial":
			{
				[
					["TDMC_rescueMarker", "Empty","ColorRed",310,"Industrial Complex",[6387.85,4796.82,0],[95,65],"RECTANGLE","Border"],
					//unfinished not started
					["TDMC_rescueMarker", "Empty","ColorRed",62,"Factory",[11366.2,9409.05,0],[105,125],"RECTANGLE","Border"]
				]
			};
		};
	};

	case "enoch":
	{
		_return =  switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "map") then
				{
					[
						[3953.96,12784.3,0],
						[119.279,10313.6,0],
						[174.26,9755.6,0],
						[6.01524,8909.98,0],
						[17.949,6743.21,0],
						[15.547,4943.21,0],
						[11.1877,3831.3,0],
						[12.5613,3589.08,0],
						[9.91461,2861.8,0],
						[23.616,1519.66,0],
						[4207.06,120.238,0],
						[12800.6,2747.6,0],
						[12794.5,3676.97,0],
						[12795.9,4302.08,0],
						[12774,5070.43,0],
						[12773.4,5690.88,0],
						[12764.1,6306.51,0],
						[12788.9,7848.96,0],
						[12779.4,8043.27,0],
						[12779.8,8798.74,0],
						[10248.5,12792.2,0],
						[8495.63,12790.7,0],
						[7356.84,12788.1,0],
						[5834.37,12794.3,0]
					]
				};
			};
			case "patrolpoints":
			{
				if (_locarea == "map") then
				{
					[
						[3682.73,11817.6,0],
						[4996.05,9956.51,0],
						[1453.32,9758.24,0],
						[1749.17,7341.05,0],
						[4050.17,7953.21,0],
						[4757.36,7617.4,0],
						[4600.36,6405.53,0],
						[3144.34,6823.56,0],
						[869.393,5510.48,0],
						[11326.7,666.125,0],
						[6103.7,4139.26,0],
						[5799.4,5100.42,0],
						[5233.77,5577.1,0],
						[7318.73,6352.16,0],
						[7693.49,5290.59,0],
						[8477.89,6833.05,0],
						[11221.3,4340.87,0],
						[10104.1,6897.52,0],
						[11440.1,9620.64,0],
						[9782.82,8525.5,0],
						[9281.43,10890.1,0],
						[10683.8,10983.7,0],
						[8427.24,12016.2,0],
						[6491.47,11268.4,0],
						[6310.32,10186.1,0],
						[5978.48,8048.57,0],
						[3258.29,2132.28,0],
						[11252.8,2591.34,0],
						[10257.6,2122.06,0],
						[10645.8,1319.47,0]
					]
				};
			};
			case "military":
			{
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",138,"Lukow Airfield",[3886,10227,0],[600,250],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",345,"Military Storage Facility",[2156.5,11019.7,0],[150,350],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Base",[7919.43,9725.71,0],[185,250],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",351,"Military Base",[8171.77,10783,0],[90,200],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",5,"Miltiary Training Camp",[9920.02,3909.21,0],[130,165],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Military Communications Relay",[8919.45,2052.14,0],[100,100],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",350,"Military Base",[5083.78,2129.76,0],[340,240],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",329,"Military Base",[5619.91,3789.56,0],[140,110],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",329,"Dambog Military Watch Tower",[545,1112,0],[50,50],"ELLIPSE","Border"]
				]
			};
			case "industrial":
			{
				[
					["TDMC_rescueMarker", "Empty","ColorRed",310,"Industrial Complex",[6387.85,4796.82,0],[95,65],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",47,"Factory",[2599.91,5445.56,0],[160,65],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Quarry",[1174.75,8914.69,0],[220,200],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",311,"Factory",[11164.3,11423.5,0],[70,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Factory",[1779.32,7631.21,0],[350,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Factory",[10970.8,9023.11,0],[175,125],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",348,"Power Plant",[11547.3,7092.52,0],[110,130],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",49,"Factory",[7452.73,2638.23,0],[400,350],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",62,"Factory",[11366.2,9409.05,0],[105,125],"RECTANGLE","Border"]
				]
			};
		};
	};

	case "cam_lao_nam":
	{
		_return =  switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "map") then
				{
					[
						[1095.67,15221.9,0],
						[746.207,13175.2,0],
						[590.825,11925.7,0],
						[955.905,8941.78,0],
						[2975.84,8873.42,0],
						[3022.88,8177.24,0],
						[3804.32,7975.88,0],
						[2137.36,15367.9,0],
						[2422.07,16694.4,0],
						[2127.68,17504.9,0],
						[1622.29,19150.8,0],
						[3917.34,19748.4,0],
						[2734.2,16792.4,0],
						[10820.5,18933.2,0],
						[11696.9,20166,0],
						[12619.4,19755.6,0],
						[12151.3,19663.7,0],
						[14775.6,18602.7,0],
						[14451.1,17846,0],
						[14037,18154.1,0],
						[14657.9,16432.7,0],
						[14917.5,16275.1,0],
						[14596.1,15561.4,0],
						[14890,15278.2,0],
						[15888.5,14230.8,0],
						[15566.5,14381.2,0],
						[14701.3,13410.9,0],
						[13822.4,13535.8,0],
						[14789.9,12435.8,0],
						[16669.8,12355.3,0],
						[18476,10687.4,0],
						[18854.5,10264.2,0],
						[19319,8752.18,0],
						[19321.7,7024.96,0],
						[19758.8,6434.73,0],
						[19062.4,3915.83,0],
						[18182.5,3951.68,0],
						[18773.4,4753.47,0],
						[18320.9,5506.63,0],
						[16982.2,3002.39,0],
						[15622.1,2805.14,0]	
					]
				};
			};
			case "patrolpoints":
			{
				if (_locarea == "map") then
				{
					[
						[971.162,8915.48,0],
						[1519.83,9530.36,0],
						[1844.56,10388.7,0],
						[1042.56,11349.1,0],
						[1117.27,12416.2,0],
						[1698.39,12912.9,0],
						[1267.81,13661.6,0],
						[1124.59,15079.7,0],
						[4823.98,15094.2,0],
						[2801.6,16878.6,0],
						[2505.68,17139.1,0],
						[2320.27,17560,0],
						[1672.87,19208.6,0],
						[3914.47,19748.6,0],
						[5722.19,17063.6,0],
						[5229.28,16801.6,0],
						[9127.9,16297.4,0],
						[7668.02,16783.7,0],
						[10470.3,18143.3,0],
						[12405.9,19269.3,0],
						[12715.2,19776.6,0],
						[13107.3,19757.8,0],
						[13061.5,19357.7,0],
						[13309.5,19374.7,0],
						[13411.1,18787.7,0],
						[14059.6,18047,0],
						[12316.2,16556.8,0],
						[12575.6,16787.7,0],
						[12824.7,17166.8,0],
						[13033.3,16953,0],
						[14752.3,15599.2,0],
						[14138.1,15742.1,0],
						[14554.9,15135.5,0],
						[13377,14234.2,0],
						[13903.9,13685.7,0],
						[15306.7,13384.6,0],
						[15145.7,12755.3,0],
						[13096.2,13450.5,0],
						[11783.7,13104.9,0],
						[15078.9,11048.1,0],
						[18444.2,10677.4,0],
						[18851.7,10267.8,0],
						[18210.6,10025.1,0],
						[18665.6,9309.81,0],
						[19311.8,8765.37,0],
						[17361.3,9333.11,0],
						[17475.7,9035.35,0],
						[17723.4,9207.48,0],
						[17609.9,8732.45,0],
						[17036.8,8995.4,0],
						[19736.5,6835.45,0],
						[15930.8,8813.57,0],
						[16792,6114.56,0],
						[18419.4,5243.15,0],
						[18287.9,4597.12,0],
						[18073.1,4128.27,0],
						[16599.6,3867.71,0],
						[16042.6,3602.94,0],
						[7836.49,9114.98,0],
						[6405.31,9305.85,0],
						[5095.74,9486.77,0],
						[3359.64,7715.42,0],
						[3132.97,8704.54,0],
						[2623.16,11231.6,0],
						[2951.92,11794,0]
					]
				};
			};
			case "military":
			{
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"FOB6 Ho Ngoc Tao",[15250.564,4697.21,0],[225,175],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",138,"FOB5 Ban Me Thuot",[17337,5581,0],[200,150],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",157,"FOB1 Phu Bai",[18618,8372,0],[210,160],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",139,"Hue Military Base",[17628,9420,0],[70,70],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",132,"FSB Khe Gio",[16168,11007,0],[145,95],"ELLPISE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",50,"Pem Pat Base",[15661,13491,0],[185,90],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",80,"Bok Raz Ocra Military Garason",[12034,16544,0],[45,25],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",13,"Cang Ra Garason",[11796,16817,0],[30,30],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Son Tay POW Camp",[12106,17672,0],[115,115],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",205,"Khung Kiem Base",[11987,18323,0],[80,90],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",57,"Phok Ham",[2209,13396,0],[125,110],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Ke Chau",[3208,13675,0],[70,70],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Phu Quoc POW Camp",[6848,4570,0],[140,120],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Phu Quoc Lookout",[6928,5407,0],[60,60],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Comms Hill",[11372,5766,0],[75,75],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",90,"FSB Quan Loi",[11456,6319,0],[200,140],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",90,"FSB Berchtesgaden",[13734,8389,0],[140,120],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"A Luoi",[12853,8507,0],[50,50],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",190,"FOB2 Kon Tum",[14774,6869,0],[175,160],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",156,"Camp Phoang Thi ",[14136,12794,0],[70,60],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"FOB3 Mai Loc",[14761,9600,0],[110,100],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",158,"FOB4 Da Nang",[20135,6606,0],[170,120],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Pleiku Airbase",[16567,7051,0],[1200,830],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",20,"Plei Mei SF Camp",[16324,8106,0],[110,110],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",57,"Saigon Military Base",[16076,3667,0],[90,50],"RECTANGLE","Border"]
				]
			};
			case "industrial":
			{
				[
					["TDMC_rescueMarker", "Empty","ColorRed",310,"Industrial Complex",[6387.85,4796.82,0],[95,65],"RECTANGLE","Border"]
					//incomplete above is rubbish
				]
			};
		};
	};
	
	case "lythium":
	{
		_return =  switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "map") then
				{
					[
						[875.774,16328.1,0],
						[8810.9,20414.8,0],
						[18672.1,20180.2,0],
						[20167.7,17687.2,0],
						[20132.3,13453.3,0],
						[19291.1,9056.23,0],
						[20324.4,5043.89,0],
						[20199.7,450.294,0],
						[16417.7,162.95,0],
						[14676.8,352.046,0],
						[6069.75,986.471,0],
						[1012.72,274.644,0],
						[85.2271,4262.11,0],
						[335.027,6985.62,0],
						[33.8503,13324.2,0]
					]
				};
			};
			case "patrolpoints":
			{

				if (_locarea == "map") then
				{
					[
						[2675.6,16145.1,0],
						[1361.06,14284.1,0],
						[3812.32,13113.7,0],
						[4132.15,12100.1,0],
						[5218.61,11777.6,0],
						[5509.36,10458.5,0],
						[7170.74,2506.82,0],
						[7276.36,4348.58,0],
						[5848.67,17628.2,0],
						[8285.56,16149.8,0],
						[5873.6,14113,0],
						[8147.65,13339.5,0],
						[9554.17,14081.9,0],
						[9802.77,11438.2,0],
						[10629.1,10129.2,0],
						[10864.7,8063.87,0],
						[11972.8,7583.05,0],
						[11450.1,6532.14,0],
						[11917.2,5006,0],
						[11463.3,2962.28,0],
						[16177.3,3071.49,0],
						[17900.1,2773.45,0],
						[17052.1,5820.03,0],
						[16473.3,6734.95,0],
						[19071.3,14510.9,0],
						[19845,19898.4,0],
						[16445.2,20219.1,0],
						[13488.1,17591.3,0]
					]
				};
			};
			case "military":
			{
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",46.397,"Bushlurker Camp Base",[5262.76,10775.2,0],[100,70],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",46.397,"Puesto Vulcan",[4987.83,17490.1,0],[50,70],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Martin Fob",[3850.86,17828.5,0],[80,80],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",176.299,"Regimento 44 Base",[12312,1956.6,0],[100,220],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Green Camp Base",[10930.9,7572.82,0],[60,60],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",19.705,"Mikis Fob",[9679.88,11336.8,0],[40,40],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",13.533,"Puesto Crow",[13757.7,9346.44,0],[60,90],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",133.642,"Iban Camp Base",[13969.7,3404.77,0],[45,65],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0.899,"Pelton Camp Base",[15112,4351.41,0],[40,65],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",147.736,"Faboano Camp Base",[15796.2,5574.36,0],[40,65],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",359.486,"Military Fob",[17377.8,5793.94,0],[60,90],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",359.486,"Military Fob",[16995.5,5929.17,0],[75,60],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Limar Military Fob",[2587.59,15912.8,0],[55,30],"RECTANGLE","Border"]
				]
				
			};
			case "industrial":
			{
				[
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Kinduf Factory",[15070.2,449.402,0],[180,90],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Offar Chemical Plant",[17469.9,2908.93,0],[170,120],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Limar Water Pumping Station",[2691.94,15987.7,0],[160,110],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Zregurat Mining Complex",[10009.8,1372.91,0],[140,140],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Arobster Power Plant",[16473.4,5990.64,0],[60,80],"RECTANGLE","Border"]
				]
			};
		};
	};
	
	case "malden":
	{
		switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[5529.97,11618.3,0],
						[6796.2,11424.2,0],
						[8225.02,8754.75,0],
						[8517.5,7704,0],
						[8071.2,6584.11,0],
						[8275.28,6037.27,0],
						[8267.05,2874.23,0],
						[6826.01,2741.5,0],
						[5752.73,2417.59,0],
						[5144.57,1206.89,0],
						[3572.3,3276.05,0],
						[1079.27,652.354,0],
						[1620.73,4636.18,0],
						[2831.97,7536.27,0],
						[2840.38,7545.96,0],
						[3047.09,8461.94,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[9484.84,3288.88,0],
						[9348.43,3738.18,0],
						[9980.03,4232.72,0],
						[10508.2,4032.96,0]
					]
				};		
			};
			case "patrolpoints":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[5555.55,11193.2,0],
						[7130.86,8962.97,0],
						[8271.86,10144.4,0],
						[6011.48,8639.14,0],
						[7267.61,7911.23,0],
						[7040.77,7133.17,0],
						[7121.22,6070.19,0],
						[8160.37,3130.07,0],
						[5908.66,3522.91,0],
						[5405.41,2802.7,0],
						[5557.73,4233.29,0],
						[3720.48,3284.92,0],
						[3165.2,6325.96,0],
						[5662.62,6982.45,0],
						[4977.68,7449.8,0],
						[4496.84,8224.74,0],
						[3582.89,8515.93,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[9544.02,4186.8,0],
						[9348.78,3740.74,0],
						[9766.4,3945.02,0],
						[9646.16,3341.36,0],
						[9982.32,4231.12,0],
						[10114.8,4017.79,0],
						[10509.2,4033.3,0],
						[11339.2,4134.15,0],
						[11634,4449.62,0]
					]
				};		
			};
			case "military":
			{
				_return = 
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Tuvanaka Airbase",[2137,13203,0],[450,200],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Moray Airfield",[927,12100,0],[400,300],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",10,"Old Military Station",[6101,10710,0],[400,250],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",116,"Military Installation",[7080,10085,0],[250,175],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",171,"Military Base",[7501,10575,0],[100,100],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",171,"Maldon Airport",[8059,10091,0],[300,800],"RECTANGLE","Border"]
				]
			};
			case "industrial":
			{
				_return = 
				[
					["TDMC_rescueMarker", "Empty","ColorRed",0,"La Riviere Harbour",[3596,3202,0],[120,120],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",163,"Chapoi Electrical Substation",[5963,3443,0],[50,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",125,"Factory",[7655,3680,0],[50,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",280,"Factory",[8353,3103,0],[35,35],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Le Port Harbour",[8459,3857,0],[100,160],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",348,"Fuel Depot",[7883,4032,0],[100,40],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",175,"Storage Facility",[7714,4196,0],[70,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Storage Facility",[7418,8104,0],[50,50],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Military Base",[9538,3865,0],[300,200],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",173,"Military Buildings",[11647,4471,0],[100,50],"RECTANGLE","Border"]
				]
			};
		};
	};

	case "takistan":
	{
		_return =  switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "map") then
				{
					[
						[7416.52,34.3658,0],
						[11729.5,2560.98,0],
						[11039.8,6291.35,0],
						[11448.4,8199.44,0],
						[12637.2,9831.65,0],
						[12789.7,10944.9,0],
						[11025.8,12792.3,0],
						[9166.15,12720.8,0],
						[7182.55,12794.2,0],
						[4578.5,12783.8,0],
						[2488.47,12794.1,0],
						[1908.48,12610.3,0],
						[1518.17,12004.4,0],
						[830.652,10474.4,0],
						[1869.21,10632.7,0],
						[29.8919,7066.61,0],
						[9.76223,5499.98,0],
						[73.5957,2783.65,0],
						[2132.87,289.327,0]
					]
				};
			};
			case "patrolpoints":
			{

				if (_locarea == "map") then
				{
					[
						[6092.72,1160.72,0],
						[9241.13,1849.61,0],
						[8442.29,2448.23,0],
						[10130.3,2324.86,0],
						[11833.4,2609.35,0],
						[7996.7,2964.76,0],
						[6533.99,2088.43,0],
						[6093.65,1158.73,0],
						[4407.92,808.997,0],
						[3573.43,1250.35,0],
						[2089.68,318.711,0],
						[3537.04,4151.68,0],
						[5299.74,4743.42,0],
						[6591.86,4555.83,0],
						[8908.73,5323.85,0],
						[10874.3,6303.78,0],
						[9127.43,6756.92,0],
						[8248.4,7785.65,0],
						[11496.2,8298.24,0],
						[12273,10367.9,0],
						[12324.4,11117.8,0],
						[10510.4,11089.3,0],
						[9799.42,11432.4,0],
						[6883.34,12228.1,0],
						[6213.56,11120.6,0],
						[5678.98,9955.26,0],
						[4206.95,10687.9,0],
						[3081.49,9952.4,0],
						[1816.84,11940.8,0],
						[3635.17,8628.69,0],
						[2044.95,7698.39,0],
						[1456.76,5777.53,0],
						[2512.44,5100.98,0],
						[1421.1,3508.05,0],
						[505.878,2818.19,0],
						[3681.94,4381.36,0],
						[6114.59,5638.89,0],
						[5227.27,6156.73,0],
						[5938.43,7396.2,0],
						[5687.52,8948.07,0],
						[5518.01,9310.4,0]
					]
				};
			};
			case "military":
			{
				[
					["TDMC_attack_milMarker", "Empty","ColorRed",150,"Loy Manara Airfield",[8015.765,1886.065,0],[400,220],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Rasman Airbase",[5634,11413,0],[900,425],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",3,"Garmsar Military Base",[10420,6432,0],[150,75],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",165,"Feruz Abad Military Outpost",[5152,6071,0],[75,50],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",150,"Jilavur Military Compound",[2629,5096,0],[50,35],"RECTANGLE","Border"]
				]
				
			};
			case "industrial":
			{
				[
					["TDMC_rescueMarker", "Empty","ColorRed",135,"Nagara Oil Fields",[3603,11092,0],[550,500],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",150,"Lalezar Oil Stoarge Facility",[4587,9326,0],[600,250],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",45,"Par-e Siah Oil Fields",[8310,11153,0],[800,500],"ELLIPSE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",133,"Sagram",[9367,10045,0],[125,100],"RECTANGLE","Border"],
					["TDMC_rescueMarker", "Empty","ColorRed",28,"Mill",[5072,6880,0],[125,100],"ELLIPSE","Border"]
				]
			};
		};
	};

	case "tanoa":
	{
		switch (toLower _loctype) do
		{
			case "bordercrossings":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[4181.32,11683.9,0],
						[3231.91,11063.5,0],
						[1916.54,10644.4,0],
						[1691.28,12235.8,0],
						[1831.64,13283.9,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[1610.23,8502.53,0],
						[2264.98,8586.71,0],
						[876.586,7684.41,0],
						[2874.31,7297.93,0],
						[3370.97,6827.68,0],
						[1732.09,6156.04,0],
						[2796.21,5714.84,0]
					]
				};
				if (_locarea == "island3") then
				{
					_return =
					[
						[7169.81,4244.96,0],
						[5745.77,4095.04,0],
						[2318.46,1922.3,0],
						[1486.22,3032.11,0],
						[1644.07,4225.77,0],
						[2176.49,4526.3,0]
					]
				};
				if (_locarea == "island4") then
				{
					_return =
					[
						[10322.2,2638.84,0],
						[8972.85,4747.77,0],
						[9435.99,4187.69,0],
						[10156.2,5042.14,0],
						[12886.7,4744.13,0],
						[12730,3270.78,0],
						[13003.8,2139.99,0]
					]
				};
				if (_locarea == "island5") then
				{
					_return =
					[
						[10794,6326.08,0],
						[12957.1,7366.11,0],
						[14461.1,8904.12,0],
						[14623.6,9706.82,0],
						[6793.24,13377.9,0],
						[5000.56,11374.1,0],
						[5448.82,10103.4,0],
						[4641.17,8457.81,0],
						[6019.92,7330.26,0],
						[9812.26,6389.96,0]
					]
				};
			};
			case "patrolpoints":
			{
				if (_locarea == "island1") then
				{
					_return =
					[
						[1737.04,11964.6,0],
						[1921.21,10687.3,0],
						[3069.81,11135.1,0],
						[4158.65,11696.1,0],
						[3883.06,13367.4,0],
						[3452.16,12817.8,0],
						[2782.79,12580.2,0],
						[3271.39,13725.4,0],
						[1832.03,13284.2,0],
						[2526.53,11462.9,0]
					]
				};
				if (_locarea == "island2") then
				{
					_return =
					[
						[1611.52,8503.82,0],
						[2260.98,8576.29,0],
						[2359.42,8148.11,0],
						[876.299,7682.77,0],
						[2571.59,7365.26,0],
						[3355.73,6624.97,0],
						[3282.86,5899.7,0],
						[2355.72,6364.33,0],
						[1728.89,6163.17,0]
					]
				};
				if (_locarea == "island3") then
				{
					_return =
					[
						[5699.21,4924.43,0],
						[7117.49,4248.42,0],
						[5477.76,4053.4,0],
						[3619.79,2143.28,0],
						[3176.91,3388.21,0],
						[2169.15,4532.34,0],
						[1641.79,4230.17,0],
						[1523.78,3012.94,0]
					]
				};
				if (_locarea == "island4") then
				{
					_return =
					[
						[8957.66,4731.77,0],
						[8784.31,3686.43,0],
						[9348.38,4078.94,0],
						[10335.8,2667.19,0],
						[10900.1,2072.62,0],
						[11635.4,2723.14,0],
						[12996,2131.38,0],
						[13404.2,2987.59,0],
						[12149,2996.25,0],
						[12699.9,3287.29,0],
						[12453.9,3931.47,0],
						[12345.3,4555.37,0],
						[12806.3,4755.15,0],
						[11277.5,5182.62,0],
						[10422.5,5049.57,0],
						[9347.43,4080.32,0],
						[8952.11,4726.55,0]
					]
				};
				if (_locarea == "island5") then
				{
					_return =
					[
						[10815.5,6321.67,0],
						[12241.8,6752.16,0],
						[12912.1,7342.39,0],
						[12371.4,7999.21,0],
						[13921.3,8380.03,0],
						[14367.3,8875.43,0],
						[13979.9,9997.57,0],
						[14209,11588.5,0],
						[13358.8,12066.7,0],
						[12454.2,12691.3,0],
						[11630.2,13074.7,0],
						[11017.1,13303,0],
						[10355.2,13289,0],
						[9541.21,13605.4,0],
						[8397.33,13710.4,0],
						[7885.76,13541.2,0],
						[6933.06,13366.9,0],
						[6364.05,12793.9,0],
						[5754.32,12568.6,0],
						[5819.28,11179,0],
						[5803.06,10270.1,0],
						[5057.39,8627.12,0],
						[6834.35,7473.56,0],
						[7209.49,8025.55,0],
						[7875.46,7729.93,0],
						[9017.33,6716.63,0],
						[10810.7,6319.3,0],
						[9986.36,8785.28,0],
						[9172.45,8719.78,0],
						[7604.42,8770.18,0],
						[8796.61,10232.4,0],
						[11050.2,9833.25,0],
						[10649.4,11595,0],
						[11386.1,12368.8,0],
						[8129.76,12059.4,0],
						[5983.63,8643.27,0]
					]
				};			
			};
			case "military":
			{
				_return = [
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"GSM Station",[3009.6,13031.4,0],[100,120],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",57,"Comms Whiskey",[2680.14,12316.1,0],[45,60],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"Comms Relay",[2410.14,7229.96,0],[70,50],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",185,"Comms Bravo",[11045,11503,0],[150,85],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",185,"Comms Alpha",[10037,11789,0],[100,65],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",165,"Bala Airstrip",[2205,3476,0],[350,125],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",216,"Lijnhaven",[11655,3155,0],[450,125],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"La Rochelle Aerodome",[11811,13071,0],[450,150],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",79,"Aeoport de Tonoa",[6990,7315,0],[450,250],"RECTANGLE","Border"]
				]
				
			};
			case "industrial":
			{
				_return = [
					["TDMC_rescueMarker", "Empty","ColorRed",0,"Blue Pearl Industrial Port - East Docks",[14032,12315,0],[275,65],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",0,"La Rochelle Railyard",[8983,13778,0],[400,125],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",130,"Lumber Yard",[5553,11940,0],[150,125],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",233,"Saint Julien Railyard",[5436,11199,0],[100,175],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",45,"Saint-Julien Industrial Complex",[5643,11025,0],[65,80],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",163,"Georgetown Dockyard",[5393,10197,0],[235,175],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",230,"Regina Railyard",[4257,8446,0],[125,100],"ELLIPSE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Regina Railyard",[7428,8535,0],[150,100],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",212,"Tanoa Sugar Company",[8389,10317,0],[225,125],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",150,"Doodstil Housing Complex",[12832,4875,0],[50,50],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",166,"Harcourt Docks",[11185,5349,0],[120,60],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",134,"Katkoula Docks",[5595,3958,0],[120,90],"RECTANGLE","Border"],
					["TDMC_attack_milMarker", "Empty","ColorRed",34,"Oil Stoarage Facility",[5227,3652,0],[80,60],"RECTANGLE","Border"]
				]
			};
		};
	};
}; 

_return