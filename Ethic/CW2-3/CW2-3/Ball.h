#pragma once
#include"BASE.h"
class Ball
{
public:
	vec3 pos;
	float radius;
	float bounce;
	vec3 velocity;
	vec2 center;
	bool isGround();
	GLuint tex;
	Ball(float radius, vec3 pos, vec2 center, GLuint tex);
	void addForce(vec3 force);
	void update();
	void draw();
	~Ball();
};

