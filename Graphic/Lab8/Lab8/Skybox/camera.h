
#include <windows.h>
#include <strstream>
#include <math.h>
#include <gl/glut.h>

class Point3 { 
public:
	float x, y, z;
	void set(float dx, float dy, float dz) { x = dx; y = dy; z = dz; }
	void set(Point3& p) { x = p.x; y = p.y; z = p.z; }
	Point3(float xx, float yy, float zz) { x = xx; y = yy; z = zz; }
	Point3() { x = y = z = 0; }
};
class Vector3 {
public:
	float x, y, z;
	void set(float dx, float dy, float dz) { x = dx; y = dy; z = dz; }
	void set(Vector3& v) { x = v.x; y = v.y; z = v.z; }
	void flip() { x = -x; y = -y; z = -z; } 
	void setDiff(Point3& a, Point3& b)
	{
		x = a.x - b.x; y = a.y - b.y; z = a.z - b.z;
	}
	void normalize();
	Vector3(float xx, float yy, float zz) { x = xx; y = yy; z = zz; } 
	Vector3(Vector3& v) { x = v.x; y = v.y; z = v.z; }
	Vector3() { x = y = z = 0.0; }
	Vector3 cross(Vector3 b);
	float dot(Vector3 b);
};
class Camera {
public:
	Point3 eye;
	Vector3 u, v, n;
	float aspect, nearDist, farDist, viewAngle;
	void setModelViewMatrix();
	Camera(void); 

	void roll(float angle);
	void pitch(float angle);
	void yaw(float angle);
	void slide(double du, double dv, double dn);

	void set(Point3 Eye, Point3 look, Vector3 up); 
	void set(float eyeX, float eyeY, float eyeZ, float lookX, float lookY, float lookZ, float upX, float upY, float upZ); 

	void setShape(float viewAngle, float aspect, float Near, float Far); 
	void setAspect(float asp);
	void getShape(float& viewAngle, float& aspect, float& Near, float& Far); 
	void rotAxes(Vector3& a, Vector3& b, float angle);
	void setDefaultCamera();
};


typedef struct tVector3			// expanded 3D vector struct
{
	tVector3() {}	// constructor
	tVector3(float new_x, float new_y, float new_z) // initialize constructor	 
	{
		x = new_x; y = new_y; z = new_z;
	}
	// overload + operator so that we easier can add vectors
	tVector3 operator+(tVector3 vVector) { return tVector3(vVector.x + x, vVector.y + y, vVector.z + z); }
	// overload - operator that we easier can subtract vectors
	tVector3 operator-(tVector3 vVector) { return tVector3(x - vVector.x, y - vVector.y, z - vVector.z); }
	// overload * operator that we easier can multiply by scalars
	tVector3 operator*(float number) { return tVector3(x*number, y*number, z*number); }
	// overload / operator that we easier can divide by a scalar
	tVector3 operator/(float number) { return tVector3(x / number, y / number, z / number); }

	float x, y, z;						// 3D vector coordinates
}tVector3;

class CCamera
{
public:

	tVector3 mPos;
	tVector3 mView;
	tVector3 mUp;
	int mWindowWidth;
	int mWindowHeight;

	void Mouse_Move();
	void Rotate_View(float x, float y, float z);
	void Move_Camera(float cameraspeed);
	void Position_Camera(float pos_x, float pos_y, float pos_z,
		float view_x, float view_y, float view_z,
		float up_x, float up_y, float up_z);
};