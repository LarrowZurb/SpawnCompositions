/*
 File tensor_apply.sqf
 Written By: sarogahtyp
 Original: https://forums.bohemia.net/forums/topic/223640-release-object-rotation-by-rotation-tensor/
 Modified By: Larrow

 Description: rotates a vector with usage of the prior build rotation tensor

 Arguments:
	0 - vector which should be rotated
	1 - rotation tensor

 Return value:  rotated vector
*/

params[ "_v", "_r" ];

private _newVector = [ _v ] matrixMultiply _r;

_newVector