#include <iostream>
#include "pointquadtree.h"
using namespace std;
PointQuadTree :: PointQuadTree()
{
	Root = NULL;
}
PointQuadTree :: ~PointQuadTree()
{
	deleteQuadTree(Root);
}
void PointQuadTree::SetTable(int x, int y) // to take table's size
{
	table.resize(y+1);
	int i = 0;
	for(int i = 0; i<y+1;i++)
	{
		table[i].resize(x+1,".");
	}
}
void PointQuadTree:: insert(string CityName,int x,int y)
{
	int xBound = table[0].size();
	int yBound = table.size();
	bool Notinserted = true;
	QuadTree *temp = Root;
	if(y < yBound)
	{
		if(x < xBound)
		{
			while(Notinserted)
			{
				if(Root == NULL)
				{
					Root = new QuadTree;
					Root->name = CityName;
					Root->x =x;
					Root->y = y;
					Root->SE = NULL;
					Root->SW = NULL;
					Root->NE = NULL;
					Root->NW = NULL;
					Notinserted = false;
				}	
				//compare
				else
				{
					if(x < temp->x) // west
					{
						if(y< temp-> y) 
						{//South
							if(temp->SW == NULL)
							{
								temp->SW = new QuadTree;
								temp = temp->SW;
								temp->name = CityName;
								temp->x = x;
								temp->y = y;
								temp->SE = NULL;
								temp->SW = NULL;
								temp->NE = NULL;
								temp->NW = NULL;
								Notinserted = false;
							}
							else
								temp = temp->SW;
						}
						else
						{
							if(temp->NW == NULL)
							{
								temp->NW = new QuadTree;
								temp = temp->NW;
								temp->name = CityName;
								temp->x = x;
								temp->y = y;
								temp->SE = NULL;
								temp->SW = NULL;
								temp->NE = NULL;
								temp->NW = NULL;
								Notinserted = false; //North
							}
							else
								temp = temp->NW;
						}
					}	
					else // east
					{
						if(y< temp-> y) //South
						{
							if(temp->SE == NULL)
							{
								temp->SE = new QuadTree;
								temp = temp->SE;
								temp->name = CityName;
								temp->x = x;
								temp->y = y;
								temp->SE = NULL;
								temp->SW = NULL;
								temp->NE = NULL;
								temp->NW = NULL;
								Notinserted = false;
							}
							else
								temp = temp->SE;
						}
						else 
						{/////north
							if(temp->NE == NULL)
							{
								temp->NE = new QuadTree;
								temp = temp->NE;
								temp->name = CityName;
								temp->x = x;
								temp->y = y;
								temp->SE = NULL;
								temp->SW = NULL;
								temp->NE = NULL;
								temp->NW = NULL;
								Notinserted = false;
								
							}
							else
								temp = temp->NE; 
						}
						
					}
				}
			}
		}
	}
}

