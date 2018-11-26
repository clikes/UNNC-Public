#include "Draw.h"
#include "Texture.h"
GLUquadricObj * quad;
void InitDraw()
{
	quad = gluNewQuadric();
}

void DrawSphere(Planet* planet)
{

	gluQuadricTexture(quad, true);
	if (planet->isAsteroid) {
		glRotatef(planet->rotateAngle, planet->x, planet->y, planet->z);
		gluSphere(quad, planet->radius, planet->slide , planet->stack); //let astroind have different shape
	}
	else {
		gluSphere(quad, planet->radius, 32, 64);
	}
	
	
}

void DrawSphereLow(Planet * planet, int stack)
{
	gluQuadricTexture(quad, true);
	gluSphere(quad, planet->radius, 32, stack);
}

void DrawSkyBox(Texture *Skyboxs[], float width, float height, float length) {
	
	//the middle of skybox
	int x = width / 2;
	int y = height / 2;
	int z = length / 2;
	Skyboxs[0]->UseTexture();//top texture
	glBegin(GL_QUADS);
	glNormal3f(0.0, -1.0, 0.0);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(x,y,z);

	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(x, y, -z);

	glTexCoord2f(0.0f, 1.0f);
	glVertex3f(-x, y, -z);

	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(-x, y, z);
	glEnd();

	Skyboxs[1]->UseTexture();//botton texture
	glBegin(GL_QUADS);
	glNormal3f(0.0, 1.0, 0.0);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(x, -y, z);
	
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(x, -y, -z);
	glTexCoord2f(0.0f, 0.0f);
	
	glVertex3f(-x, -y, -z);
	
	glTexCoord2f(0.0f, 1.0f);
	glVertex3f(-x, -y, z);
	glEnd();

	Skyboxs[2]->UseTexture();//left texture
	glBegin(GL_QUADS);
	glNormal3f(1.0, 0.0, 0.0);
	
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(-x, y, z);

	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(-x, y, -z);

	
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(-x, -y, -z);
	glTexCoord2f(0.0f, 1.0f);
	
	glVertex3f(-x, -y, z);
	glEnd();

	Skyboxs[3]->UseTexture();//right texture
	glBegin(GL_QUADS);
	glNormal3f(-1.0, 0.0, 0.0);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(x, y, z);

	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(x, y, -z);

	glTexCoord2f(0.0f, 1.0f);
	glVertex3f(x, -y, -z);

	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(x, -y, z);
	glEnd();

	Skyboxs[4]->UseTexture();//front texture
	glBegin(GL_QUADS);
	glNormal3f(0.0, 0.0, -1.0);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(x, y, -z);

	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(-x, y, -z);

	glTexCoord2f(0.0f, 1.0f);
	glVertex3f(-x, -y, -z);
	glTexCoord2f(1.0f, 1.0f);
	
	glVertex3f(x, -y, -z);
	glEnd();

	Skyboxs[5]->UseTexture();//back texture
	glBegin(GL_QUADS);
	glNormal3f(0.0, 0.0, 1.0);
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(x, y, z);
	glTexCoord2f(1.0f, 0.0f);
	
	glVertex3f(-x, y, z);
	glTexCoord2f(1.0f, 1.0f);
	
	glVertex3f(-x, -y, z);
	glTexCoord2f(0.0f, 1.0f);
	
	glVertex3f(x, -y, z);
	glEnd();

}

void DrawCircle(float radius, int pointCount)
{
	glBegin(GL_POLYGON);
	for (int i = 0; i < pointCount; i++)
	{
		glTexCoord2f(0.5f *cos(2 * PI / pointCount * i) + 0.5f, 0.5f *sin(2 * PI / pointCount * i) + 0.5f);
		glVertex3f(radius*cos(2 * PI / pointCount * i), 0, radius*sin(2 * PI / pointCount * i));
	}
	glEnd();
}
