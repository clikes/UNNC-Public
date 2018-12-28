#include "Ball.h"



Ball::Ball(float radius, vec3 pos, vec2 center, GLuint tex)
{
	this->radius = radius;
	this->pos = pos;
	this->velocity = vec3(0, 0, 0);
	this->center = center;
	this->tex = tex;
	bounce = sqrt(2 * G * (pos.y - radius) );//caculate the bounce force let ball can bounce back to origin y

	
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
	velocity += force * DELTA_TIME;
}

void Ball::update()
{
	addForce(vec3(0, -G, 0));
	
	if (isGround())
	{
		velocity = vec3(0, bounce, 0);
		
	}

	
	pos += velocity * DELTA_TIME;
	draw();
}



void Ball::draw() {
	//glColor3d(0, 1, 0);
	glPushMatrix();
	GLUquadricObj *quad = gluNewQuadric();
	glBindTexture(GL_TEXTURE_2D, tex);
	gluQuadricTexture(quad, true);
	
	
	glTranslatef(pos.x, pos.y, pos.z);
	gluSphere(quad, radius, 64, 64);
	glPopMatrix();
}


Ball::~Ball()
{
}
