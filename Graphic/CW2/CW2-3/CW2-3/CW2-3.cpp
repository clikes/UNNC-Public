// CW2-3.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "pch.h"
#include <iostream>
#include "camera.h"
#include "Ball.h"
#include "BASE.h"
#define MAX_POS 19000
#define ASTEROID_NULBER 5000
#define ANIMATE_UI_COUNT 30
#define MAX_SPEED 10
#define JUMP_SPEED 400
#define FRICTION_FORCE 0.3f

#define WIDTH 500
#define HEIGHT 500
int windowScale = 10;
float shipSpeed = 5;
float planesize = 100;
camera *cam = NULL;
float  angle = 0;
float engineForce;
void reshape(int w, int h)
{
	GLfloat aspect = (GLfloat)w / (GLfloat)h;
	GLfloat nRange = 400.0f;
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, (GLfloat)w / (GLfloat)h, 1.0, 2000);
}

void Lighting(bool b)
{
	float amb[4] = { 0, 0, 0, 1 };
	float dif[4] = { 1.0, 1.0, 1.0, 1 };
	float pos[4] = { 0,100, 100, 1 };
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

Ball ball = Ball(2, vec3(10, 0, 0), vec2(0,0));
Ball ball2 = Ball(2, vec3(0, 0, 0), vec2(0,0));
void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();  //加载单位矩阵

	//cam->update(engineForce);//move ship
	Lighting(true);
	gluLookAt(cam->pos.x, cam->pos.y, cam->pos.z, cam->lookAt.x, cam->lookAt.y, cam->lookAt.z, cam->up.x, cam->up.y, cam->up.z);
	//gluLookAt(cam->pos.x, cam->pos.y, cam->pos.z, ball.pos.x, ball.pos.y, ball.pos.z, cam->up.x, cam->up.y, cam->up.z);
	glColor3f(1, 0, 0);
	glBegin(GL_QUADS);
	glNormal3f(0, 1, 0);
	glVertex3f(planesize, 0, planesize);
	glVertex3f(-planesize, 0, planesize);
	glVertex3f(-planesize, 0, -planesize);
	glVertex3f(planesize, 0,- planesize);
	glEnd();
	float k = 0;//the slope of origin line
	vec2 vert;//the vector of the verticle line
	glPushMatrix();
	glRotatef(angle, 0, 1, 0);
	ball.update();
	glPopMatrix();
	glPushMatrix();
	ball2.update();
	glPopMatrix();
	glutSwapBuffers();
}
bool firstin = true;
int mousex, mousey;

void MouseFunc(int button, int state, int x, int y)
{

	mousex = x, mousey = y;
}

void MouseMotion(int x, int y)
{
	if (firstin)
	{
		firstin = false;
		mousex = x, mousey = y;
	}
	cam->RotateShip(mousex - x, mousey - y);
	mousex = x;
	mousey = y;
	glutPostRedisplay();
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
		cam->update(1);
		break;

	case 's'://go backward
		cam->update(-1);
		break;
	case 'a'://go left
		buffer = cam->right();
		buffer *= shipSpeed;
		if (Length(cam->pos + buffer) >= MAX_POS) return;
		cam->pos += buffer;
		cam->lookAt += buffer;
		glutPostRedisplay();
		break;
	case 'd'://go right
		buffer = cam->right();
		buffer *= shipSpeed;
		if (Length(cam->pos - buffer) >= MAX_POS) return;
		cam->pos -= buffer;
		cam->lookAt -= buffer;
		glutPostRedisplay();
		break;

	}

}

void TimeSimulate(int id) {

	angle += 1;
	display();
	glutTimerFunc(FRAME_TIME, TimeSimulate, 1);
}

int main(int argc, char* argv[])
{
	//printf("%f ", sin(90 * deg2rad));
	cam = new camera();
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(WIDTH, HEIGHT);
	//glEnable(GL_TEXTURE_2D);
	glutCreateWindow("Pentagon Snowfake");
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutKeyboardFunc(SpaceShipControl);
	glutMotionFunc(MouseMotion);
	glutMouseFunc(MouseFunc);
	//glutIdleFunc(display);
	glutTimerFunc(FRAME_TIME, TimeSimulate, 1);
	glutMainLoop();

}


// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门提示: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
