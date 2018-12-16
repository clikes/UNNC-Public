#pragma once
#include <stdio.h>  
#include <cstdio>
#define GLUT_DISABLE_ATEXIT_HACK  
#include <gl/glew.h>
#include <gl/glut.h>
#include <math.h>
#include <opencv2/opencv.hpp>
#include <glm/vec3.hpp> 
#include <stdlib.h>
#include <windows.h>
#include<Mmsystem.h>
#pragma comment(lib,"winmm.lib")
#define UFO_NUMBER 10
#define FRAME_TIME 66
#define DELTA_TIME 0.033f
using namespace cv;
using namespace glm;
class Vector3 : public glm::vec3
{
	public:
		using vec3::vec3;
	float length2() {
		return sqrt(x*x + y * y + z * z);
	}
	Vector3 normalize() {
		return Vector3(x / length2(), y / length2(), z / length2());
	}
};


