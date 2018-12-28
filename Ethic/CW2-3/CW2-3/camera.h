#pragma once
#include "BASE.h"
#include "math.h"
class camera
{
public:
	vec3 pos;
	vec3 lookAt;
	//vec3 forward = Normalize(lookAt - pos);
	vec3 up;
	float pitch;
	float yaw;
public:	
	void update(float force);
	vec3 forward();
	vec3 right();
	void RotateShip(float x, float y);
	camera();
	~camera();
};

