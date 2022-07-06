#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main()
{
	ifstream file;
	file.open("loremipsum.txt");
	char current;
	int count=0;
	while(file.get(current))
	{
		if(current == 'a')
			count++;
	}
	cout <<"There are "<< count<< " 'a' characters in this file.\n";
	file.close();
}