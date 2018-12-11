#include "terrain.h"
Terrain::Terrain(pcStr heightFile, pcStr surfaceTexFile, GLuint width, GLint height) {
	_map_width = width;
	_map_height = height;

	img = NULL;
	_texId_ground = 0; _texId_water = 0;
	_height = 0;
	
	wchar_t text[50];
	mbstowcs(text, surfaceTexFile, strlen(surfaceTexFile) + 1);
	LPCWSTR LPsurfaceTexFile = text;

	img = auxDIBImageLoad(LPsurfaceTexFile);
	glGenTextures(1, &_texId_ground);
	glBindTexture(GL_TEXTURE_2D, _texId_ground);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img->sizeX, img->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, img->data);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

	const char *waterTexFile = "water.bmp";
	wchar_t text2[30];
	mbstowcs(text2, waterTexFile, strlen(waterTexFile) + 1);
	LPCWSTR LPwaterTexFile = text2;

	img = auxDIBImageLoad(LPwaterTexFile);
	glGenTextures(1, &_texId_water);
	glBindTexture(GL_TEXTURE_2D, _texId_water);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img->sizeX, img->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, img->data);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);


	_height = readRawData(heightFile, width, height);

	int i;
	for (i = 0, minHeight = 2 ^ 10; i<_map_width*height; i++) {
		if (minHeight>_height[i]) { minHeight = _height[i]; }
	}

	waterLevel = (GLfloat)minHeight + 100;

	for (int i = 0; i<_map_width*_map_height + 1; i++) _height[i] -= minHeight;

	baseTerrain = glGenLists(5);
	glNewList(baseTerrain, GL_COMPILE);
	TileTerrain(1);
	glEndList();
	glNewList(baseTerrain + 1, GL_COMPILE);
	TileTerrain(4);
	glEndList();
	glNewList(baseTerrain + 2, GL_COMPILE);
	TileTerrain(8);
	glEndList();
	glNewList(baseTerrain + 3, GL_COMPILE);
	TileTerrain(16);
	glEndList();
	glNewList(baseTerrain + 4, GL_COMPILE);
	RenderWater();
	glEndList();
}
Terrain::~Terrain() {

	if (_height != 0) { delete[] _height; }
	if (_texId_ground != 0) { glDeleteTextures(1, &_texId_ground); }
	if (_texId_water != 0) { glDeleteTextures(1, &_texId_water); }
	if (img != 0) { free(img->data); free(img); }
}

void Terrain::RenderTerrain(GLfloat x, GLfloat y) {
	int i, j;

	glPushMatrix();
	glTranslatef(getTileX(x)*(_map_width - 1), 0.0, getTileY(y)*(_map_height - 1));
	glCallList(baseTerrain);
	glPopMatrix();

	for (i = -1; i<2; i++) {
		for (j = -1; j<2; j++) {
			if (!(i == 0 && j == 0)) {
				glPushMatrix();
				glTranslatef(getTileX(x)*(_map_width - 1) + (i*(_map_width - 1)), 0.0, getTileY(y)*(_map_height - 1) + (j*(_map_height - 1)));
				glCallList(baseTerrain + 1);
				glPopMatrix();
			}
		}
	}

	for (i = -2; i<3; i++) {
		for (j = -2; j<3; j++) {
			if ((i<-1 || i>1) || (j<-1 || j>1)) {
				glPushMatrix();
				glTranslatef(getTileX(x)*(_map_width - 1) + (i*(_map_width - 1)), 0.0, getTileY(y)*(_map_height - 1) + (j*(_map_height - 1)));
				glCallList(baseTerrain + 2);
				glPopMatrix();
			}
		}
	}

	for (i = -3; i<4; i++) {
		for (j = -3; j<4; j++) {
			if ((i<-2 || i>2) || (j<-2 || j>2)) {
				glPushMatrix();
				glTranslatef(getTileX(x)*(_map_width - 1) + (i*(_map_width - 1)), 0.0, getTileY(y)*(_map_height - 1) + (j*(_map_height - 1)));
				glCallList(baseTerrain + 3);
				glPopMatrix();
			}
		}
	}

	for (i = -2; i<3; i++) {
		for (j = -2; j<3; j++) {
			glPushMatrix();
			glTranslatef(getTileX(x)*(_map_width - 1) + (i*(_map_width)-1), 0.0, getTileY(y)*(_map_height - 1) + (j*(_map_height - 1)));
			glCallList(baseTerrain + 4);
			glPopMatrix();
		}
	}
}
void Terrain::TileTerrain(GLint levelOfDetail) { 
	glEnable(GL_TEXTURE_2D); 
	glMatrixMode(GL_MODELVIEW);

	glPushMatrix();

	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
	glBindTexture(GL_TEXTURE_2D, _texId_ground); 
	float coordX = (float)1.0 / _map_width; 
	float coordZ = (float)1.0 / _map_height;
	for (int z = 0; z<_map_height; z += levelOfDetail) { 
		glBegin(GL_TRIANGLE_STRIP);
		for (int x = 0; x<_map_width; x += levelOfDetail) {
			glTexCoord2f(coordX*x, coordZ*z); 
			glVertex3f(x, _height[z*_map_height + x], z);
			glTexCoord2f(coordX*x, coordZ*(z + levelOfDetail));
			glVertex3f(x, _height[(z + levelOfDetail)*_map_height + x], z + levelOfDetail);
		}
		glEnd();
	}
	glPopMatrix();
	glDisable(GL_TEXTURE_2D);
}
void Terrain::RenderWater() {
	glEnable(GL_TEXTURE_2D);
	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	//glPushAttrib(GL_ENABLE_BIT);

	glEnable(GL_BLEND);
	glDisable(GL_CULL_FACE);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glColor4f(0.0, 0.4, 0.5, 0.7);

	glBindTexture(GL_TEXTURE_2D, _texId_water);
	glBegin(GL_QUADS);
	glTexCoord2f(0.0, 0.0);	glVertex3f(0.0, waterLevel, 0.0);
	glTexCoord2f(15.0, 0.0);	glVertex3f(0.0, waterLevel, _map_height);
	glTexCoord2f(15.0, 15.0); glVertex3f(_map_height, waterLevel, _map_height);
	glTexCoord2f(0.0, 15.0);	glVertex3f(_map_height, waterLevel, 0.0);
	glEnd();
	glEnable(GL_CULL_FACE);
	glDisable(GL_BLEND);
	//glPopAttrib();
	glDisable(GL_TEXTURE_2D);
}


Terrain::ubyte* Terrain::readRawData(pcStr filename, uint w, uint h) {
	FILE *f;
	fopen_s(&f, filename, "rb"); 
	if (!f) {
		printf("file not found : %s\n", filename);
		throw std::exception();
	}

	ubyte* raw = new ubyte[w*h];
	fread(raw, sizeof(ubyte), w*h, f);
	fclose(f);
	return raw;
}
GLfloat Terrain::getHeight(GLfloat _x, GLfloat _y) {

	int x, y;
	if (_x<0) x = _map_width + ((int)_x%_map_width);
	else x = ((int)_x % _map_width);
	if (_y<0) y = _map_height + ((int)_y % _map_height);
	else y = ((int)_y % _map_height);

	return (_height[y*_map_height + x] / 5 + 10);
}
GLint Terrain::getTileX(GLfloat x) {
	if (x>0) return ((int)x) / (int)_map_width;
	else return ((int)x) / (int)_map_width - 1;
}
GLint Terrain::getTileY(GLfloat y) {
	if (y>0) return ((int)y) / (int)_map_height;
	else return ((int)y) / (int)_map_height - 1;
}