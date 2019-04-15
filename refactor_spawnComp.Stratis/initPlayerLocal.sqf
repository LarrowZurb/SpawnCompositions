//[ COMP_NAME, POS_ATL, OFFSET, DIR, ALIGN_TERRAIN ] call LARs_fnc_spawnComp;

//COMP_NAME - Classname given to composition in missionConfigFile CfgCompositions

//POS_ATL( optional ) - Position to spawn composition
//	If not given or empty array passed then original saved composition position is used
//	Also accepts OBJECT, MARKER, LOCATION

//OFFSET( optional ) - ARRAY [ x, y, z ] ammount to offset composition, as a compositions base pos can vary from what you want when its saved

//DIR( optional ) - Direction to face composition in, If POS_ATL is of type OBJECT, MARKER, LOCATION passing TRUE for direction will use objects direction

//ALIGN_TERRAIN( optional ) - BOOL, Whether composition objects should align themselves to their positions surface normal

player addAction [ "Move to", { player setVehiclePosition [ screenToWorld[ 0.5, 0.5 ], [], 0, "NONE" ]; } ];
player addAction [ "Ant", { [ "Ant", player getPos [ 25, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];
player addAction [ "Walk", { [ "Walk", player getPos [ 25, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];
player addAction [ "Task", { [ "Task", player getPos [ 25, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];
player addAction [ "Sector", { [ "Sector", player getPos [ 25, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];
player addAction [ "Mission", { [ "Mission", player getPos [ 25, getDir player ], [0,0,0], getDir player ] call LARs_fnc_spawnComp } ];
player addAction [ "Positions", { player setPos [2944.37,6033.08,0.00143886]; player setDir 162.617; [ "Positions" ] call LARs_fnc_spawnComp } ];
player addAction [ "Random start pos", {  player setPos [1796.65,5581.42,0.00143862]; player setDir 108.018; [ "randomStartPos" ] call LARs_fnc_spawnComp } ];
player addAction [ "Tower", { [ "Tower", player getPos [ 25, getDir player ], [0,0,0], 0, false ] call LARs_fnc_spawnComp } ];
player addAction [ "Inventories", { [ "inventories", player getPos [ 10, getDir player ], [0,0,0], getDir player ] call LARs_fnc_spawnComp } ];
player addAction [ "Helis", { [ "helis", player getPos [ 10, getDir player ], [0,0,0], getDir player ] call LARs_fnc_spawnComp } ];
player addAction [ "Truck", { [ "truck", player getPos [ 10, getDir player ], [0,0,0], getDir player, true ] call LARs_fnc_spawnComp } ];
player addAction [ "Truck_damage", { [ "truck_damage", player getPos [ 10, getDir player ], [0,0,0], getDir player, false ] call LARs_fnc_spawnComp } ];
player addAction [ "Persian", { player setPos [2198.93,5727.35,0.00143862]; player setDir 349.46, [ "persian" ] call LARs_fnc_spawnComp } ];

player addAction [ "dir 0", { [ "dir", player getPos [ 25, getDir player ], [0,0,0], 0, true ] call LARs_fnc_spawnComp } ];
player addAction [ "dir 90", { [ "dir", player getPos [ 25, getDir player ], [0,0,0], 90, true ] call LARs_fnc_spawnComp } ];
player addAction [ "dir 180", { [ "dir", player getPos [ 25, getDir player ], [0,0,0], 180, true, false ] call LARs_fnc_spawnComp } ];
player addAction [ "dir 270", { [ "dir", player getPos [ 25, getDir player ], [0,0,0], 270, true ] call LARs_fnc_spawnComp } ];

player addAction [ "Set roadBlock", {
		params [
			"_target",
			"_caller",
			"_id",
			"_args"
		];
		
		_nearRoad = ( player nearRoads 10 ) select 0;
		_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
		_dir = _nearRoad getDir _nextRoad;
		
		[ "roadBlock", getPosATL _nearRoad, [1.5,-3,-0.05], _dir, true ] call LARs_fnc_spawnComp;
	},
	[],
	1,
	true,
	true,
	"",
	//_target (unit to which action is attached to) and _this (caller/executing unit)
	"count ( _target nearRoads 10 ) > 0 && { count roadsConnectedTo (( _target nearRoads 10 ) select 0 ) > 0 }"
];

player addAction [ "check road dir", {params [
			"_target",
			"_caller",
			"_id",
			"_args"
		];
		
		_nearRoad = ( player nearRoads 10 ) select 0;
		_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
		_dir = _nearRoad getDir _nextRoad;
		
		[ "dir", getPosATL _nearRoad, [0,0,0], _dir, true ] call LARs_fnc_spawnComp;
	},
	[],
	1,
	true,
	true,
	"",
	//_target (unit to which action is attached to) and _this (caller/executing unit)
	"count ( _target nearRoads 10 ) > 0 && { count roadsConnectedTo (( _target nearRoads 10 ) select 0 ) > 0 }"
];

player addAction [ "Boat", { [ "boat", player getPos [ 10, getDir player ], [0,0,0], getDir player, true, true ] call LARs_fnc_spawnComp } ];
player addAction [ "Boat sunk", { [ "boat_sunk", player getPos [ 10, getDir player ], [0,0,0], getDir player, true, false ] call LARs_fnc_spawnComp } ];

player addAction [ "Pier", { [ "pier", player getPos [ 20, getDir player ], [0,0,0], getDir player, false, true ] call LARs_fnc_spawnComp } ];