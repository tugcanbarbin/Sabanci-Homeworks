#include <vector>
#include <iostream>
using namespace std;
struct buildings
{
	int value;
	int label;
};
class mpq
{
private:
	vector <buildings> HEAP;
	vector <int> location;
public:
	mpq(int size);
	void insert(buildings value, int label);
	buildings Remove(int label);
	buildings GetMax();
	bool IsEmpty( );
	void percolateDown(int index);
};