void PointQuadTree:: insertTable(string CityName,int x,int y)
{
	int xBound = table[0].size();
	int yBound = table.size();
	if(y < yBound)
		if(x < xBound)
			table[y][x]= CityName;
}
void PointQuadTree :: SearchAndPrint(int x,int y, int r)
{
	vector <QuadTree> inRange;
	vector <QuadTree> Visited;
	QuadTree * temp = Root;
	compareinside(temp,x,y,r,inRange,Visited);
	int sizeOfRangeVec = inRange.size();
	if(sizeOfRangeVec == 0)
		cout << "<None<"<< endl;
	else
	{
		for(int i =0;i < sizeOfRangeVec; i++)
		{
			if(i==sizeOfRangeVec-1)
				cout << inRange[i].name;
			else 
				cout << inRange[i].name << ", ";
		}
		cout << "\n";
	}
	int sizeOfVisitedVec = Visited.size();
	if(sizeOfVisitedVec == 0)
		cout << "<None>" << endl;
	else
	{
		for(int i =0;i < sizeOfVisitedVec; i++)
		{
			if(i==sizeOfVisitedVec-1)
				cout << Visited[i].name;
			else
				cout << Visited[i].name << ", ";
		}
		cout << "\n";
	}
	//for(int j = 0; j< 101; j++)
	//{
	//	for(int k  = 0; k<101 ; k++)
	//	{
	//		cout << table[j][k] << " ";
	//	}
	//	cout <<"\n";
	//}
}
void compareinside(QuadTree* temp,int x,int y, int r, vector<QuadTree> & inRange,vector<QuadTree> & Visited) //Recursively visiting all the nodes that goes to the given location and picks the visited and 
{////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// takes the nodes that in range in vectors.
	if(temp!=NULL)
	{
		int structureX,structureY,result,maxdistance;
		maxdistance = r*r;
		structureX = temp->x;
		structureY = temp->y;
		result = ((structureX-x)*(structureX-x))+((structureY-y)*(structureY-y));
		if(result < maxdistance || result == maxdistance)
		{
			inRange.push_back(*temp);
			Visited.push_back(*temp);
		}
		else
			Visited.push_back(*temp);
		if(y-r <= temp->y)// SOUTH OR MAY SOUTH
		{
			if(x+r >= temp->x) // EAST OR MAY EAST
			{
				compareinside(temp->SE,x,y,r,inRange,Visited);
			}
			if(x-r <= temp->x)// west or may west
			{
				compareinside(temp->SW,x,y,r,inRange,Visited);
			}
		}
		if(y+r >= temp->y)// NORTH OR MAY NORTH
		{
			if(x+r >= temp->x) // EAST OR MAY EAST
			{
				compareinside(temp->NE,x,y,r,inRange,Visited);
			}
			if(x-r <= temp->x)// west or may west
			{
				compareinside(temp->NW,x,y,r,inRange,Visited);
			}
		}
	}
}
void deleteQuadTree(QuadTree * temp)
{
	if(temp != NULL)
	{
		deleteQuadTree(temp->NE);
		deleteQuadTree(temp->NW);
		deleteQuadTree(temp->SE);
		deleteQuadTree(temp->SW);
		delete temp;
	}

}

//if(x < temp->x) // west
		//{
		//	if(y< temp-> y)   //South
		//		if(temp->SW == NULL)
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//		else
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//	else if(y== temp-> y)
		//	{
		//		if(temp->SW == NULL && temp->NW == NULL)
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//		}
		//		else
		//		{
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//	}
		//	else
		//		if(temp->NW == NULL)
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//		}
		//		else
		//			compareinside(temp->NW,x,y,r,inRange,Visited); //North
		//}	
		//else if(x == temp->x)
		//{
		//	if(y< temp-> y)//South
		//	{
		//		if(temp->SE == NULL && temp->SW == NULL)
		//		{
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//		else
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//		}
		//	}
		//	else if(y== temp-> y)  /////north
		//	{
		//		compareinside(temp->NE,x,y,r,inRange,Visited); 
		//		compareinside(temp->SE,x,y,r,inRange,Visited);
		//		compareinside(temp->NW,x,y,r,inRange,Visited); 
		//		compareinside(temp->SW,x,y,r,inRange,Visited);
		//	}
		//	else
		//	{
		//		if(temp->SE == NULL && temp->SW == NULL)
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//		}
		//		else
		//		{
		//			compareinside(temp->NE,x,y,r,inRange,Visited); 
		//			compareinside(temp->NW,x,y,r,inRange,Visited); 
		//		}
		//	}

		//}
		//else // east
		//{
		//	if(y< temp-> y) //South
		//		if(temp->SW == NULL)
		//		{
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//		else
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//	else if(y== temp-> y)  /////north
		//	{
		//		if(temp->SW == NULL && temp->NW == NULL)
		//		{
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//		else
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited); 
		//			compareinside(temp->NE,x,y,r,inRange,Visited);
		//		}
		//	}
		//	else
		//		if(temp->NE == NULL)
		//		{
		//			compareinside(temp->SE,x,y,r,inRange,Visited);
		//			compareinside(temp->SW,x,y,r,inRange,Visited);
		//			compareinside(temp->NW,x,y,r,inRange,Visited);
		//		}
		//		else	
		//			compareinside(temp->NE,x,y,r,inRange,Visited); 
		//}