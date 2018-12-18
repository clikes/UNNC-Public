#pragma once
#include "base.h"
class Line
{
public:
	vec2 x;
	vec2 y;
	void sub(int level);
	void draw();
	Line(vec2 x, vec2 y);
	~Line();
};

