#pragma once
#include "baseheader.h"

class Texture {
public:
	GLuint TexID;
	GLuint loadTexture(const char* filename, bool isblend);
	void UseTexture();
	Texture() {
		TexID = 0;
	}
	Texture(const char* filename, bool isblend) {
		TexID = loadTexture(filename, isblend);
	}
	~Texture();
};


