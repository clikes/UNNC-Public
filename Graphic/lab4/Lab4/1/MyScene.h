#ifndef __MyScene__
#define __MyScene__

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>

#endif

#define _USE_MATH_DEFINES
#include <cmath>
#include <map>

#include "Tree.h"
#include "Horse.h"

int width, height;
int prevTime;

map<string, DisplayableObject*> objects;

void setup();
void draw();
void reshape(int _width, int _height);

int  main(int argc, char **argv);
float runtime();

float camrad, camangle = 0.f;
float eye[3];
float cen[3];

void positionCamera();
void cameraRadius();

void checkGLError();
void destroyObjects();
#endif /* MyScene_hpp */
