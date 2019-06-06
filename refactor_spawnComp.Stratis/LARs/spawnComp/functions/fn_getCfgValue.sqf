
//TODO: Make all objects get their values from this function
//If composition has already been read and saved in data array LARs_compositionData ( preInit in CfgCompositions )
//then retrieve data from array
//Else read data from cfg and also save as data array so any further composition spawns will be read from data

//Get an Objects attribute value

private[ "_value" ];
params[ "_cfg", "_type", "_default" ];

switch ( toUpper _type ) do {
	case "NUM" : {
		_value = if ( isNumber( _cfg ) ) then {
			getNumber( _cfg )
		}else{
			if !( isNil "_default" ) then {
				_default
			}else{
				0
			};
		};
	};
	case "BOOL" : {
		_value = if ( isNumber( _cfg ) ) then {
			[ false, true ] select ( getNumber( _cfg ) )
		}else{
			if !( isNil "_default" ) then {
				_default
			}else{
				true
			};
		};
	};
	case "TXT" : {
		_value = if ( isText( _cfg ) ) then {
			getText ( _cfg )
		}else{
			if !( isNil "_default" ) then {
				_default
			}else{
				""
			};
		};
	};
	case "ARRAY" : {
		_value = if ( isArray( _cfg ) ) then {
			getArray ( _cfg )
		}else{
			if !( isNil "_default" ) then {
				_default
			}else{
				[]
			};
		};
	};
};

_value
