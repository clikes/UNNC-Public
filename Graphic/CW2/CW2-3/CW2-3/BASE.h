#pragma once
#define GLUT_DISABLE_ATEXIT_HACK  
#include <gl/glut.h>
#include <glm/vec3.hpp>
#include <glm/vec2.hpp>
#include <math.h>
#include <opencv2/opencv.hpp>
using namespace glm;
using namespace cv;
#define PI 3.1415926536f
#define deg2rad PI/180
#define G 10
#define BOUNCE 5
#define FRAME_TIME 33
#define DELTA_TIME 0.0167f