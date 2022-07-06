#ifndef pointquadtree_H
#define pointquadtree_H // Tuðcan Barbin


#include <vector>
#include <iostream>
#include <string>

using namespace std;
struct QuadTree
{
	int x;
	int y;
	string name;
	QuadTree * SE;
	QuadTree * SW;
	QuadTree * NE;
	QuadTree * NW;
};
class PointQuadTree
{
private:
	vector<vector<string>> table;
	QuadTree * Root;
public:
	PointQuadTree();
	~PointQuadTree();
	void SetTable(int,int);
	void insert(string,int,int);
	void insertTable(string CityName,int x,int y);
	void SearchAndPrint(int,int,int);
};
void compareinside(QuadTree *,int,int,int, vector<QuadTree> &, vector<QuadTree> &);
void deleteQuadTree(QuadTree*);
#endif