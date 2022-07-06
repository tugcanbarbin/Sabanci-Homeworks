#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <unordered_map>
#include <tuple>
/////////////////////////Tugcan Barbin 25168 cs300 stadium

using namespace std;

int main()
{
	ofstream outdata;
	outdata.open("output.txt");
	tuple<string,string,int> Block_Colmun_seat;
	//get<0>(Block_Colmun_seat) = "B1";// sets first element
	//get<1>(Block_Colmun_seat) = "row";// sets second element
	//get<2>(Block_Colmun_seat) = 2;// sets third element
	string fileName;
	fstream file;
	string Line;
	string parcel;
	int blockSize;
	fileName = "inputs.txt";
	file.open(fileName.c_str());
	if(file.fail())
		outdata << "Cannot open a file named " << fileName << endl;

	getline(file,Line);
	stringstream BlockNames(Line);// push parcel as block name
	getline(file,Line);
	stringstream RowNames(Line);// push parcel as row name
	getline(file,Line);
	stringstream columnSizeString(Line);// take the column size per block
	columnSizeString >> blockSize;// take the column size per block
	unordered_map<string,int> BlockToColumnIndex; //Blocks and their column index starting points
	unordered_map<string,int> fullnessOfBlock; // to keep track of fullness of blocks
	unordered_map<string,int> RowNameToIndex; //Blocks and their column index starting points
	unordered_map<string,tuple<string,string,int>> customers;
	vector<string> blocks;
	vector<string> rows;
	int index=0;
	int numberOfBlocks;
	int numberOfRows;
	int numberOfColumns;
	while(BlockNames >> parcel)
	{
		BlockToColumnIndex[parcel] = index;
		blocks.push_back(parcel);
		fullnessOfBlock[parcel] = 0;
		index+=blockSize;
	}
	numberOfBlocks= blocks.size();
	numberOfColumns = numberOfBlocks * blockSize;
	index = 0;
	while(RowNames >> parcel)
	{
		RowNameToIndex[parcel] = index;
		index++;
		rows.push_back(parcel);
	}
	numberOfRows = rows.size();
	vector<vector <string>> matrix(numberOfRows, vector<string>(numberOfColumns));
	for(int i = 0;i < numberOfRows; i++) // initialize matrix
	{
		for(int j = 0; j < numberOfColumns; j++)
		  matrix[i][j] = "---";
	}
	string blockNameString,rowName,customerName;
	int seat;

	while(getline(file,Line)) ////// start to read the file commands
	{
		if(Line != "") // if the line is not empty
		{
			stringstream lineToWords(Line);
			lineToWords >> parcel;
			if(parcel == "print")
			{
				int add =0;
				for(int i = 0;i < blocks.size(); i++) // initialize matrix
				{
					outdata << "\n" << blocks[i] << "\n" << "~~~~~~~\n" ;
					for(int j = 0; j < rows.size(); j++)
					{
						outdata << rows[j] << " :";
						for(int k =0+add; k < blockSize+add ; k++) /////O(B*R*C) to print
						{
							outdata << " "<<matrix[j][k];
						}
						outdata << "\n";
					}
					outdata << "=======\n";
					add+= blockSize;
				}
			}///////////////////////////////////////////////////
			else if(parcel == "get_seat") ///O(1)
			{
				lineToWords >> customerName;
				if(customers.find(customerName) != customers.end())
				{
					outdata <<"Found that "<< customerName << " has a reservation in " << get<0> (customers[customerName]) << " " << get<1> (customers[customerName])<<"-"<<get<2> (customers[customerName]) << endl;
				}
				else
					outdata <<"There is no reservation made for " << customerName << "!"<< endl;
			}
			else if(parcel =="reserve_seat" || parcel == "reserve_seat_by_row")
			{
				lineToWords >>customerName; // take name
				if(customers.find(customerName) == customers.end()) // if customer is new
				{
					if(parcel =="reserve_seat") // if parcel is a block O(1)
					{
						lineToWords>>parcel; // take block
						blockNameString= parcel;
						lineToWords >> parcel; // take row
						rowName = parcel;
						lineToWords >> seat; // take seat
						get<0>(Block_Colmun_seat) = blockNameString;// sets first element
						get<1>(Block_Colmun_seat) = rowName;// sets second element
						get<2>(Block_Colmun_seat) = seat;// sets third element
						if(matrix[RowNameToIndex[rowName]][seat+BlockToColumnIndex[blockNameString]] == "---") // if the seat is not reserved
						{
							customers[customerName] = Block_Colmun_seat;
							/*fullnessOfBlock[blockNameString+rowName]= fullnessOfBlock[blockNameString+rowName]+1;*/
							matrix[RowNameToIndex[rowName]][seat+BlockToColumnIndex[blockNameString]] = customerName.substr(0, 3);
							outdata << customerName << " has reserved " << blockNameString << " " << rowName<<"-"<<seat << endl;
						}
						else                /////////////////////////////////////////////////////////////if the seat is reserved
							outdata <<customerName <<" could not reserve a seat!\n";
					}
					else if(parcel == "reserve_seat_by_row") // if it is row then find the emptiest block and reserve O(C)
					{
						lineToWords>>parcel; // take row
						int rowIndex = RowNameToIndex[parcel];
						int temp=blockSize;
						int counter=0;
						int bestBlockStartingIndex =0;
						bool isFull = true;
						for(int j = 0; j<numberOfBlocks; j++)
						{
							for(int i =0+blockSize*j; i< blockSize+blockSize*j; i++)  // size per block   O(C) because B*B(size) = C
							{
								if(matrix[rowIndex][i] != "---")
								{
									counter++;
								}
							}
							if(counter<blockSize)
								isFull = false;// there is an empty seat in that given row
							if(counter<temp)
							{
								temp = counter;
								bestBlockStartingIndex = j*blockSize; // find the best block's starting point of given row
							}
							counter = 0;
						}
						if(!isFull)
						{
							int reservedSeat;
							bool found =false;
							for(int i = 0; i<blockSize && !found; i++)
							{
								if(matrix[rowIndex][bestBlockStartingIndex+i] == "---") //search from left to right to find first empty seat
								{
									matrix[rowIndex][bestBlockStartingIndex+i] = customerName.substr(0,3);
									reservedSeat = bestBlockStartingIndex+i;
									found = true;
								}
							}
							get<0>(Block_Colmun_seat) = blocks[bestBlockStartingIndex/blockSize];// sets first element
							get<1>(Block_Colmun_seat) = rows[rowIndex];// sets second element
							get<2>(Block_Colmun_seat) = reservedSeat%blockSize;// sets third element
							customers[customerName] = Block_Colmun_seat; // add the key and value to unordered_map
							outdata << customerName << " has reserved " << blocks[bestBlockStartingIndex/blockSize] << " " << rows[rowIndex]<<"-"<<reservedSeat%blockSize<< " by emptiest block"<< endl;
						}
						else
							outdata <<customerName <<" could not reserve a seat!\n";
					}
				}
				else
					outdata <<customerName<<" could not reserve a seat!\n";

			}
			else if(parcel == "cancel_reservation") // cancel reserv O(1)
			{
				lineToWords >> customerName;
				if(customers.find(customerName) == customers.end())
					outdata <<"could not cancel the reservation for "<< customerName<<"; no reservation found!" << endl;
				else
				{
					int indexCol = BlockToColumnIndex[get<0> (customers[customerName])] + get<2> (customers[customerName]) ;
					int indexRow = RowNameToIndex[get<1> (customers[customerName])];
					matrix[indexRow][indexCol] = "---";
					customers.erase(customerName);
					outdata <<"Cancelled the reservation of " << customerName << endl;
				}
			}
		}
	}
	file.close();
	outdata.close();
}
