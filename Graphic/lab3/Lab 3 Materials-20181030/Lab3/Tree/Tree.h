#ifndef __Tree__
#define __Tree__

#define _USE_MATH_DEFINES
#include "DisplayableObject.h"
#include <cmath>
#include <string>

using namespace std;

class Tree : public DisplayableObject

{
	public:
		Tree();
		~Tree(){};
		void display();
	private:
		void branch();
};

#endif /* Tree__ */
