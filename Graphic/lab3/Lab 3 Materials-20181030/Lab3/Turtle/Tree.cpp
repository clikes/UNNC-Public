#include "Tree.h"

string sequence = "f^<f-f^|f&f+|f-f";
float angle = 90.f;

Tree::Tree()
{}

void Tree::display()
{
	glTranslatef(pos[0], pos[1], pos[2]);
	glScalef(scale[0], scale[1], scale[2]);
	glRotatef(rotation[1], 0.f, 1.f, 0.f);
	glRotatef(rotation[2], 0.f, 0.f, 1.f);
	glRotatef(rotation[0], 1.f, 0.f, 0.f);
	char curr;

	for (unsigned int i = 0; i < sequence.size(); i++)
	{
		curr = sequence[i];
		switch (curr){
		case 'f':
			branch();
			break;
		case '+':
			glRotatef(-angle, 0.f, 0.f, 1.f);
			break;
		case '-':
			glRotatef(angle, 0.f, 0.f, 1.f);
			break;
		case '^':
			glRotatef(-angle, 1.f, 0.f, 0.f);
			break;
		case '&':
			glRotatef(angle, 1.f, 0.f, 0.f);
			break;
		case '<':
			glRotatef(-angle, 0.f, 1.f, 0.f);
			break;
		case '>':
			glRotatef(angle, 0.f, 1.f, 0.f);
		case '|':
			glRotatef(180.f, 0.f, 1.f, 0.f);
			break;

		}
	}

}

void Tree::branch()
{
	float res = 0.1f*M_PI;
	float r = 0.15f;
	float x = r, z = 0.f;
	float t = 0.f;

	do
	{
		glBegin(GL_LINE_LOOP);
		glVertex3f(x, 0.f, z);
		glVertex3f(x, 1.f, z);
		t += res;
		x = r*cos(t);
		z = r*sin(t);
		glVertex3f(x, 1.f, z);
		glVertex3f(x, 0.f, z);
		glEnd();
	} while (t <= 2 * M_PI);

	glTranslatef(0.f, 1.f, 0.f);

}