#pragma once
#include "baseheader.h"
#include "Texture.h"
#include "math.h"
struct Particle
{
	int id;
	bool active;//active or not
	long life;//last time in millsecond 
	vec3 pos;//position relative to the controller's position
	vec3 rotate;
	vec3 fatherPos;//particle's controller's pos
};

class ParticleController
{
public:
	long fade;//duration in millsecond
	vec3 pos;//position
	vec3 toward;//particle direction
	float velocity;//velocity
	Texture* tex;
	float scale;//pic scale
	size_t radius;
	size_t count;
	Particle *particles;
public:
	ParticleController(size_t count, Texture* tex, vec3 pos, vec3 toward, float velocity, float scale, long fadetime, size_t radius);
	void respawn(Particle particle);
	void update();
	void DrawParticle(int id);
	void ParticleActive(bool active);
	~ParticleController();
};

