#pragma once
#include"BASE.h"
class Ball
{
public:
	vec3 pos;
	float radius;
	vec3 velocity;
	vec2 center;
	bool isGround();

	Ball(float radius, vec3 pos, vec2 center);
	void addForce(vec3 force);
	void update();
	void draw();
	~Ball();
};

