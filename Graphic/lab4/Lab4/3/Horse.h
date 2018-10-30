#ifndef __Horse__
#define __Horse__

#define _USE_MATH_DEFINES
#include "DisplayableObject.h"
#include "Animation.h"
#include <cmath>

class Horse:
	public DisplayableObject,
	public Animation

{
public:
	Horse();
	~Horse();
	void display();
	void update(float dT);

private:
	float animationTime;
	float nangle, hangle,aT;

	void drawHorse();
	void drawLeg();
	void drawNeck();
	void drawHead();
	void box(float sx, float sy, float sz);
};

#endif

