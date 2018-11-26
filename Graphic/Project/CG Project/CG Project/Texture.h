#pragma once
#include "baseheader.h"

class Texture {
public:
	GLuint TexID;
	GLuint loadTexture(const char* filename, bool isblend);
	GLuint loadTextureAlpha(const char* filename);
	void UseTexture();
	Texture() {
		TexID = 0;
	}
	Texture(const char* filename, bool isblend) {
		TexID = loadTexture(filename, isblend);
	}
	Texture(const char* filename) {
		TexID = loadTextureAlpha(filename);
	}
	~Texture();
};


