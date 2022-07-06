#include <iostream>
#include <string>
#include "Board.h" //////Tuðcan barbin 25168

using namespace std;
Board :: Board()
{
	for(int x= 0; x<2; x++)
	{
		for(int y = 0 ; y < 6 ;y++)
		{
			theBoard[x][y] = '-';
		}
	}
}
void Board :: displayBoard() const
{
	for(int x= 0; x<2; x++)
	{
		for(int y = 0 ; y < 6 ;y++)
		{
			cout << theBoard[x][y] <<" " ;
		}
		cout << "\n";
	}
}
char Board :: getOwner(int x,int y) const
{
	return theBoard[x][y];
}
void Board :: setOwner(int x,int y, char plyr)
{
	theBoard[x][y] = plyr;
}
bool Board :: isFull() const
{
	for(int x= 0; x<2; x++)
	{
		for(int y = 0 ; y < 6 ;y++)
		{
			if(theBoard[x][y] == '-')
				return false;
		}
	}
	return true;
}
int Board :: countOwnedCells(char plyr) const
{
	int count = 0;
	for(int x= 0; x<2; x++)
	{
		for(int y = 0 ; y < 6 ;y++)
		{
			if(theBoard[x][y] == plyr)
				count++;
		}
	}
	return count;
}