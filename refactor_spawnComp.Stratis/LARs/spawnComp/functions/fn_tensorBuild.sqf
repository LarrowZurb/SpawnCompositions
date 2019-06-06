/*
 File tensor_build.sqf
 Written By: sarogahtyp
 Original: https://forums.bohemia.net/forums/topic/223640-release-object-rotation-by-rotation-tensor/
 Modified By: Larrow

 Description: builds a rotation tensor which is needed to rotate a vector in space

 Arguments:
	0 - desired rotation angle for x-axis
	1 - desired rotation angle for y-axis
	2 - desired rotation angle for z-axis

 Return value:  rotation tensor
*/

//TODO: matrix rotation
//https://en.wikipedia.org/wiki/Rotation_matrix#In_three_dimensions

params[
	[ "_rotX", 0, [ 0 ] ],
	[ "_rotY", 0, [ 0 ] ],
	[ "_rotZ", 0, [ 0 ] ]
];

_cP = cos _rotX;
_cY = cos _rotY;
_cR = cos _rotZ;
_sP = sin _rotX;
_sY = sin _rotY;
_sR = sin _rotZ;

private _rotation = [
	[ _cR * _cY, -1 * _sR * _cP + _cR *_sY * _sP, _sR * _sP + _cR * _sY * _cP ],
	[ _sR * _cY, _cR * _cP + _sR * _sY * _sP, -1 * _cR * _sP + _sR * _sY * _cP ],
	[ -1 * _sY, _cY * _sP, _cY * _cP ]
];

_rotation