#ifndef __DisplayableObject__
#define __DisplayableObject__

#ifdef __APPLE__
#include <glut/glut.h>
#else
#include <GL/glut.h>
#endif

class DisplayableObject
{
public:
	DisplayableObject()
	{
		position(0.f, 0.f, 0.f);
		size(1.f);
		orientation(0.f, 0.f, 0.f);
	}

	~DisplayableObject(){}
	virtual void display() = 0;
	void position(float x, float y, float z)
	{
		pos[0] = x;
		pos[1] = y;
		pos[2] = z;
	}

	void size(float s) { size(s, s, s); }
	void size(float sx, float sy, float sz)
	{
		scale[0] = sx;
		scale[1] = sy;
		scale[2] = sz;
	}

	void orientation(float rx, float ry, float rz)
	{
		rotation[0] = rx;
		rotation[1] = ry;
		rotation[2] = rz;
	}

	float* size()
	{
		return scale;
	}
	float* orientation()
	{
		return rotation;
	}
	float* position()
	{
		return pos;
	}

protected:
	float pos[3];
	float scale[3];
	float rotation[3];
};

#endif /* DisplayableObject */
