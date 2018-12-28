#include "pch.h"
#include "Line.h"


void Line::sub(int level)
{
	if (level == 0)
	{
		draw();
		return;
	}
	Line a = Line(x, (y - x) * 0.3819f + x );
	float k = 0;//the slope of origin line
	vec2 vert;//the vector of the verticle line
	if (y.y - x.y == 0)
	{
		if (x.x < y.x)
		{
			vert = vec2(0, 1);
		}
		else
		{
			vert = vec2(0, -1);
		}
		
	}
	else if (x.x - y.x == 0) {
		if (x.y > y.y)
		{
			vert = vec2(1, 0);
		}
		else {
			vert = vec2(-1, 0);
		}
	}
	else {
		k = (y.y - x.y) / (y.x - x.x);//the slope of origin line
		k = -1 / k;//calcute the slope of the line perpendicular to origin line
		vert = vec2(1, k) - vec2(0, 0);
		vert = Normalize(vert);//transfrom it to unit vector
		if (x.x < y.x && x.y < y.y)
		{
			vert *= -1.0f;
		}
		else if (x.y<y.y && x.x >y.x) {
			vert *= -1.0f;
		}
	}

	Line b = Line((y - x) * 0.3819f + x, (y - x) * (0.3819f + 0.2361f/2) + x + sin(72*deg2rad) * vert * Distance(x,y)*0.3819f );
	Line c = Line((y - x) * (0.3819f + 0.2361f / 2) + x + sin(72 * deg2rad)* vert * Distance(x, y)*0.3819f, (x - y) * 0.3819f + y);
	Line d = Line((x - y) * 0.3819f + y, y);
	a.sub(level - 1);
	b.sub(level - 1);
	c.sub(level - 1);
	d.sub(level - 1);
}

void Line::draw()
{
	glBegin(GL_LINES);
	glVertex2f(x.x, x.y);
	glVertex2f(y.x, y.y);
	glEnd();
}

Line::Line(vec2 x, vec2 y)
{
	this->x = x;
	this->y = y;
}


Line::~Line()
{
}
