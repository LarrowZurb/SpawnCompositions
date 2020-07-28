
//Spawns a logic from a composition

private _logic = objNull;
params[ "_cfg" ];

private _presence = [ ( _cfg >> "presence" ), "NUM", 1 ] call LARs_fnc_getCfgValue;
private _preCondition = [ ( _cfg >> "presenceCondition" ), "TXT", "true" ] call LARs_fnc_getCfgValue; //TODO: does this need defering

if ( random 1 <= _presence && { call compile _preCondition } ) then {

	private _type = getText( _cfg >> "type" );
	private _position = [ ( _cfg >> "PositionInfo" >> "position" ), "ARRAY", [0,0,0] ] call LARs_fnc_getCfgValue;
	private _ATLOffset = getNumber( _cfg >> "atlOffset" );
	private _rotation = [ ( _cfg >> "PositionInfo" >> "angles" ), "ARRAY", [0,0,0] ] call LARs_fnc_getCfgValue;
	private _varName = getText( _cfg >> "name" );

	//FIX: Seems to not to be saved in the composition ??
	//_placementRadius = getNumber( _cfg >> "Attributes" >> "placementRadius" );

	//TODO: Split logics into proper module grps
	//FIXED: module initialisation now handles groups for modules on side logic?? ( 1.86 )
	private _group = createGroup sideLogic;
	_logic = _group createUnit [ _type, [0,0,0], [], 0, "CAN_COLLIDE" ]; //No randomStart for logics

	//Handle initialisation of modules spawned at runtime( time > 0 ) ( A3 1.86 )
	//FIXED: Initialise timeline animations
	//Removed keyframe animation modules as they do not use the module framework to initialise
	//EDIT: excluded any type Module_F that has no function
	private _init = if ( _type isKindOf "Module_F" && { getText( configFile >> "CfgVehicles" >> _type >> "function" ) != "" } ) then {
		_logic setVariable[ 'BIS_fnc_initModules_disableAutoActivation', true ];
		"this setVariable[ 'BIS_fnc_initModules_disableAutoActivation', false ]; this setVariable[ 'BIS_fnc_initModules_activate', true ];"
	}else{
		_logic setVariable[ 'BIS_fnc_initModules_disableAutoActivation', false ];
		""
	};

	_position = [ _logic, _position, _rotation, _ATLOffset ] call LARs_fnc_setPositionandRotation;

	if !( _varName isEqualTo "" ) then {
		_logic setVehicleVarName _varName;
		_logic call BIS_fnc_objectVar;
		//missionNamespace setVariable [ _varName, _logic, true ];
	};

	_init = _init + getText( _cfg >> "init" );

	//FIXED: Initialise timeline animations
	if ( _type isKindOf "Timeline_F" ) then {
		_init = "this call BIS_fnc_keyframeAnimation_init;" + _init;
	};

	private _nul = _inits pushBack [ _logic, format[ "this = _this; %1", _init ] ];

};

//TODO: If we have any Timeline_F then they need initialising via BIS_fnc_keyframeAnimation_init
//( once all timeline, curves and keys and their simulated objects have been spawned )
//as they do not use the module framework to initialise( no need for BIS_fnc_initModules_disableAutoActivation )

_logic
