#ifndef BOARD_H
#define BOARD_H // Tuðcan Barbin

#include <iostream>
#include <string>

using namespace std;

class Board
{
private:
	char theBoard[2][6];
public:
	Board();
	void displayBoard() const;
	char getOwner(int,int) const;
	void setOwner(int,int,char);
	bool isFull() const;
	int countOwnedCells(char) const;

};
#endif