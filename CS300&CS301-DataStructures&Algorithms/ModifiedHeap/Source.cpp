#include <iostream>
#include "mpq.h"
#include <vector>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;
struct points  // point structure that i used to sort the critical points
{
	int x;
	bool left; // 1 for left 0 for right 
	int id;
};
int main()
{
	vector<int> yOfLabels;  /// vector that i keep for height of buildings with respect to labels(indexes)
	vector <points>sorted_list ;  // the list i sort the points
	int maxHeight= 0;
	// read the documents
	ifstream input;
	input.open("input.txt");
	//getline// get size
	int size;
	string d;
	getline(input, d);
	istringstream getsize(d); // take first line
	getsize >> size;
	// create a mpq with given size
	mpq mpq(size);
	// get lines and push to sorted_list
	int id = 0;
	while(getline(input, d))
	{
		int leftx, rightx, y;
		istringstream divideLine(d);
		divideLine >> leftx;
		divideLine >> y;
		divideLine >> rightx;
		points p;
		yOfLabels.push_back(y);   // take the height of buildings in order of label
		p.id = id;  // assign left point and push
		p.left= true;
		p.x = leftx;
		sorted_list.push_back(p);
		p.left= false; // asign right point and push 
		p.x = rightx;
		sorted_list.push_back(p);
		id++;
	}
	// sort the sorted_list
	int sortedSize = sorted_list.size();
    int j;
	for(int  p = 1; p<sortedSize; p++ ) //O(n^2)
	{
		points temp = sorted_list[p];
		for(j=p; j > 0 && temp.x < sorted_list[j-1].x; j--)
			sorted_list[j]= sorted_list[j-1];
		sorted_list[j]= temp;
	}
	//if first element of sorted_list ' s x is greater than 0 than print 0,0
	if(sorted_list[0].x > 0)
	{
		cout << "0	0\n";
	}
	// get elements while x values are same than print the x and height // if right remove if left add
	for(int i = 0 ;i < sortedSize; i++ )
	{
		int label =sorted_list[i].id;
		if(sorted_list[i].left) // if left , add
		{
			buildings temp;
			temp.label = label;
			temp.value = yOfLabels[label];
			mpq.insert(temp,label);
		}
		else  // else , remove
		{
			mpq.Remove(label);
		}
		while(sortedSize > i+1 && sorted_list[i].x == sorted_list[i+1].x) //  while x values are same than continue to get elements from list
		{
			i++;
			int label =sorted_list[i].id; ///// þüpheli
			if(sorted_list[i].left) // if left, add
			{
				buildings temp;
				temp.label = label;
				temp.value = yOfLabels[label];
				mpq.insert(temp,label);
			}
			else   // else remove
			{
				mpq.Remove(label);
			}
		}
		// if maximum height is changed than print
		int beforeMax = maxHeight;
		if(mpq.IsEmpty())
			maxHeight = 0;
		else
		{
			maxHeight = yOfLabels[mpq.GetMax().label];
		}
		if(beforeMax != maxHeight)
			cout << sorted_list[i].x << "	" << maxHeight << "\n";
	}
}
