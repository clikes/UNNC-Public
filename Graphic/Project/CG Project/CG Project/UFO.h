#pragma once
#include "baseheader.h"
#include "math.h"
class UFO
{
public:
	vec3 pos;
	vec3 toward;
	vec3 rotateTo;
	float rotateAngle;
	float speed;
	int changeTowardTime;
	bool alive; 
	UFO();
	void move();
	~UFO();
};

