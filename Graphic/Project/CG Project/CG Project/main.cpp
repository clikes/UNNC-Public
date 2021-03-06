// CG Project.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//
#include "baseheader.h"
#include "Texture.h"
#include "Model.h"
#include "Draw.h"
#include "Planet.h"
#include "SpaceShip.h"
#include "math.h"
#include "ParticleController.h"
#include "UFO.h"
#include "Lasor.h"

#define MAX_POS 19000
#define ASTEROID_NULBER 5000
#define ANIMATE_UI_COUNT 30
#define MAX_SPEED 10
#define JUMP_SPEED 400
#define FRICTION_FORCE 0.3f


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
UFO* ufos[UFO_NUMBER];
vector<Lasor*> lasors;

Texture* SaturnRing = NULL;
Texture* asteroid[5];
Texture* LasorTex = NULL;
Texture* explode = NULL;
Texture* UItex = NULL;
Texture* Shieldtex1 = NULL;
Texture* Shieldtex2 = NULL;
Texture* AnimateUI[ANIMATE_UI_COUNT];
Model* ufo ;

SpaceShip *ship = NULL;
ParticleController *particles = NULL;
ParticleController *explosion = NULL;
float shipSpeed = 5;
bool mouseLockFlag = false;
float mouseMoveSpeed = 2;
GLint mousex = 0, mousey = 0;
Texture *SkyBox[6];
int width = 1920;
int height = 1080;
int animateUIindex = 0;
bool animateUIflag = true;
bool sheldActivated = false;
int frameCount = 0;
float engineForce = 0;
float turnEngine = 0;

