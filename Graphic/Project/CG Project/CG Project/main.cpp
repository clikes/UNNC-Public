// CG Project.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//
#include "baseheader.h"
#include "Texture.h"
#include "Draw.h"
#include "Planet.h"
#include "SpaceShip.h"
#include "math.h"
#define MAX_POS 1600
#define ASTEROID_NULBER 500
GLfloat angle = 30000;//start from 30000 days to get more different from each planet
GLfloat revolutionScale = 100;//some planet's revolution speed is too slow to see the different
Planet* sun = NULL;
Planet* mercury = NULL;
Planet* venus = NULL;
Planet* earth = NULL;
Planet* mars = NULL;
Planet* jupiter = NULL;
Planet* saturn = NULL;
Planet* uranus = NULL;
Planet* neptune = NULL;
Planet* moon = NULL;
Planet* EarthAtmosphere = NULL;
Planet* asteroids[ASTEROID_NULBER];
Texture* SaturnRing = NULL;
Texture* asteroid[5];
SpaceShip *ship = NULL;
float shipSpeed = 5;
bool mouseLockFlag = false;
float mouseMoveSpeed = 2;
GLint mousex = 0, mousey = 0;
Texture *SkyBox[6];
int width = 2000;
int height = 1000;

void initAsteroids(int AsteroidCount) {
	int randomDistance;
	int randomSize;
	int randomRevolutionSpeed;
	int randomTexture;
	char* name = NULL;
	for (size_t i = 0; i < AsteroidCount; i++)
	{
		randomDistance = (rand() % 200) + 900;
		randomSize = rand() % 50;
		randomRevolutionSpeed = (rand() % 400) + 200;
		randomTexture = rand() % 5;
		asteroids[i] = new Planet(asteroid[randomTexture], 10000000.0f, randomRevolutionSpeed, 0.03f * randomSize, sun, vec3(randomDistance, 0, 0));
	}
}

void InitPlanets() {
	sun = new Planet("Textures/Sun.jpg", 24.47f, 0.0f, 150.0f, sun, vec3(0,0,0));
	mercury = new Planet("Textures/Mercury.jpg", 58.646f, 88.0f, 3.83f, sun, vec3(300.0f, 0.0f, 0.0f));
	venus = new Planet("Textures/Venus.jpg", 243.0f, 224.7f, 9.5f, sun, vec3(400, 0, 0));
	earth = new Planet("Textures/Earth.jpg",1.0f, 365.0f, 10.0f, sun, vec3(500, 0, 0));
	mars = new Planet("Textures/Mars.jpg", 1.0f, 686.980f, 5.32f, sun, vec3(600, 0, 0));//<500ly
	jupiter = new Planet("Textures/Jupiter.jpg",0.3f, 4328.0f, 54.7f, sun, vec3(800, 0, 0));
	saturn = new Planet("Textures/Saturn.jpg", 0.6f, 10832.0f, 46.4f, sun, vec3(1200, 0, 0));
	uranus = new Planet("Textures/Uranus.jpg", 0.7f, 30778.0f, 3.98f, sun, vec3(1300, 0, 0));
	neptune = new Planet("Textures/Neptune.jpg", 0.66f, 60327.624f, 3.87f, sun, vec3(1400, 0, 0));
	moon = new Planet("Textures/Moon.jpg", 27.32f, 27.32f, 2.0f, earth, vec3(earth->radius + earth->pos.x + 20, 0, 0));
	EarthAtmosphere = new Planet("Textures/Earth_Atmophere.jpg", 1000000000.0f, 365.0f, earth->radius*1.2, sun,earth->pos);
	//asteroids = new Planet(NULL, 1000000000.0f, 365.0f,1.0f, sun, vec3(800, 0, 0));
	SaturnRing = new Texture("Textures/SaturnRing.jpg", true);
	asteroid[0] = new Texture("Textures/asteroid1.jpg", true);
	asteroid[1] = new Texture("Textures/asteroid2.jpg", true);
	asteroid[2] = new Texture("Textures/asteroid3.jpg", true);
	asteroid[3] = new Texture("Textures/asteroid4.jpg", true);
	asteroid[4] = new Texture("Textures/asteroid5.jpg", true);
	initAsteroids(ASTEROID_NULBER);
}

//light in scene
void Lighting(bool b)
{
	float amb[4] = {0, 0, 0, 1 };
	float dif[4] = { 1.0, 1.0, 1.0, 1 };
	float pos[4] = { 0, 0, 0, 1 };
	glLightfv(GL_LIGHT0, GL_AMBIENT, amb);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, dif);
	glLightfv(GL_LIGHT0, GL_SPECULAR, dif);
	glLightfv(GL_LIGHT0, GL_POSITION, pos);
	glColorMaterial(GL_FRONT, GL_DIFFUSE);
	
	if (b)
	{
		glEnable(GL_LIGHTING);
		glEnable(GL_LIGHT0);
	}
	else
	{
		glDisable(GL_LIGHTING);
		glDisable(GL_LIGHT0);
	}
}

