#include <stdio.h>
#include <math.h>
#include <GL\GLAUX.H>
#include <GL\glut.h>
#include "Terrain.h"
#include "Skybox.h"

#pragma comment(lib,"opengl32.lib")
#pragma comment(lib,"glut32.lib")
#pragma comment(lib,"glu32.lib")
#pragma comment(lib,"glaux.lib")
#pragma comment(lib, "legacy_stdio_definitions.lib")


Terrain* terrain;	
Skybox* skybox;
Camera cam;	
CCamera objCamera;

bool keyPressed[256];	
void myKeyboard(unsigned char key, int x, int y) { keyPressed[key] = true; }
	
void myKeyboardUp(unsigned char key, int x, int y) { keyPressed[key] = false; }
					

void dispose(); 
void Display(); 
void Idle(); 
void Reshape(GLint w, GLint h); 
void fog();



void Display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);

	glPushMatrix();
	glTranslatef(cam.eye.x, cam.eye.y, cam.eye.z);
	skybox->draw();
	glPopMatrix();

	glScalef(1.0f, 0.2f, 1.0f);
	glPushMatrix();
	terrain->RenderTerrain(cam.eye.x, cam.eye.z);
	glPopMatrix();
	fog(); 
	glFlush();
	glutSwapBuffers();
}
void Idle() {
	if (keyPressed['1'])glPolygonMode(GL_FRONT, GL_LINE);
	if (keyPressed['2'])glPolygonMode(GL_FRONT, GL_FILL);
	if (keyPressed['d']) { cam.slide(0.1, 0, 0); }
	if (keyPressed['a']) { cam.slide(-0.1, 0, 0); }
	if (keyPressed['s']) { cam.slide(0, 0, 0.5); }
	if (keyPressed['w']) { cam.slide(0, 0, -0.5); }
	if (cam.eye.y<terrain->getHeight(cam.eye.x, cam.eye.z)) { cam.slide(0, 1.0, 0); }
	if (keyPressed['i']) { cam.pitch(-0.1); }
	if (keyPressed['k']) { cam.pitch(0.1); }
	if (keyPressed['q']) { cam.yaw(-0.1); }
	if (keyPressed['e']) { cam.yaw(0.1); }
	if (keyPressed['j']) { cam.roll(0.1); }
	if (keyPressed['l']) { cam.roll(-0.1); }
	else { cam.slide(0, 0, 0); }
	glutPostRedisplay();
}
void Reshape(GLint w, GLint h) {
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(40.0, static_cast<GLdouble>(w / h), 1.0, 3000.0);
}
void dispose() {
	delete terrain;
	delete skybox;
	delete &cam;
}
void fog() {
	
	glEnable(GL_FOG);
	glFogi(GL_FOG_MODE, GL_EXP2);
	GLfloat waterFogColor[4] = { 0.0,0.6,0.6,5.0 };
	GLfloat fogColor[4] = { 0.75,0.75,0.75,0.0 };
	if (cam.eye.y<(terrain->waterLevel - 75)) {
		glFogfv(GL_FOG_COLOR, waterFogColor);
		glFogf(GL_FOG_DENSITY, 0.075);
	}
	else {
		glFogfv(GL_FOG_COLOR, fogColor);
		glFogf(GL_FOG_DENSITY, 0.001);
	}
}

int main(int argc, char **argv) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB | GLUT_DEPTH | GLUT_DOUBLE);

	glutInitWindowSize(640, 480);
	glutInitWindowPosition(400, 30);
	glutCreateWindow("Skybox");

	glutReshapeFunc(Reshape);
	glutDisplayFunc(Display);
	glutIdleFunc(Idle);
	//objCamera.Mouse_Move();
	glutKeyboardFunc(myKeyboard);
	glutKeyboardUpFunc(myKeyboardUp);

	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);

	terrain = new Terrain("terrain1.raw", "snow512.bmp", 257, 257);
	skybox = new Skybox();

	cam.set(4, 4, 4, 0, 0, 0, 0, 1, 0);
	cam.setShape(60.0f, 64.0f / 48.0f, 0.5f, 1000.0f);

	cam.slide(0, 100, 0);
	cam.roll(0);
	cam.yaw(180);
	cam.pitch(45);

	atexit(dispose);
	printf("W: foward S: backwad A: left D: right\n");
	printf("JL: roll\n");
	printf("KI: pitch\n");
	printf("QE: yaw\n\n");
	printf("1,2: solid, wire rendering\n");
	glutMainLoop();
	return 0;
}