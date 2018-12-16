#include "SpaceShip.h"



SpaceShip::SpaceShip()
{
	pos = vec3(0, 0, 18000);
	lookAt = vec3(0, 0, 17999);
	up = vec3(0, 1, 0);
	pitch = 0.0f;
	yaw = 0.0f;
}

void SpaceShip::update(float force)
{
	vec3 buffer;
	buffer = forward();
	buffer *= force;
	pos += buffer;
	lookAt += buffer;
	glutPostRedisplay();
}

void SpaceShip::RotateShip(float x, float y)
{
	yaw += x;
	pitch += y;
	if (pitch > 89.0f) {
		pitch = 89.0f;
	}
	if (pitch < -89.0f) {
		pitch = -89.0f;
	}
	if (yaw < 0.0f) {
		yaw += 360.0f;
	}
	if (yaw > 360.0f) {
		yaw -= 360.0f;
	}
	vec3 forward = vec3();
	forward.x = -sin(deg2rad * yaw) * cos(deg2rad * pitch);
	forward.y = sin(deg2rad * pitch);
	forward.z = -cos(deg2rad * yaw) * cos(deg2rad * pitch);
	forward = Normalize(forward);
	lookAt = pos + forward;
}


vec3 SpaceShip::forward()
{
	return Normalize(lookAt - pos);
}

vec3 SpaceShip::right()
{
	return Normalize(Cross(up, forward()));
}



SpaceShip::~SpaceShip()
{
}
