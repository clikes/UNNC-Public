#pragma once
#define GLUT_DISABLE_ATEXIT_HACK  
#include <gl/glut.h>
#include <glm/vec2.hpp>
#include <math.h>

#define PI 3.1415926536f
#define deg2rad PI/180
using namespace glm;
inline float Length(vec2 vec) {
	float x = vec.x;
	float y = vec.y;
	return sqrt(x*x + y * y);
}
inline vec2 Normalize(vec2 vec) {
	float x = vec.x;
	float y = vec.y;
	float length = Length(vec);
	return vec2(x / length, y / length);
}
inline float Distance(vec2 v1, vec2 v2) {
	float result = sqrtf(pow((v1.x - v2.x), 2) + pow((v1.y - v2.y), 2));

	return result;
}
