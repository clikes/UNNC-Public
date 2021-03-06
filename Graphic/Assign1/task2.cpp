#include <stdio.h>  
#define GLUT_DISABLE_ATEXIT_HACK  
#include <gl/glut.h>  
#include <math.h>


GLfloat Xangle = 0;
GLfloat Yangle = 0;
GLfloat Zangle = 0;
GLfloat LAngle = -12;
GLfloat LForward = 0;
GLfloat ElbolAngle = 5;
GLfloat ElbolForward = 0;
GLfloat Xoffset = 0;
GLfloat Yoffset = 0;
GLfloat Zoffset = 0;

GLfloat boxmat[16];

void SetMaterialAndLight()
{
   GLfloat mat_specular[] = { 1.0, 1.0, 1.0, 1.0 };
   GLfloat mat_shininess[] = { 50.0 };

   GLfloat light_position[] = { 10.0, 10.0, 10.0, 0.0 };  //最后一个参数为0表示该光源是directional的
 //GLfloat light_position[] = { 1.0, 1.0, 1.0, 1.0 };  //最后一个参数非0表示该光源是positional的

   GLfloat light_ambient[] = { 0.1, 0.1, 0.1, 1.0 };
   GLfloat light_diffuse[] = { 1.0, 1.0, 1.0, 1.0 };
   GLfloat light_specular[] = { 1.0, 1.0, 1.0, 1.0 };

   glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
   glMaterialfv(GL_FRONT, GL_SHININESS, mat_shininess);

   glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
   glLightfv(GL_LIGHT0, GL_DIFFUSE, light_diffuse);
   glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
   glLightfv(GL_LIGHT0, GL_POSITION, light_position);

   glEnable(GL_LIGHT0);       //开启GL_LIGHT0光源
   glEnable(GL_LIGHTING);     //开启光照系统
}

void SetColor(GLfloat R, GLfloat G, GLfloat B) {
	GLfloat matDiffuse[] = { R, G, B, 1.0 };
	GLfloat shine[] = { 25.0 };
	glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, matDiffuse);
	glMaterialfv(GL_FRONT, GL_SHININESS, shine);
}
void DrawAxies() {
	SetColor(1, 0, 0);
	glBegin(GL_LINES);
	glVertex3f(0, 0, 0);
	glVertex3f(10.0f, 0, 0);
	glEnd();
	SetColor(0, 1, 0);
	glBegin(GL_LINES);
	glVertex3f(0, 0, 0);
	glVertex3f(0, 10.0f, 0);
	glEnd();
	SetColor(0, 0, 1);
	glBegin(GL_LINES);
	glVertex3f(0, 0, 0);
	glVertex3f(0, 0, 10.0f);
	glEnd();
}


void DrawHead() {
	SetColor(1, 0, 0);
	glutSolidSphere(2, 16, 16);
}

void DrawShouldAndKnee() {
	SetColor(1, 0.5, 0);
	glutSolidSphere(1, 16, 16);
}

void DrawCylinder(GLfloat radius, GLfloat height) {
	glPushMatrix();
	glRotatef(90, -1, 0, 0);
	GLUquadricObj *objCylinder = gluNewQuadric();

	gluCylinder(objCylinder, radius, radius, height, 32, 5);
	glColor3f(0, 1, 0);
	glBegin(GL_POLYGON);
	int n = 100;
	for (int i = 0; i < n; i++)
	{
		glVertex2f(radius * cos(2 * 3.14 / n * i), radius * sin(2 * 3.14 / n * i));
	}
	glEnd();
	glTranslatef(0, 0, height);
	glBegin(GL_POLYGON);
	for (int i = 0; i < n; i++)
	{
		glVertex2f(radius * cos(2 * 3.14 / n * i), radius * sin(2 * 3.14 / n * i));
	}
	glEnd();
	glPopMatrix();
}
GLfloat f = 45;

void DrawArmAndLeg(GLfloat angle,GLfloat radius, GLfloat secondAngle) {
	glPushMatrix();
	glRotatef(angle, 0, 0, 1);
	DrawShouldAndKnee();
	glTranslatef(0, -4, 0);
	SetColor(1, 0, 0.5);
	DrawCylinder(radius, 2.5);
	glTranslatef(0, -1.5, 0);
	glRotatef(secondAngle, 0, 0, 1);
	DrawShouldAndKnee();
	glTranslatef(0, -4, 0);
	SetColor(1, 0, 0.5);
	DrawCylinder(radius, 2.5);
	glPopMatrix();
}

