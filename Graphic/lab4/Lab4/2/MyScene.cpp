#include "MyScene.h"
using namespace std;

void setup()
{
	int width = 600;
	int height = 400;
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE);
	glutInitWindowSize(width, height);
	glutCreateWindow("My scene");
	
	Tree* tree = new Tree();
	tree->setReplaceString('f', "ff-[-& f + ff + < +f] + [+>f--f&-f]");
	tree->position(-width/2.f, 0.f, -width/2.f);
	tree->size(50.f);
	objects["tree"] = tree;

	Horse* horse = new Horse();
	horse->size(40.f);
	objects["horse"] = horse;

	reshape(width, height);
	prevTime = glutGet(GLUT_ELAPSED_TIME);
	cen[0] = 0.f;
	cen[1] = 0.f;
	cen[2] = 0.f;
}

void draw()
{
	glClearColor(1.f, 1.f, 1.f, 1.f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	positionCamera();

	glTranslatef(0.f, -height / 2.f, 0.f);
	glColor3f(0.f, 0.f, 0.f);

	float dT = runtime();
	Animation* ani_obj;

	for (map <string, DisplayableObject*>::iterator itr = objects.begin(); itr != objects.end(); ++itr)
	{
		ani_obj = dynamic_cast<Animation*>(itr->second);
		if (ani_obj != NULL) ani_obj->update(dT);
		itr->second->display();
	}

	checkGLError();
	glutSwapBuffers();
}

void positionCamera()
{
	cameraRadius();
	eye[0] = camrad * sin(camangle);
	eye[1] = cen[1];
	eye[2] = camrad * cos(camangle);
	gluLookAt(eye[0], eye[1], eye[2],
		cen[0], cen[1], cen[2],
		0.f, 1.f, 0.f);
}

void cameraRadius()
{
	camrad = (height / 2.f) / tan(M_PI / 8.f);

}

void reshape(int _width, int _height)
{
	width = _width;
	height = _height;
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, (GLdouble)width/(GLdouble)height, 1.0, 4000.0);
	glMatrixMode(GL_MODELVIEW);
}

void keyPressed(int keyCode, int xm, int ym)
{
	float incr = (float)M_PI / 36.f;
	if (keyCode == GLUT_KEY_LEFT)
	{
		camangle -= incr;
	}
	else if (keyCode == GLUT_KEY_RIGHT)
	{
		camangle += incr;
	}
}

void keyPressed(unsigned char key, int xm, int ym)
{
	if (key == ' ')
	{
		camangle = 0.f;
	}
}

int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	setup();
	glutDisplayFunc(draw);
	glutIdleFunc(draw);
	glutReshapeFunc(reshape);
	checkGLError();
	glutKeyboardFunc(keyPressed);
	glutSpecialFunc(keyPressed);
	glutMainLoop();
	destroyObjects();
	return 0;
}

float runtime()
{
	int currTime = glutGet(GLUT_ELAPSED_TIME);
	float dT = static_cast<float>(currTime - prevTime) / 1000.f;
	prevTime = currTime;
	return dT;

}

void destroyObjects()
{
	for (map <string, DisplayableObject*>::iterator itr = objects.begin(); itr != objects.end(); ++itr){
		delete itr->second;
	}
	objects.clear();
}

void checkGLError()
{
	int e = 0;
	GLenum error = glGetError();
	while (GL_NO_ERROR != error)
	{
		e++;
		printf("GL Error %i: %s\n", e, gluErrorString(error));
		error = glGetError();
	}

}
