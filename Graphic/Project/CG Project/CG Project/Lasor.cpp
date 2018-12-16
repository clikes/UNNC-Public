#include "Lasor.h"


//
//Lasor::Lasor()
//{
//}


Lasor::Lasor(Texture* tex, ParticleController* explode, float speed, vec3 pos, vec3 toward, vec3 right, float pitch, UFO** ufos)
{
	this->pos = pos;
	this->toward = toward;
	this->tex = tex;
	this->speed = speed;
	this->right = right;
	this->pitch = pitch;
	this->ufos = ufos;
	offset = right * 30.0f;
	aliveTime = 3000;
	this->explode = explode;
	//new ParticleController(3000, tex, vec3(0, 800, 0), vec3(0, -1, 0), 100.0f, 30.0f, 20000, 1200);
	//particle = new ParticleController(500, particletex, pos + offset + toward * 200.0f, -toward, 20, 100, 1000, 1 );
	//particle->ParticleActive(true);
}

void Lasor::update()
{
	aliveTime -= FRAME_TIME;
	tex->UseTexture();
	pos += toward * speed * DELTA_TIME;
	offset -= right * 20.0f * DELTA_TIME;


	//particle->pos = pos + offset + toward * speed;
	glPushMatrix();
	glTranslateVec((pos + offset));
	glRotatef(90 - pitch, right.x, right.y, right.z);
	
	DrawLasor();
	glPopMatrix();
	glPushMatrix();
	glTranslateVec((pos - offset));
	glRotatef(90 - pitch, right.x, right.y, right.z);
	DrawLasor();
	glPopMatrix();

	//glPushMatrix();
	//glRotatef(90 - pitch, right.x, right.y, right.z);
	//particle->update();

	//glPopMatrix();
	for (size_t i = 0; i < UFO_NUMBER; i++)
	{
		if (Distance(pos, (*ufos[i]).pos) < 50) {
			
			explode->pos.x = (*ufos[i]).pos.x;
			explode->pos.y = (*ufos[i]).pos.y;
			explode->pos.z = (*ufos[i]).pos.z;
			explode->ParticleActive(true);
			explode->ParticleActive(false);
			PlaySound(TEXT("Sounds/Explosion.wav"), NULL, SND_FILENAME | SND_ASYNC);
			(*ufos[i]).alive = false;
		}
	}
}

Lasor::~Lasor()
{
}
