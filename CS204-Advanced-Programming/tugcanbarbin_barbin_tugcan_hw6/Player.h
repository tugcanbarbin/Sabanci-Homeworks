#ifndef PLAYER_H
#define PLAYER_H

#include "Board.h" //////7 Tuðcan Barbin 25168
#include <string>
#include <iostream>
using namespace std;

class Player
{
private:
	Board &board;
	char plyrName;
	int x,y;
	int direction;
public:
	Player();
	Player::Player(Board &myboard,char c,int d)
		: board(myboard), plyrName(c), direction(d),x(0),y(0)
		{ };
	void move(int);
	void claimOwnership();
	bool wins() const ;
	int getRow() const;
	int getCol() const;


};







#endif