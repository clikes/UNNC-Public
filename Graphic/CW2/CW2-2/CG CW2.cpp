// CG CW2.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "pch.h"
#include <iostream>
#include "base.h"
#include "Line.h"
#define WIDTH 500
#define HEIGHT 500
int windowScale = 10;
float linelength = 4;
int level = 0;
void reshape(int w, int h)

{

	glViewport(0, 0, (GLsizei)w, (GLsizei)h);

	glMatrixMode(GL_PROJECTION);

	glLoadIdentity();

	if (w <= h)
		gluOrtho2D(-windowScale, windowScale, -windowScale, windowScale * (GLfloat)h / (GLfloat)w);

	else
		gluOrtho2D(-windowScale, windowScale*(GLfloat)w / (GLfloat)h, -windowScale, windowScale);

}

void display() {
	//glMatrixMode(GL_PROJECTION);
	//glLoadIdentity();
	//gluPerspective(100.0, (GLfloat)WIDTH / (GLfloat)HEIGHT, 0, 100);
	//gluPerspective()
	//glOrtho(0.0, WIDTH, HEIGHT, 0.0, -1.0, 10.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(0, 1, 0);
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);

	Line a = Line( vec2(-linelength/2, linelength/2 * tan(54 * deg2rad)) ,vec2(linelength/2, linelength / 2 * tan(54 * deg2rad)));
	Line b = Line( vec2(-linelength/2, linelength/2 * tan(54 * deg2rad)) ,vec2(linelength/2, linelength / 2 * tan(54 * deg2rad)));
	Line c = Line( vec2(-linelength/2, linelength/2 * tan(54 * deg2rad)) ,vec2(linelength/2, linelength / 2 * tan(54 * deg2rad)));
	Line d = Line( vec2(-linelength/2, linelength/2 * tan(54 * deg2rad)) ,vec2(linelength/2, linelength / 2 * tan(54 * deg2rad)));
	Line e = Line( vec2(-linelength/2, linelength/2 * tan(54 * deg2rad)) ,vec2(linelength/2, linelength / 2 * tan(54 * deg2rad)));
	a.sub(level);
	glPushMatrix();
	glRotatef(72,0,0,1);
	b.sub(level);
	glPopMatrix();
	glPushMatrix();
	glRotatef(72 * 2, 0, 0, 1);
	c.sub(level);
	glPopMatrix();
	glPushMatrix();
	glRotatef(72 * 3, 0, 0, 1);
	d.sub(level);
	glPopMatrix();
	glPushMatrix();
	glRotatef(72 * 4, 0, 0, 1);
	e.sub(level);
	glPopMatrix();
	glFlush();
	glutSwapBuffers();
}


void keyboardfunc(unsigned char key, int x, int y)
{

	switch (key)
	{
	case '=':
		level++;
		if (level > 10)
		{
			level = 10;
		}
		break;
	case '-':
		level--;
		if (level < 0)
		{
			level = 0;
		}
		break;
	}
	printf("%d \n", level);
	//display();
}

int main(int argc, char* argv[])
{
	//printf("%f ", sin(90 * deg2rad));
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(WIDTH, HEIGHT);
	glutCreateWindow("Pentagon Snowfake");
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutKeyboardFunc(keyboardfunc);
	glutIdleFunc(display);
	glutMainLoop();

}
