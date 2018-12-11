#include <gl/glut.h>

//for mac user
//#include "GL/glut.h"

void myDisplay()

{

	glClear(GL_COLOR_BUFFER_BIT);
	//glEnable(GL_DEPTH_TEST);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


	glColor4f(1, 0, 0, 0.5);
	glutSolidSphere(0.2, 20, 16);

	glScalef(0.2, 0.2, 0.2);
	//glColor4f(0, 1, 0, 0.6);
	glBegin(GL_POLYGON); //前表面  
	glNormal3d(0.0f, 0.0f, 1.0f);
	glColor4f(1.0f, 0.0f, 0.0f,0.6); // red
	glVertex3f(1.0f, -1.0f, 1.0f);
	glColor4f(0.0f, 1.0f, 0.0f, 0.6); // green    
	glVertex3f(1.0f, 1.0f, 1.0f);
	glColor4f(0.0f, 0.0f, 1.0f, 0.6); // blue  
	glVertex3f(-1.0f, 1.0f, 1.0f);
	glColor4f(1.0f, 0.0f, 1.0f,0.6);
	glVertex3f(-1.0f, -1.0f, 1.0f);      // purple 
	glEnd();

	glBegin(GL_POLYGON); //后表面  
		// White – BACK
	glNormal3d(0.0f, 0.0f, -1.0f);
	glColor4f(1.0f, 1.0f, 1.0f,0.6);
	glVertex3f(1.0f, -1.0f, -1.0f);
	glVertex3f(1.0f, 1.0f, -1.0f);
	glVertex3f(-1.0f, 1.0f, -1.0f);
	glVertex3f(-1.0f, -1.0f, -1.0f);
	glEnd();

	glBegin(GL_POLYGON); //上表面  
		// Blue – TOP
	glNormal3d(0.0f, 1.0f, 0.0f);
	glColor4f(0.0f, 0.0f, 1.0f,0.6);
	glVertex3f(1.0f, 1.0f, 1.0f);
	glVertex3f(1.0f, 1.0f, -1.0f);
	glVertex3f(-1.0f, 1.0f, -1.0f);
	glVertex3f(-1.0f, 1.0f, 1.0f);
	glEnd();

	glBegin(GL_POLYGON); //下表面  
		// Red – BOTTOM
	glNormal3d(0.0f, -1.0f, 0.0f);
	glColor4f(1.0f, 0.0f, 0.0f,0.6);
	glVertex3f(-1.0f, -1.0f, 1.0f);
	glVertex3f(-1.0f, -1.0f, -1.0f);
	glVertex3f(1.0f, -1.0f, -1.0f);
	glVertex3f(1.0f, -1.0f, 1.0f);
	glEnd();

	glBegin(GL_POLYGON); //左表面  
		// Green – LEFT
	glNormal3d(-1.0f, 0.0f, 0.0f);
	glColor4f(0.0f, 1.0f, 0.0f,0.6);
	glVertex3f(-1.0f, -1.0f, 1.0f);
	glVertex3f(-1.0f, 1.0f, 1.0f);
	glVertex3f(-1.0f, 1.0f, -1.0f);
	glVertex3f(-1.0f, -1.0f, -1.0f);
	glEnd();

	glBegin(GL_POLYGON); //右表面  
		// Purple – RIGH
	glNormal3d(1.0f, 0.0f, 0.0f);
	glColor4f(1.0f, 0.0f, 1.0f,0.6);
	glVertex3f(1.0f, -1.0f, -1.0f);
	glVertex3f(1.0f, 1.0f, -1.0f);
	glVertex3f(1.0f, 1.0f, 1.0f);
	glVertex3f(1.0f, -1.0f, 1.0f);
	glEnd();




	glutSwapBuffers();

}

int main(int argc, char* argv[])

{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE);
	glutInitWindowPosition(200, 200);
	glutInitWindowSize(500, 500);
	glutCreateWindow("My Scene");
	glutDisplayFunc(&myDisplay);
	glutMainLoop();
	return 0;
}