//light only for the sun
void Lighting2(bool b)
{
	//float amb[4] = { 0.1, 0.1, 0.1, 1 };
	float amb[4] = { 1.0, 1.0, 1.0, 1 };
	float pos[4] = { 0, 0, 0, 1 };
	glLightfv(GL_LIGHT1, GL_AMBIENT, amb);
	glLightfv(GL_LIGHT1, GL_POSITION, pos);
	glColorMaterial(GL_FRONT, GL_DIFFUSE);

	if (b)
	{
		glEnable(GL_LIGHT1);
	}
	else
	{
		glDisable(GL_LIGHT1);
	}
}

void SetMarital(GLfloat value) {
	GLfloat matDiffuse[] = { value, value, value, 1.0 };
	GLfloat matEmission[] = { 1, 1, 1, 1.0 };
	GLfloat shine[] = { 100.0 };
	glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, matDiffuse);
	glGetMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, matEmission);
	glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, shine);
}

void initSkybox() {
	SkyBox[0] = new Texture("Textures/PurpleNebula2048_top.tif", false);
	SkyBox[1] = new Texture("Textures/PurpleNebula2048_bottom.tif", false);
	SkyBox[2] = new Texture("Textures/PurpleNebula2048_left.tif", false);
	SkyBox[3] = new Texture("Textures/PurpleNebula2048_right.tif", false);
	SkyBox[4] = new Texture("Textures/PurpleNebula2048_front.tif", false);
	SkyBox[5] = new Texture("Textures/PurpleNebula2048_back.tif", false);
}

void TranslatePlanet(Planet* planet) {
	glTranslatef(planet->pos.x, planet->pos.y, planet->pos.z);
}

void TranslateByFatherPlanet(Planet* planet) {
	glTranslatef(planet->pos.x - planet->father->pos.x, planet->pos.y - planet->father->pos.y, planet->pos.z - planet->father->pos.z);
}

void DrawPlanet(Planet* planet) {
	glPushMatrix();
	if (planet->father != NULL) {
		if (planet->father->father != NULL) {
			glRotatef(angle *(revolutionScale / planet->father->revolutionSpeed), 0, 1, 0);
		}
		TranslatePlanet(planet->father);
		glRotatef(angle*(revolutionScale / planet->revolutionSpeed ), 0, 1, 0);
		TranslateByFatherPlanet(planet);
	}
	
	glRotatef(angle *(1 / planet->rotationSpeed), 0, 1, 0);
	glRotatef(90, 1, 0, 0); //because of the texture every planet should rotate 90 degree
	planet->tex->UseTexture();
	DrawSphere(planet);
	glPopMatrix();
}



void DrawSaturnRing() {
	glPushMatrix();
	glRotatef(angle *(revolutionScale / saturn->revolutionSpeed), 0, 1, 0);
	TranslatePlanet(saturn);
	glRotatef(30, 0, 0, 1);
	glRotatef(30, 0, 1, 0);
	SaturnRing->UseTexture();
	DrawCircle(saturn->radius *2, 100);
	glPopMatrix();
}

void DrawSolarSystem() {
	//Sun should have light independently cause it have light it self.
#pragma region Sun
	SetMarital(1.0f);
	Lighting2(true);
	DrawPlanet(sun);
	Lighting2(false);
	SetMarital(0.5f);
#pragma endregion
	DrawPlanet(mercury);
	DrawPlanet(venus);
	DrawPlanet(earth);
	DrawPlanet(mars);
	DrawPlanet(jupiter);
	DrawPlanet(saturn);
	DrawPlanet(uranus);
	DrawPlanet(neptune);
	DrawPlanet(moon);
	DrawSaturnRing();
	//glDisable(GL_TEXTURE_2D);
	for (size_t i = 0; i < ASTEROID_NULBER; i++)
	{
		DrawPlanet(asteroids[i]);
	}
	//glEnable(GL_TEXTURE_2D);
#pragma region Create earthAtmosphere
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glColor4f(1, 1, 1, 0.5);
	DrawPlanet(EarthAtmosphere);
	glDisable(GL_BLEND);
#pragma endregion

}
void display()
{

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	//glLoadIdentity();

	//glRotatef(f += 1, 1, 1, 0);
	//sun = new Planet("Textures/Mercury.jpg", 2.0f, 2.0f, 40.0f, sun, new Vector3(1.1, 1.2, 1.2));
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();  //加载单位矩阵
	gluLookAt(ship->pos.x, ship->pos.y, ship->pos.z, ship->lookAt.x, ship->lookAt.y, ship->lookAt.z, ship->up.x, ship->up.y, ship->up.z);
	
	Lighting(true);
	
	DrawSolarSystem();
	Lighting(false);
	//glDisable(GL_LIGHTING);
	//glDisable(GL_LIGHT0);
	DrawSkyBox(SkyBox, 4000.0f, 4000.0f, 4000.0f);
	//GLfloat radius = 10.0f;
	//gluLookAt()
	glutSwapBuffers();
}

