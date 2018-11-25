#pragma once
#include "baseheader.h"
#ifndef Math_H
#define Math_H
inline float Length(vec3 vec) {
	float x = vec.x;
	float y = vec.y;
	float z = vec.z;
	return sqrt(x*x + y * y + z * z);
}
inline vec3 Normalize(vec3 vec) {
	float x = vec.x;
	float y = vec.y;
	float z = vec.z;
	float length = Length(vec);
	return vec3(x / length, y / length, z / length);
}

inline vec3 Cross(vec3 v1, vec3 v2) {
	float x = v1.y * v2.z - v1.z * v2.y;
	float y = v1.z * v2.x - v1.x * v2.z;
	float z = v1.x * v2.y - v1.y * v2.x;
	return vec3(x, y, z);
}
#define PI 3.14159265358979323846f
#define deg2rad (PI / 180.0f)
#endif // !1

