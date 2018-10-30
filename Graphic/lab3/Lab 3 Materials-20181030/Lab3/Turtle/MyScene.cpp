#include "MyScene.h"



void setup()
{
	int width = 600;
	int height = 400;
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE);
	glutInitWindowSize(width, height);
	glutCreateWindow("My scene");

	Tree* tree;
	tree = new Tree();
	objects["tree"] = tree;
	reshape(width, height);
}

void draw()
{

	glClearColor(1.f, 1.f, 1.f, 1.f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	glTranslatef(0.f, -4.f, -10.f);
	glColor3f(0.f, 0.f, 0.f);

	for (map <string, DisplayableObject*>::iterator itr = objects.begin(); itr != objects.end(); ++itr)
	{
		itr->second->display();
	}

	checkGLError();
	glutSwapBuffers();
}




void reshape(int _width, int _height)
{
	int width = _width;
	int height = _height;

	GLdouble aspect = static_cast<GLdouble>(width) / static_cast<GLdouble>(height);

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(45.0, aspect, 1, 150);
	glViewport(0, 0, width, height);
	glMatrixMode(GL_MODELVIEW);

}



int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	setup();
	glutDisplayFunc(draw);
	checkGLError();
	//glutReshapeFunc(reshape);
	glutMainLoop();
	return 0;
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