void SpaceShipControl(unsigned char key, int x, int y)
{
	vec3 buffer;
	switch (key)
	{
	case 27:		//ESC
		exit(0);	//quit game
		break;
	case 'w'://go forward
		buffer = ship->forward();
		buffer *= shipSpeed;
		if (Length(ship->pos + buffer) >= MAX_POS) return;
		ship->pos += buffer ;
		ship->lookAt += buffer;
		glutPostRedisplay();
		break;
	case 's'://go backward
		buffer = ship->forward();
		buffer *= shipSpeed;
		if (Length(ship->pos - buffer) >= MAX_POS) return;
		ship->pos -= buffer;
		ship->lookAt -= buffer;
		glutPostRedisplay();
		break;
	case 'a'://go left
		buffer = ship->right();
		buffer *= shipSpeed;
		if (Length(ship->pos + buffer) >= MAX_POS) return;
		ship->pos += buffer;
		ship->lookAt += buffer;
		glutPostRedisplay();
		break;
	case 'd'://go right
		buffer = ship->right();
		buffer *= shipSpeed;
		if (Length(ship->pos - buffer) >= MAX_POS) return;
		ship->pos -= buffer;
		ship->lookAt -= buffer;
		glutPostRedisplay();
		break;
	case 'm'://unlock or lock mouse move
		//mouseLockFlag != mouseLockFlag;
		break;
	}

}
/// CALLBACK func for mouse kicks
void MouseFunc(int button, int state, int x, int y)
{
	if (state == GLUT_DOWN)
	{
		if (button == GLUT_LEFT_BUTTON) mouseLockFlag = false;
	}
	else
	{
		if (button == GLUT_LEFT_BUTTON) mouseLockFlag = true;
	}
	mousex = x, mousey = y;
}
/// CALLBACK func for mouse motions
void MouseMotion(int x, int y)
{
	if (mouseLockFlag) return;
	/*float deltax = sin((mousex - x) * mouseMoveSpeed * deg2rad);
	float deltaz = Length(ship->lookAt - ship->pos) - Length(ship->lookAt - ship->pos) * cos((mousex - x) * mouseMoveSpeed * deg2rad);
	ship->lookAt.x -= deltax;
	ship->lookAt.z -= deltaz;
	printf(" %d %f \n", mousex - x, deltaz);
	printf("%f,%f,%f\n", ship->lookAt.x, ship->lookAt.y, ship->lookAt.z);*/
	ship->RotateShip(mousex - x, mousey - y);
	mousex = x, mousey = y;
	glutPostRedisplay();
}

void TimeSimulate(int id) {
	angle += 1;
	display();
	glutTimerFunc(33, TimeSimulate, 1);
}

void reshape(int w, int h)
{
	GLfloat aspect = (GLfloat)w / (GLfloat)h;
	GLfloat nRange = 400.0f;
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, (GLfloat)w / (GLfloat)h, 1.0, 5000.0);
	/*if (w <= h)
	{
		glOrtho(-nRange, nRange, -nRange * aspect, nRange * aspect, -nRange, nRange);
	}
	else
	{
		glOrtho(-nRange, nRange, -nRange / aspect, nRange / aspect, -nRange, nRange);
	}*/
	//glMatrixMode(GL_MODELVIEW);
	//glLoadIdentity();  //加载单位矩阵

	//gluLookAt(0.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0);

}

void init()
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_TEXTURE_2D);
	glEnable(GL_DITHER);
	glShadeModel(GL_SMOOTH);
	glEnable(GL_COLOR_MATERIAL);
	ship = new SpaceShip();
}

int main(int argc, char* argv[])
{
	//readImg();
	//Vector3 rest = Vector3(2.0f,0,0);
	//printf("%f", rest.length2());
	//printf("cos90:%f", cosf(3.1415926));
	SpaceShip* test = new SpaceShip();
	printf("%f,%f,%f", test->forward().x , test->forward().y, test->forward().z);
	glutInit(&argc, argv);
	DrawInit();
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(width,height);
	glutCreateWindow("Solar System");
	init();
	InitPlanets();
	initSkybox();
	GLint max;
	glGetIntegerv(GL_MAX_TEXTURE_SIZE, &max);
	printf("%d", max);
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutTimerFunc(33, TimeSimulate, 1);
	glutKeyboardFunc(SpaceShipControl);
	glutMouseFunc(MouseFunc);
	glutIdleFunc(display);
	glutMotionFunc(MouseMotion);
	//SetMaterialAndLight();

	glutMainLoop();
}