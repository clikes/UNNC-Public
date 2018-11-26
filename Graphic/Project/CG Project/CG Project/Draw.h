#pragma once
#include "baseheader.h"
#include "Planet.h"
#include "math.h"
void InitDraw();
void DrawSphere(Planet* planet);
void DrawSphereLow(Planet* planet, int stack);
void DrawSkyBox(Texture *Skyboxs[], float width, float height, float length);
void DrawCircle(float radius, int pointCount);
