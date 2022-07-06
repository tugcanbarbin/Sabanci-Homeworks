#include <string>
#include <iostream>
#include "Player.h"
#include "Board.h"/////////////Tuðcan Barbin 25168

using namespace std;
void Player::move(int repeat)
{
	for(int i=0; i<repeat ; i++)
	{
		if(direction == 1)
		{
			if(x == 0)
			{
				if(y <5)
					y++;
				else if(y == 5)
					x++;
			}
			else
			{
				if(y>0)
					y--;
				else if(y ==0)
					x--;
			}
		}
		else
		{
			if(x == 0)
			{
				if(y == 0)
					x++;
				else
					y--;
			}
			else
			{
				if(y<5)
					y++;
				else if(y == 5)
					x--;
			}
		}
	}
}
void Player::claimOwnership()
{
	if(board.getOwner(x,y)=='-')
		board.setOwner(x,y,plyrName);
}
bool Player :: wins() const
{
	if(board.countOwnedCells(plyrName)>6)
		return true;
	else 
		return false;
}
int Player :: getRow() const
{
	return x;
}
int Player :: getCol() const
{
	return y;
}