#include <iostream>
#include <string>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include "DynIntStack.h"
///////////////////////////////////////////////////////////////////////////////////// Tuðcan Barbin 25168
using namespace std;
void gettingShape(int & Rows , int& Columns); // getting shape of the matrix from user
bool isNumeric(string a); // checks if the string is numeric or not
bool isAvaliable(char ** Matrix,int xCoor, int yCoor,int NumOfRows,int NumOfColmns,char filler); // checks if the given coordinate is in bounds and filled or not
int main()
{
	int NumOfRows,NumOfColmns;
	string fileName;
	fstream file;
	gettingShape(NumOfRows,NumOfColmns); /// getting number of rows and columns
	do //////////////////////////////////7 opening file
	{
		cout << "Please enter file name: ";
		cin >> fileName;
		file.open(fileName.c_str());
		if(file.fail())
			cout << "Cannot open a file named " << fileName << endl;
	
	}while(file.fail());
	int rowCoord, colCoord;
	bool failed;
	string failedCin;
	do //////////////// gets starting coordinates
	{
		failed = false;
		cout << "Enter the starting point: ";
		cin >> rowCoord;
		if(!cin.fail())
		{
			cin >> colCoord;
			if(cin.fail())
				failed = true;
		}
		else
			failed = true;
		if(failed)
		{
			cout << "Invalid coordinate!" << endl;
			cin.clear();
			cin.ignore('256','\n');
		}
		else
		{
			if(!(rowCoord > -1 && rowCoord < NumOfRows && colCoord > -1 && colCoord < NumOfColmns))
			{
				failed = true;
				cout << "Invalid coordinate!" << endl;
			}
		}
	}while(failed);
	char ** Matrix; // the matrix that i will read into
	Matrix = new char *[NumOfRows];
	for(int i = 0; i < NumOfRows; i++)
		Matrix[i] = new char[NumOfColmns];
	string RowLine;
	int i=-1;
	while(getline(file,RowLine)) // reading into matrix
	{
		i++;
		for(int j = 0; j< NumOfColmns;j++)
			Matrix[i][j] = RowLine[j];
	}
	char filler; // the filler character 
	if(Matrix[rowCoord][colCoord] == 'x' || Matrix[rowCoord][colCoord] == 'X') // checks if the starting coordinate is occupied or not
	{
		cout << "Starting point is already occupied."<< endl << "Terminating..."; // if occupied then finish the program
		return 0;
	}
	else // ortherwise, get the filler character and go on
	{
		bool invalid = true;
		while(invalid)
		{
			cout << "Enter the filling char: ";
			cin >> filler;
			if(filler == 'X' || filler == 'x')
			{
				invalid = true;
				cout << "Filling char is not valid" << endl;
			}
			else
				invalid = false;
		}
	}
	Matrix[rowCoord][colCoord] = filler; // fill the starting coordinate
	DynIntStack tracking; ////////// the dynamic integer stack that i will keep the track of passed coordinates
	tracking.push(rowCoord);           // first row then col
	tracking.push(colCoord);
	while(!(tracking.isEmpty())) // until the tracking stack is empty   ,,,   and in line 131 i checked if there is a empty cell near starting coordinate when tracking stack is empty
	{
		if(isAvaliable(Matrix,rowCoord+1,colCoord,NumOfRows,NumOfColmns,filler))// if down is avaliable
		{
			rowCoord++;
			Matrix[rowCoord][colCoord] = filler;
			tracking.push(rowCoord);
			tracking.push(colCoord);
		}
		else if(isAvaliable(Matrix,rowCoord-1,colCoord,NumOfRows,NumOfColmns,filler))// if up is avaliable
		{
			rowCoord--;
			Matrix[rowCoord][colCoord] = filler;
			tracking.push(rowCoord);
			tracking.push(colCoord);
		}
		else if(isAvaliable(Matrix,rowCoord,colCoord+1,NumOfRows,NumOfColmns,filler))// if right is avaliable
		{
			colCoord++;
			Matrix[rowCoord][colCoord] = filler;
			tracking.push(rowCoord);
			tracking.push(colCoord);
		}
		else if(isAvaliable(Matrix,rowCoord,colCoord-1,NumOfRows,NumOfColmns,filler))// if left is avaliable
		{
			colCoord--;
			Matrix[rowCoord][colCoord] = filler;
			tracking.push(rowCoord);
			tracking.push(colCoord);
		}
		else //////////// if none of them avaliable look for past coordinates
		{
			tracking.pop(colCoord);
			tracking.pop(rowCoord);
		}
		if(tracking.isEmpty()) //////// if the tracking stack is empty, now look for another empty cell 
		{
			if(isAvaliable(Matrix,rowCoord+1,colCoord,NumOfRows,NumOfColmns,filler))// if down is avaliable
			{
				rowCoord++;
				tracking.push(rowCoord);
				tracking.push(colCoord);
			}
			else if(isAvaliable(Matrix,rowCoord-1,colCoord,NumOfRows,NumOfColmns,filler))// if up is avaliable
			{
				rowCoord--;
				tracking.push(rowCoord);
				tracking.push(colCoord);
			}
			else if(isAvaliable(Matrix,rowCoord,colCoord+1,NumOfRows,NumOfColmns,filler))// if right is avaliable
			{
				colCoord++;
				tracking.push(rowCoord);
				tracking.push(colCoord);
			}
			else if(isAvaliable(Matrix,rowCoord,colCoord-1,NumOfRows,NumOfColmns,filler))// if left is avaliable
			{
				colCoord--;
				tracking.push(rowCoord);
				tracking.push(colCoord);
			}
		} /////// if there is none then finish the searching and filling
	}
	for(int a  = 0; a<NumOfRows ; a++)//// display the filled matrix
	{
		for(int b = 0 ; b< NumOfColmns;b++)
			cout << Matrix[a][b];
		cout << endl;
	}
	return 0;
	
	for(int r = 0; r < NumOfRows; r++) /// deletion of  dynamic linked matrix
		delete Matrix[r];
	delete Matrix;
}

void gettingShape(int & Rows , int& Columns)
{
	string rows;
	bool valid;
	do
	{
		valid = true;
		cout << "Enter the number of rows: ";
		cin >> rows;
		if(!isNumeric(rows)) ///// is it numeric or not
			valid = false;
		if(valid)
		{
			Rows = stoi(rows);
			if(Rows < 3) // check if row number is lower than 3
				valid = false;
		}
		if(!valid)
			cout << rows << " is not valid!" << endl;
	}while(!valid);
	string colmns;
	do
	{
		valid = true;
		cout << "Enter the number of columns: ";
		cin >> colmns;
		if(!isNumeric(colmns)) //// is it numeric or not
			valid = false;
		if(valid)
		{
			Columns = stoi(colmns);
			if(Columns < 3) // check if column number is lower than 3
				valid = false;
		}
		if(!valid)
			cout << colmns << " is not valid!" << endl;
	}while(!valid);
}
bool isNumeric(string a) 
{ 
	int length = a.length();
    for (int i = 0; i < length; i++) 
        if (isdigit(a[i]) == false) // is it a digit or not for all chars
            return false; 
  
    return true; 
} 
bool isAvaliable(char ** Matrix,int xCoor, int yCoor,int NumOfRows,int NumOfColmns,char filler)
{
	if(xCoor < NumOfRows && yCoor < NumOfColmns) // is it in bounds
	{
		if(Matrix[xCoor][yCoor] == 'x' || Matrix[xCoor][yCoor] == 'X'|| Matrix[xCoor][yCoor] == filler) // is it filled with something
			return false;
		else
			return true;
	}
	else
		return false;
}