void DrawLeftArm(GLfloat angle, GLfloat radius) {
	glPushMatrix();
	glRotatef(angle, 0, 0, 1);
	glRotatef(ElbolAngle, 0, 0, 1);
	glRotatef(ElbolForward, 1, 0, 0);
	DrawShouldAndKnee();
	glTranslatef(0, -4, 0);
	SetColor(1, 0, 0.5);
	DrawCylinder(radius, 2.5);
	glTranslatef(0, -1.5, 0);
	glRotatef(LAngle, 0, 0, 1);
	glRotatef(LForward, 1, 0, 0);
	DrawShouldAndKnee();
	glTranslatef(0, -4, 0);
	SetColor(1, 0, 0.5);
	DrawCylinder(radius, 2.5);
	glPopMatrix();
}



void DrawRobot() {
	glPushMatrix();
	glTranslatef(0, 10, 0);
	DrawHead();//head
	glTranslatef(0, -10, 0);
	SetColor(0, 0, 1);
	DrawCylinder(1.2,7);//body
	glTranslatef(3, 6, 0);
	DrawLeftArm(12,0.8);//left arm
	glTranslatef(-6, 0, 0);
	DrawArmAndLeg(-12, 0.8,12);//right arm
	glTranslatef(1.5, -8, 0);
	DrawArmAndLeg(0, 1,0);//left leg
	glTranslatef(3, 0, 0);
	DrawArmAndLeg(0, 1,0);//right leg
	glPopMatrix();
}


void display(void)
{

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	//glPushMatrix();
	glTranslatef(Xoffset, Yoffset, Zoffset);
	glRotatef(Zangle, 0, 0, 1);
	glRotatef(Yangle, 0, 1, 0);
	glRotatef(Xangle, 1, 0, 0);

	DrawRobot();
	
	//glPopMatrix();
	
	
	glutSwapBuffers();
}

void processSpecialKeys(unsigned char key, int x, int y) {

	switch (key) {
		
	case 'x':
		Xangle += 45;
		printf("%f %f %f\n", Xangle, Yangle, Zangle);
		
		
		break;
	case 'y':
		Yangle += 45;
		printf("%f %f %f\n", Xangle, Yangle, Zangle);
		break;
	case 'z':
		Zangle += 45;
		printf("%f %f %f\n", Xangle, Yangle, Zangle);
		break;
	case 'a':
		if (LAngle + 5 > 168) break;
		LAngle += 5;
		break;
	case 's':
		if (LAngle - 5 < -17) break;
		LAngle -= 5;
		break;
	case 'q':
		if (ElbolAngle + 5 > 180) break;
		ElbolAngle += 5;
		break;
	case 'w':
		if (ElbolAngle - 5 < 5) break;
		ElbolAngle -= 5;
		break;
	case 'e':
		ElbolForward += 5;
		break;
	case 'r':
		ElbolForward -= 5;
		break;
	case 'd':
		LForward += 5;
		break;
	case 'f':
		LForward -= 5;
		break;
	case '2':
		Yoffset -= 5;
		break;
	case '4':
		Xoffset -= 5;
		break;
	case '6':
		Xoffset += 5;
		break;
	case '8':
		Yoffset += 5;
		break;
	case '5':
		Zoffset += 5;
		break;
	case '0':
		Zoffset -= 5;
		break;
	case ' ':
		Xangle = 0;
		Yangle = 0;
		Zangle = 0;
		LAngle = -12;
		LForward = 0;
		ElbolAngle = 5;
		ElbolForward = 0;
		Xoffset = 0;
		Yoffset = 0;
		Zoffset = 0;
		break;
	default:
		printf("%c", key);
		break;
	}


}

void reshape(int w, int h)
{
	GLfloat aspect = (GLfloat)w / (GLfloat)h;
	GLfloat nRange = 20.0f;
	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	if (w <= h)
	{
		glOrtho(-nRange, nRange, -nRange * aspect, nRange * aspect, -nRange, nRange);
	}
	else
	{
		glOrtho(-nRange, nRange, -nRange / aspect, nRange / aspect, -nRange, nRange);
	}
	
}

void init()
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_DITHER);
	glShadeModel(GL_SMOOTH);
}

int main(int argc, char* argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(500, 500);
	glutCreateWindow("Task 2");
	init();
	
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutKeyboardFunc(processSpecialKeys);
	glutIdleFunc(display);
	SetMaterialAndLight();
	glutMainLoop();
}
