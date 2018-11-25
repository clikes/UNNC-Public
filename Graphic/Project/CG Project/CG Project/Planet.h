#pragma once
#include <opencv2/opencv.hpp>
#include "Planet.h"
#include "baseheader.h"
#include "Texture.h"
class Planet
{
public:
	float rotationSpeed;
	float revolutionSpeed;
	float radius;
	Planet *father;
	vec3 pos;
	Texture* tex;
	Planet(const char* texture, float rs, float res, float radius, Planet* father, vec3 pos) {
		tex = new Texture(texture, true);
		rotationSpeed = rs;
		revolutionSpeed = res;
		this->radius = radius;
		this->father = father;
		this->pos = pos;
	}
	Planet(Texture* tex, float rs, float res, float radius, Planet* father, vec3 pos) {
		this->tex = tex;
		rotationSpeed = rs;
		revolutionSpeed = res;
		this->radius = radius;
		this->father = father;
		this->pos = pos;
	}

	~Planet();//before this object destroy this function would be call
};