void initAsteroids(int AsteroidCount) {
	int randomDistance;
	int randomSize;
	int randomRevolutionSpeed;
	int randomTexture;
	int randomRotationSpeed;
	int randomYoffset;
	char* name = NULL;
	for (size_t i = 0; i < AsteroidCount; i++)
	{
		randomDistance = (rand() % 200) + 900;
		randomSize = rand() % 50;
		randomRevolutionSpeed = (rand() % 400) + 200;
		randomTexture = rand() % 5;
		randomRotationSpeed = rand() % 500;
		randomYoffset = (rand() % 200) - 100;
		asteroids[i] = new Planet(asteroid[randomTexture], randomRotationSpeed *0.1f, randomRevolutionSpeed, 0.03f * randomSize, sun, vec3(randomDistance, randomYoffset, 0));
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

void initUFO() {
	ufo = new Model("Models/UFO.obj");

	for (size_t i = 0; i < UFO_NUMBER; i++)
	{
		ufos[i] = new UFO();
	}
}

void initUI() {
	UItex = new Texture("Textures/UI.png");
	//for (size_t i = 0; i < ANIMATE_UI_COUNT; i++)
	//{
	//	string filename = "Animates/Animate-" ;
	//	filename += std::to_string(i + 1);
	//	filename += ".png";
	//	printf(filename.c_str());
	//	AnimateUI[i] = new Texture(filename.c_str());

	//}
	Shieldtex1 = new Texture("Textures/blueshieldline.png");
	Shieldtex2 = new Texture("Textures/darkblueshieldline.png");
	//Shieldtex = new Texture("Textures/Shield.png");
	
}


void DrawModel(Model* model)
{
	tinyobj::attrib_t attrib = model->attrib;
	std::vector<tinyobj::shape_t> shapes = model->shapes;
	// Loop over shapes
	int conut = 0; 
	for (size_t s = 0; s < shapes.size(); s++) {
		// Loop over faces(polygon)
		size_t index_offset = 0;
		for (size_t f = 0; f < shapes[s].mesh.num_face_vertices.size(); f++) {
			int fv = shapes[s].mesh.num_face_vertices[f];

			conut++;
			glBegin(GL_TRIANGLES);
			// Loop over vertices in the face.
			for (size_t v = 0; v < fv; v++) {
				// access to vertex
				tinyobj::index_t idx = shapes[s].mesh.indices[index_offset + v];
				tinyobj::real_t vx = attrib.vertices[3 * idx.vertex_index + 0];
				tinyobj::real_t vy = attrib.vertices[3 * idx.vertex_index + 1];
				tinyobj::real_t vz = attrib.vertices[3 * idx.vertex_index + 2];
				tinyobj::real_t nx = attrib.normals[3 * idx.normal_index + 0];
				tinyobj::real_t ny = attrib.normals[3 * idx.normal_index + 1];
				tinyobj::real_t nz = attrib.normals[3 * idx.normal_index + 2];
				tinyobj::real_t tx = attrib.texcoords[2 * idx.texcoord_index + 0];
				tinyobj::real_t ty = attrib.texcoords[2 * idx.texcoord_index + 1];

				glTexCoord2f(tx, ty);
				glNormal3f(nx, ny, nz);
				glVertex3f(vx, vy, vz);
				
			}
			index_offset += fv;
			glEnd();
			shapes[s].mesh.material_ids[f];
		}
	}
	//printf("%d\n", conut);
}

void drawModelBuffer(Model* model) {


	tinyobj::attrib_t attrib = model->attrib;
	glTexCoordPointer(2, GL_FLOAT, 0, model->texcood.data());
	glNormalPointer(GL_FLOAT, 0, model->normal.data());
	glVertexPointer(3, GL_FLOAT, 0, model->vertex.data());
	glDrawArrays(GL_TRIANGLES, 0, model->vertexcount * 3);

}

void DrawUFO() {
	UFO* buffer = NULL;
	glDisable(GL_TEXTURE_2D);
	for (size_t i = 0; i < UFO_NUMBER; i++)
	{
		buffer = ufos[i];
		buffer->move();
		glPushMatrix();
		glTranslatef(buffer->pos.x, buffer->pos.y, buffer->pos.z);
		glRotatef(buffer->rotateAngle, buffer->rotateTo.x, buffer->rotateTo.y, buffer->rotateTo.z);
		drawModelBuffer(ufo);
		glPopMatrix();
	}
	glEnable(GL_TEXTURE_2D);
}

void drawShip() {
	glDisable(GL_TEXTURE_2D);
	

	glPushMatrix();
	glTranslatef(0, 0, 800);
	drawModelBuffer(ufo);
	//glPushMatrix();
	//glTranslatef(0, 2, 0);
	//Torus->Draw();
	//DrawModel(Torus);
	glPopMatrix();
	glPopMatrix();
	glEnable(GL_TEXTURE_2D);

}

void initParticleController() {
	Texture *tex = new Texture("Textures/LightRed.png");
	particles = new ParticleController(3000, tex, vec3(0,800,0), vec3(0, -1, 0), 100.0f, 30.0f, 20000, 1200);
	
	//explosion->ParticleActive(true);
}

void initLasor() {
	explode = new Texture("Textures/Explode.png");
	LasorTex = new Texture("Textures/Lasor.png");
	explosion = new ParticleController(3000, explode, vec3(0, 0, 600), 15.0f, 1.0f, 8000, 1200);
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
	if (sun == NULL)
	{
		return;
	}
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
	SetMarital(1.0f);
	Lighting2(true);
	glColor4f(1, 1, 1, 1);
	particles->update();
	Lighting2(false);
	glDisable(GL_BLEND);
#pragma endregion

}

void DrawLasors() {
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	Lighting2(true);
	explosion->update();
	vector<Lasor*>::iterator ite = lasors.begin();
	for ( ; ite != lasors.end(); ite++)
	{		
		if ((*ite)->aliveTime > 0)
		{
			(*ite)->update();
		}
		else {
			delete (*ite);
			ite = lasors.erase(ite);
		}
		if (ite == lasors.end())
		{
			break;
		}
	}
	//for (size_t i = 0; i < lasors.size(); i++)
	//{
	//	if ((*ite)->aliveTime > 0)
	//	{
	//		(*ite)->update();
	//	}
	//	else {
	//		lasors.
	//	}
	//}
	Lighting2(false);
	glDisable(GL_BLEND);


}



void DrawShield(int width, int height) {
	glBegin(GL_QUADS);

	glTexCoord2f(0.0f,cos(angle / 100));
	glVertex2d(0, 0);

	glTexCoord2f(0.0f, sin(angle/ 100));
	glVertex2d(0, height);
	glTexCoord2f(1.0f, cos(angle / 100));

	glVertex2d(width, height);

	glTexCoord2f(1.0f, sin(angle / 100));
	glVertex2d(width, 0);

	glEnd();
}

void DrawUI() {

	frameCount += 1;
	glMatrixMode(GL_PROJECTION);
	glPushMatrix();
	glLoadIdentity();
	glOrtho(0.0, width, height, 0.0, -1.0, 10.0);
	glMatrixMode(GL_MODELVIEW);
	//glPushMatrix();        ----Not sure if I need this
	glLoadIdentity();
	//glDisable(GL_CULL_FACE);

	//glClear(GL_DEPTH_BUFFER_BIT);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

	if (sheldActivated)
	{
		glPushMatrix();
		glTranslated(-(frameCount % width), 0, -5);//draw earlier should have lower z
		Shieldtex1->UseTexture();
		DrawShield(width, height);
		glPopMatrix();

		glPushMatrix();
		glTranslated(-(frameCount % width) + width, 0, -4);//use two hud for loop  
		Shieldtex1->UseTexture();
		DrawShield(width, height);
		glPopMatrix();

		glPushMatrix();
		glTranslated((frameCount % width), 0, -2);
		Shieldtex2->UseTexture();
		DrawShield(width, height);
		glPopMatrix();

		glPushMatrix();
		glTranslated((frameCount % width) - width, 0, -1);
		Shieldtex2->UseTexture();
		DrawShield(width, height);
		glPopMatrix();

	}

	glPushMatrix();
	glTranslatef(0, 0, 0); //make sure is before anyother hud
	UItex->UseTexture();
	DrawUI(width, height);//main HUD
	glPopMatrix();

	glDisable(GL_BLEND);
	// Making sure we can render 3d again
	glMatrixMode(GL_PROJECTION);
	glPopMatrix();
	glMatrixMode(GL_MODELVIEW);
}
void display()
{
	//simulate friction
	if (Distance(ship->pos, vec3(0,0,0)) < SOLAR_SYSTEM_RANGE)
	{
		if (engineForce > MAX_SPEED)
		{
			engineForce = MAX_SPEED;
		}
		if (engineForce > 1)
		{
			engineForce -= FRICTION_FORCE;
		}
		if (engineForce < -1)
		{
			engineForce += FRICTION_FORCE;
		}
	}

	
	ship->update(engineForce);//move ship

	angle += 0.5f;
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);


	//glLoadIdentity();
	int test = (int)(angle / 100) % 6;
	//glRotatef(f += 1, 1, 1, 0);
	//sun = new Planet("Textures/Mercury.jpg", 2.0f, 2.0f, 40.0f, sun, new Vector3(1.1, 1.2, 1.2));
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();  //加载单位矩阵
	gluLookAt(ship->pos.x, ship->pos.y, ship->pos.z, ship->lookAt.x, ship->lookAt.y, ship->lookAt.z, ship->up.x, ship->up.y, ship->up.z);
	DrawSkyBox(SkyBox, 40000.0f, 40000.0f, 40000.0f);
	
	
	Lighting(true);
	//drawShip();
	DrawUFO();
	DrawSolarSystem();
	Lighting(false);
	DrawLasors();
	DrawUI();
	glutSwapBuffers();
}

void SpaceShipControl(unsigned char key, int x, int y)
{

	vec3 buffer;
	switch (key)
	{
	case 27:		//ESC turn off space ship
		exit(0);
		break;
	case 'w'://go forward
		engineForce += 2;
		if (engineForce > MAX_SPEED)
		{
			engineForce = MAX_SPEED;
		}
		break;
	case 'f'://go forward
	
		if (engineForce <= MAX_SPEED)
		{
			PlaySound(TEXT("Sounds/Jump.wav"), NULL, SND_FILENAME );
			engineForce += JUMP_SPEED;
			PlaySound(TEXT("Sounds/Jumping.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}

		break;
	case 's'://go backward
		if (engineForce > MAX_SPEED)
		{
			engineForce = MAX_SPEED;
		}
		if (engineForce < -MAX_SPEED)
		{
			engineForce = -MAX_SPEED;
		}
		engineForce -= 1;
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
	case 'm':
		particles->ParticleActive(false);
		break;		
	case 'q':
		sheldActivated = !sheldActivated;
		if (!sheldActivated)
		{
			PlaySound(TEXT("Sounds/ShieldDeactived.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		else {
			PlaySound(TEXT("Sounds/Shield.wav"), NULL, SND_FILENAME | SND_ASYNC);
		}
		
		break;	
	case ' ':
		PlaySound(TEXT("Sounds/Laser.wav"), NULL, SND_FILENAME | SND_ASYNC);
		//mciSendString(TEXT("seek laser to start"), NULL, 0, NULL);
		//mciSendString(TEXT("play laser"), NULL, 0, NULL);
		
		lasors.push_back(new Lasor(explode, explosion, 1700, ship->pos, ship->forward(), ship->right(), ship->pitch, ufos));
		break;
	case 'r':
		particles->ParticleActive(true);
		break;
	}

}
// CALLBACK func for mouse clicks
void MouseFunc(int button, int state, int x, int y)
{
	if (state == GLUT_DOWN)
	{
		if (button == GLUT_LEFT_BUTTON) mouseLockFlag = false;
		PlaySound(TEXT("Sounds/Laser.wav"), NULL, SND_FILENAME | SND_ASYNC );
		//mciSendString(TEXT("seek laser to start"), NULL, 0, NULL);
		//mciSendString(TEXT("play laser"), NULL, 0, NULL);
		lasors.push_back(new Lasor(LasorTex, explosion,1700, ship->pos, ship->forward(), ship->right(), ship->pitch, ufos));
	}
	else
	{
		if (button == GLUT_LEFT_BUTTON) mouseLockFlag = true;
	}
	mousex = x, mousey = y;
}

bool firstin = true;
/// CALLBACK func for mouse motions
void MouseMotion(int x, int y)
{
	if (firstin)
	{
		firstin = false;
		mousex = x, mousey = y;
	}
	ship->RotateShip((mousex - x)/2, (mousey - y)/2);
	glutWarpPointer(width / 2, height / 2);
	mousex = width / 2, mousey = height / 2;

	glutPostRedisplay();
}

void TimeSimulate(int id) {

	//frameCount += 1;
	display();
	glutTimerFunc(FRAME_TIME, TimeSimulate, 1);
}

void reshape(int w, int h)
{
	GLfloat aspect = (GLfloat)w / (GLfloat)h;
	GLfloat nRange = 400.0f;
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, (GLfloat)w / (GLfloat)h, 1.0, 50000.0);
}

void init()
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_TEXTURE_2D);
	glEnable(GL_DITHER);
	glShadeModel(GL_SMOOTH);
	glEnable(GL_COLOR_MATERIAL);
	
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_NORMAL_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	ship = new SpaceShip();
	glutSetCursor(GLUT_CURSOR_NONE);//hide cursor
}


//int main() {
//	testOBJloader();
//	printf("pass");
//}
//
int main(int argc, char* argv[])
{


	mciSendString(TEXT("open Sounds/Laser.mp3 alias laser"), NULL, 0, NULL);
	mciSendString(TEXT("open Sounds/Jumping.wav alias jumping"), NULL, 0, NULL);

	//mciSendString(TEXT("play MySong"), NULL, 0, NULL);
	//mciSendString(TEXT("play jumping"), NULL, 0, NULL);
	//readImg();
	//Vector3 rest = Vector3(2.0f,0,0);
	//printf("%f", rest.length2());
	//printf("cos90:%f", cosf(3.1415926));
	SpaceShip* test = new SpaceShip();
	printf("%f,%f,%f", test->forward().x , test->forward().y, test->forward().z);
	glutInit(&argc, argv);

	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(width,height);
	glutCreateWindow("Solar System");
	init();
	GLenum err = glewInit();
	printf("INIT: %d", err);
	InitDraw();
	initUFO();
	InitPlanets();
	initLasor();
	initParticleController();
	initSkybox();
	initUI();
	GLint max;
	glGetIntegerv(GL_MAX_TEXTURE_SIZE, &max);
	printf("%d", max);
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutTimerFunc(FRAME_TIME, TimeSimulate, 1);
	glutKeyboardFunc(SpaceShipControl);
	glutMouseFunc(MouseFunc);
	glutIdleFunc(display);
	glutPassiveMotionFunc(MouseMotion);
	//glutMotionFunc(MouseMotion);
	
	//SetMaterialAndLight();
	
	glutMainLoop();
}
