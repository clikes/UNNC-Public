#include "Horse.h"


Horse::Horse():
animationTime(6.0f), nangle(45.f), hangle(-90.f)
{
}

void Horse::update(float dT)
{
	aT = fmod(aT + dT, animationTime);

	float aS = 14.f*aT / animationTime;
	if (aS<1.f || aS>13.f)
	{
		nangle = -45.f;
		hangle = -90.f;
	}

	else if (aS<2.f || aS>12.f)
	{
		nangle = -67.5f;
		hangle = -67.5f;
	}

	else if (aS<3.f || aS>11.f)
	{
		nangle = -90.f;
		hangle = -45.f;
	}

	else if (aS<4.f || aS>10.f)
	{
		nangle = -112.5f;
		hangle = -60.f;
	}

	else if (aS<5.f || aS>9.f)
	{
		nangle = -135.f;
		hangle = -60.f;
	}

	else if (aS<6.f || aT>8.f)
	{
		nangle = -135.f;
		hangle = -50.f;
	}

	else
	{
		nangle = -135.f;
		hangle = -45.f;
	}


}

void Horse::display()
{
	glPushMatrix();
	glPushAttrib(GL_ALL_ATTRIB_BITS);
	glColor3f(0.5, 0.5f, 0.5f);

	glTranslatef(pos[0], pos[1], pos[2]);
	glScalef(scale[0], scale[1], scale[2]);
	glRotatef(rotation[1], 0.f, 1.f, 0.f);
	glRotatef(rotation[2], 0.f, 0.f, 1.f);
	glRotatef(rotation[0], 1.f, 0.f, 0.f);

	drawHorse();
	glPopAttrib();
	glPopMatrix();
}

void Horse::drawHorse()
{
	glTranslatef(0.f, 2.f, 0.f);
	glPushMatrix();
		box(4.f, 1.f, 1.f);
		glPushMatrix();
			glTranslatef(1.75f, 0.f, 0.5f);
			drawLeg();
		glPopMatrix();
		glPushMatrix();
			glTranslatef(1.75f, 0.f, -0.5f);
			drawLeg();
		glPopMatrix();
		glPushMatrix();
			glTranslatef(-1.75f, 0.f, 0.5f);
			drawLeg();
		glPopMatrix();
		glPushMatrix();
			glTranslatef(-1.75f, 0.f, -0.5f);
			drawLeg();
		glPopMatrix();
		glPushMatrix();
			glTranslatef(1.75f, 0.f, 0.0f);
			glRotatef(nangle, 0.f, 0.f, 1.f);
			drawNeck();
			glPushMatrix();
				glRotatef(hangle, 0.f, 0.f, 1.f);
				drawHead();
			glPopMatrix();
		glPopMatrix();
	glPopMatrix();
}

void Horse::drawLeg()
{
	glTranslatef(0.f, -1.f, 0.f);
	box(0.25f, 2.f, 0.25f);
}

void Horse::drawNeck()
{
	glTranslatef(0.f, 0.75f, 0.f);
	box(0.8f, 1.5f, 0.8f);
	glTranslatef(0.f, 0.75f, 0.f);
}

void Horse::drawHead()
{
	glTranslatef(0.f, 0.4f, 0.f);
	box(0.75f, 1.5, 0.75f);
}

void Horse::box(float sx, float sy, float sz)
{
	glPushMatrix();
	glScalef(sx, sy, sz);
	glutSolidCube(1.f);
	glPopMatrix();
}

Horse::~Horse()
{
}
