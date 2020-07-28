
//Based off of: https://en.wikipedia.org/wiki/Rotation_matrix#In_three_dimensions
//Compositions angles are stored as Radians so need converting to degrees

TAG_fnc_rotate = {

	//[ arrow, [ 45, 0, 0 ], [ vectorDirVisual arrow, vectorUpVisual arrow ] ]
	if !( _this select[ 0, 2 ] params[
		[ "_object", objNull, [ objNull ] ],
		[ "_rotation", [ 0, 0, 0 ], [ [] ], [ 3 ] ]
	] ) exitWith {
		"Error in arguments" call BIS_fnc_error;
	};

	_this select[ 2, 2 ] params[
		[ "_relativeRotation", false, [ true ] ],	//ABSOLUTE( false ) , RELATIVE( true )
		[ "_isDegrees", false, [ true ] ]			//True degrees, False radians
	];

	if !( _isDegrees ) then {
		{
			_rotation set[ _forEachIndex, deg _x ];
		}forEach _rotation;
	};
	_rotation params[ "_rotX", "_rotY", "_rotZ" ];

	if ( _relativeRotation ) then {
		[ vectorDirVisual _object, vectorUpVisual _object ]
	}else{
		//ABSOLUTE, World dir and up
		[ [ 0, 1, 0 ], [ 0, 0, 1 ] ]
	} params[ "_dir", "_up" ];


	_Rmatrix =
			//Rotation matrix for Z
			[ [ cos _rotZ, -sin _rotZ, 0 ],	[ sin _rotZ, cos _rotZ, 0 ],	[ 0, 0, 1 ] ]
		matrixMultiply
			//Rotation matrix for Y
			[ [ cos _rotY, 0, sin _rotY ],	[ 0, 1, 0 ],					[ -sin _rotY, 0, cos _rotY ] ]
		matrixMultiply
			//Rotation matrix for X
			[ [ 1, 0, 0 ],     				[ 0, cos _rotX, -sin _rotx ],	[ 0, sin _rotX, cos _rotX ] ];

	_object setVectorDirAndUp [
		( [ _dir ] matrixMultiply _Rmatrix ) select 0,
		( [ _up ] matrixMultiply _Rmatrix ) select 0
	];

};