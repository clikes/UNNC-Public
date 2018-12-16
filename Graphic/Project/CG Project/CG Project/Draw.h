#pragma once
#include "baseheader.h"
#include "Planet.h"
#include "Texture.h"
#include "math.h"
#define LASOR_LONG 1000
#define LASOR_WEIGHT 3
void InitDraw();
void DrawSphere(Planet* planet);
void DrawSphereLow(Planet* planet, int stack);
void DrawSkyBox(Texture *Skyboxs[], float width, float height, float length);
void DrawCircle(float radius, int pointCount);
void DrawLasor();
void DrawUI(int width, int height);

//void DrawModel(Model* model)