
//Based off of: https://en.wikipedia.org/wiki/Rotation_matrix#In_three_dimensions
//WORKS tested from eden rotation to test mission
//Compositions angles are stored as Radians so need converting to degrees

//[ arrow, [ 45, 0, 0 ], [ vectorDirVisual arrow, vectorUpVisual arrow ] ]
params[
	[ "_object", objNull, [ objNull ] ],
	[ "_rotation", [ 0, 0, 0 ], [ [] ], [ 3 ] ],
	[ "_currentDirAndUp", [ [ 0, 1, 0 ], [ 0, 0, 1 ] ], [ [] ], [ 2 ] ] //Default world dir and up
];
_rotation params[ "_rotX", "_rotY", "_rotZ" ];
_currentDirAndUp params[ "_objectDIR", "_objectUP" ];

//Rotation matrix for X
_Rx = [ [ 1, 0, 0 ],     				[ 0, cos _rotX, -sin _rotx ],	[ 0, sin _rotX, cos _rotX ] ];
//Rotation matrix for Y
_Ry = [ [ cos _rotY, 0, sin _rotY ],	[ 0, 1, 0 ],					[ -sin _rotY, 0, cos _rotY ] ];
//Rotation matrix for Z
_Rz = [ [ cos _rotZ, -sin _rotZ, 0 ],	[ sin _rotZ, cos _rotZ, 0 ],	[ 0, 0, 1 ] ];

//Multiply rotation matrices
_Rmatrix = _Rz matrixMultiply _Ry matrixMultiply _Rx;

//Default world DIR( Y ) or change for objects current vectorDirVisual to apply a addition in rotation
_worldDIR = _objectDIR; //[ [ 0, 1, 0 ] ];
//Vector DIR = world DIR multiplied by rotation matrix
_vectorDir = ( [ _worldDIR ] matrixMultiply _Rmatrix ) select 0;

//Default world UP( Z ) or change for objects current vectorUpVisual to apply a addition in rotation
_worldUP = _objectUP; //[ [ 0, 0, 1 ] ];
//Vector UP = world UP multiplied by rotation matrix
_vectorUp = ( [ _worldUP ] matrixMultiply _Rmatrix ) select 0;

_object setVectorDirAndUp [ _vectorDir, _vectorUp ];

//[_vectorDir, _vectorUp ]