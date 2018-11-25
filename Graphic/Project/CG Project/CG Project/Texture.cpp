#include "Texture.h"
#include "baseheader.h"



GLuint Texture::loadTexture(const char* filename, bool isblend) {


#pragma region read from file
	Mat Image = imread(filename, CV_LOAD_IMAGE_UNCHANGED);
	if (Image.empty()) {
		perror("File Reading Error");
		return -1;
	}
	int width = Image.cols;
	int height = Image.rows;
	//Point of img
	GLubyte* pixels;
	//allocate memory space
	int pixellength = width * height * 3;
	pixels = new GLubyte[pixellength];
	//copy memory
	memcpy(pixels, Image.data, pixellength * sizeof(char));
#pragma endregion

#pragma region Create new texture
	if (pixels == NULL) return -1;
	GLuint textureID = 0;
	glGenTextures(1, &textureID);

	GLint lastTextureID = 0;
	glGetIntegerv(GL_TEXTURE_BINDING_2D, &lastTextureID);
	glBindTexture(GL_TEXTURE_2D, textureID);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, 0x812F);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, 0x812F);//GL_CLAMP_TO_EDGE remove small distance in skybox
	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_BLEND_DST);//let texture can have light

	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0,
		GL_BGR_EXT, GL_UNSIGNED_BYTE, pixels);
	glBindTexture(GL_TEXTURE_2D, lastTextureID);
	free(pixels);

#pragma endregion


	return textureID;
}

void Texture::UseTexture()
{
	glBindTexture(GL_TEXTURE_2D, TexID);
}


void SetupRC()
{
	
}
Texture::~Texture()
{
}
