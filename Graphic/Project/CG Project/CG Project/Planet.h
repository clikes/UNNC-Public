#pragma once
#include <opencv2/opencv.hpp>
#include "Planet.h"
#include "baseheader.h"
#include "Texture.h"
class Planet
{
public:
	bool isAsteroid;
	float rotationSpeed;
	float revolutionSpeed;
	//for Draw Asteroid
	float radius;
	int slide;
	int stack;
	int rotateAngle;
	int x, y, z;
	Planet *father;
	vec3 pos;
	Texture* tex;
	Planet(const char* texture, float rs, float res, float radius, Planet* father, vec3 pos) {
		isAsteroid = false;
		tex = new Texture(texture, true);
		rotationSpeed = rs;
		revolutionSpeed = res;
		this->radius = radius;
		this->father = father;
		this->pos = pos;
	}
	Planet(Texture* tex, float rs, float res, float radius, Planet* father, vec3 pos) {
		isAsteroid = true;
		this->tex = tex;
		rotationSpeed = rs;
		revolutionSpeed = res;
		this->radius = radius;
		this->father = father;
		this->pos = pos;
		slide = rand() % 4 + 3;
		stack = rand() % 4 + 3;
		rotateAngle = rand() % 180;
		x = rand() % 2;
		y = rand() % 2;
		z = rand() % 2;
	}

	~Planet();//before this object destroy this function would be call
};
