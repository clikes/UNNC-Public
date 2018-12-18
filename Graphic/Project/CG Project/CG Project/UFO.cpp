#include "UFO.h"



UFO::UFO()
{
	pos = randvec(1500);
	toward = Normalize(randvec(10000));
	speed = (rand() % 500)/10;
	changeTowardTime = rand() % 20000;
	alive = true;
	rotateTo = randvec(2);
	rotateAngle = rand() % 360;

}



void UFO::move()
{
	changeTowardTime -= FRAME_TIME;

	if (!alive)
	{
		pos = randvec(1500);
		alive = true;
	}

	if (changeTowardTime <= 0)
	{
		changeTowardTime = rand() % 10000;
		toward = Normalize(randvec(20000));
	}

	pos += toward * speed * DELTA_TIME;

	if (pos.x > SOLAR_SYSTEM_RANGE || pos.y > SOLAR_SYSTEM_RANGE || pos.z > SOLAR_SYSTEM_RANGE)
	{
		alive = false;
	}
}


UFO::~UFO()
{
}
