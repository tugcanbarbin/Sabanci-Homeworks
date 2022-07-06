#include "pointquadtree.h"
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
using namespace std;

void gettingfiles(string which, string & filename, ifstream & input);
int main ()
{
	PointQuadTree myTree;
	ifstream Cities;
	Cities.open("cities.txt");
	ifstream Queries;
	Queries.open("queries.txt");
	int x,y;
	string d;
	getline(Cities, d);
	istringstream cityLinefirst(d); // take first line
	cityLinefirst >> x;
	cityLinefirst >> y;
	myTree.SetTable(x,y);// set table's bounds
	string CityName;
	int CoordX,CoordY;
	while(getline(Cities,d))// line by line cities
	{
		istringstream cityLine(d);
		cityLine >> CityName;
		cityLine >> CoordX;
		cityLine >> CoordY;
		myTree.insertTable(CityName,CoordX,CoordY);
		myTree.insert(CityName,CoordX,CoordY);
	}
	string dummy2;
	int Xquer,Yquer,Rquer;
	while(getline(Queries, dummy2)) // line by line queries
	{
		string comma_string;
		istringstream QueryLine(dummy2);
		QueryLine >> Xquer;
		getline(QueryLine, comma_string, ',');
		QueryLine >> Yquer;
		getline(QueryLine, comma_string, ',');
		QueryLine >> Rquer;
		myTree.SearchAndPrint(Xquer,Yquer,Rquer);
	}
}
