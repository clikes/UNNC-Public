
#ifndef __MyScene__
#define __MyScene__

#ifdef __APPLE__
#include <glut/glut.h>
#else
#include <gl/glut.h>

#endif

#define _USE_MATH_DEFINES
#include <cmath>

#include <stdio.h>
#include "Tree.h"
#include <map>

map<string, DisplayableObject*> objects;

void setup();
void draw();
void reshape(int _width, int _height);
int  main(int argc, char **argv);
void checkGLError();

#endif /* MyScene_hpp */
