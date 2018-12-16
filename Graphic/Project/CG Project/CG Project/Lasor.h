#pragma once
#include "baseheader.h"
#include "Texture.h"
#include "Draw.h"
#include "UFO.h"
#include "ParticleController.h"
#include "math.h"
class Lasor
{
public:
	float speed;
	int aliveTime;
	vec3 pos;
	vec3 toward;
	vec3 right;
	vec3 offset;
	Texture* tex;
	float pitch;
	UFO**  ufos;
	ParticleController* explode;
	Lasor(Texture* tex, ParticleController* particletex, float speed, vec3 pos, vec3 toward, vec3 right, float pitch, UFO** ufos);
	void update();

	~Lasor();
};

