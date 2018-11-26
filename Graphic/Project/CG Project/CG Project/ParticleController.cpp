#include "ParticleController.h"

//
//void randomPos(vec3 pos,int radius) {
//	int x = (rand() % (radius * 2)) - radius;
//	int y = (rand() % (radius * 2)) - radius;
//	int z = (rand() % (radius * 2)) - radius;
//	pos.x = x;
//	pos.y = y;
//	pos.z = z;
//	return vec3(x, y, z);
//}


ParticleController::ParticleController(size_t count, Texture* tex, vec3 pos, vec3 toward, float velocity, float scale, long fadetime, size_t radius)
{
	this->count = count;
	particles = new Particle[count];
	this->pos = pos;
	this->toward = Normalize(toward);
	this->velocity = velocity;
	this->tex = tex;
	this->radius = radius;
	this->fade = fadetime;
	this->scale = scale;
	int x, y, z;
	
	for (size_t i = 0; i < count; i++)
	{
		x = (rand() % (radius * 2)) - radius;
		y = (rand() % (radius * 2)) - radius;
		z = (rand() % (radius * 2)) - radius;

		Particle buffer;
		buffer.id = i;
		buffer.active = false;
		buffer.life = 0;
		buffer.rotate.x = rand() % 2;
		buffer.rotate.y = rand() % 2;
		buffer.rotate.z = rand() % 2;
		buffer.pos.x = x;
		buffer.pos.y = y;
		buffer.pos.z = z;
		buffer.fatherPos = pos;
		particles[i] = buffer;
	}
}

void ParticleController::respawn(Particle particle) {
	/*int x, y, z;
	x = (rand() % (radius * 2)) - radius;
	y = (rand() % (radius * 2)) - radius;
	z = (rand() % (radius * 2)) - radius;
	particle.pos.x = x;
	particle.pos.y = y;
	particle.pos.z = z;*/
	//randomPos(particle.pos);
	particle.life = fade;
}

void ParticleController::update()
{
	//if (!particles[0].active) return;
	for (size_t i = 0; i < count; i++)
	{
		particles[i].life -= FRAME_TIME;
		
		if (particles[i].life <= 0) {
			particles[i].life = fade;
			particles[i].fatherPos = pos;
		}
		else {
			DrawParticle(particles[i].id);
		}
	}
}

void ParticleController::DrawParticle(int id)
{
	Particle particle = particles[id];
	if (!particles[id].active) return;
	glPushMatrix();
	vec3 absPos = (particles[id].fatherPos + particles[id].pos) + toward * (velocity * (fade - particles[id].life) / 1000);
	//printf("%f %f %f ", absPos.x, absPos.y, absPos.z);
	glTranslatef(absPos.x, absPos.y, absPos.z);
	glRotated(45, particle.rotate.x,particle.rotate.y,particle.rotate.z);
	glScalef(scale, scale, scale);
	tex->UseTexture();
	glBegin(GL_TRIANGLES);
	glNormal3f(0.0, -1.0, 0.0);

	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(1, 1, 0);

	glTexCoord2f(0.5f, 1.0f);
	glVertex3f(0.5, 0, 0);

	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(0, 1, 0);

	glEnd();
	glPopMatrix();
}

void ParticleController::ParticleActive(bool active)
{
	for (size_t i = 0; i < count; i++)
	{
		particles[i].active = active;
		particles[i].life = rand() % fade;
		//particles[i].life = rand() % fade;
		
		//particles[i].pos = particles[i].pos + toward * (velocity * (fade - particles[i].life) / 1000);
	}
}


ParticleController::~ParticleController()
{
	//delete [] particles;
}
