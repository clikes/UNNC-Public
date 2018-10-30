#include "Tree.h"

string sequence = "ff-[-& f + ff + < +f] + [+>f--f&-f]";
float angle = 22.5f;

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
		glScalef(0.9f, 0.9f, 0.9f);
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
		case '[': // save
			glPushMatrix();
			break;
		case ']': //restore
			glPopMatrix();
			break;
		}
	}

}

void Tree::branch()
{
	glPushAttrib(GL_ALL_ATTRIB_BITS);
	glColor3f(0.58f, 0.27f, 0.21f);
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
	glPopAttrib();
}

void Tree::getSequence()
{
	int gen = 0, j = 0;
	string next;
	bool changed;
	sequence = init;
	char curr;
	while(gen<iter){
		next = "";
		for (unsigned int i = 0; i < sequence.size(); i++) {
			curr = sequence[i];
			changed = false;
			j = 0;
			for (vector<char>::iterator it = flags.begin(); it != flags.end(); ++it, j++) {
				if (curr == *it) {
					next += change[j];
					changed = true;
					break;
				}
			}
			if (!changed)
				next += curr;
		}
		sequence = next;
		gen++;
	}
}

void Tree::addReplaceString(char flag, string str)
{
	flags.push_back(flag);
	change.push_back(str);
	getSequence();
}

void Tree::setReplaceString(char flag, string str)
{
	flags.erase(flags.begin(), flags.end());
	change.erase(change.begin(), change.end());
	flags.push_back(flag);
	change.push_back(str);
	getSequence();
}

void Tree::setNumIter(unsigned int num)
{
	iter = num;
}

void Tree::setInitString(string str)
{
	init = str;
}