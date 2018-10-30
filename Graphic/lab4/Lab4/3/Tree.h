#ifndef __Tree__
#define __Tree__

#define _USE_MATH_DEFINES
#include "DisplayableObject.h"
#include <cmath>
#include <string>
#include <vector>

using namespace std;

class Tree : public DisplayableObject

{
	public:
		Tree();
		~Tree(){};
		void display();
		void getSequence();
		void addReplaceString(char flag, string str);
		void setReplaceString(char flag, string str);
		void setNumIter(unsigned int num);
		void setInitString(string str);

	private:
		void branch();
		int iter = 2;
		string init = "f";
		vector<string> change;
		vector<char> flags;
};

#endif /* Tree__ */
