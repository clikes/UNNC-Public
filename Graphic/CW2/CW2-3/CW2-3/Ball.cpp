#include "Ball.h"



Ball::Ball(float radius, vec3 pos, vec2 center)
{
	this->radius = radius;
	this->pos = pos;
	this->velocity = vec3(0, 0, 0);
	this->center = center;
}

bool Ball::isGround() {
	if (pos.y <= radius)
	{
		return true;
	}
	return false;
}

void Ball::addForce(vec3 force)
{
	velocity += force;
}

void Ball::update()
{
	addForce(vec3(0, -G, 0));
	if (isGround())
	{
		addForce(vec3(0, BOUNCE, 0));
	}
	pos += velocity * DELTA_TIME;
	draw();
}



void Ball::draw() {
	glColor3d(0, 1, 0);
	GLUquadricObj *quad = gluNewQuadric();
	glPushMatrix();
	glTranslatef(pos.x, pos.y, pos.z);
	gluSphere(quad, radius, 64, 64);
	glPopMatrix();
}


Ball::~Ball()
{
}
