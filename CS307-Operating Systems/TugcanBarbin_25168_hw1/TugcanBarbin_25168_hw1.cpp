#include <iostream>
#include <string>
#include <cstdlib>
#include <pthread.h>
#include <ctime>

using namespace std;


int turn, numberOfSeatsLeft;
int seats[2][50];


void *Agency1(void*);
void *Agency2(void*);


int main()
{
	srand(time(NULL));
	turn = 0;
	numberOfSeatsLeft = 100;
	for (int i = 0; i<2 ; i++)
	{
		for(int j=0; j<50; j++)
		{
			seats[i][j] = 0;
		}
	}
	pthread_t TravelAgency1;//thread creation and usage
	pthread_t TravelAgency2;
	int creation_result1=pthread_create(&TravelAgency1, NULL, Agency1, NULL);
	int creation_result2=pthread_create(&TravelAgency2, NULL, Agency2, NULL);
	pthread_join(TravelAgency1, NULL);
	pthread_join(TravelAgency2, NULL); //when threads are done
	cout << "No Seats Left" << endl;

	cout << "Plane is full:" << endl << endl;
	for (int i = 0; i<2 ; i++)
	{
		for(int j=0; j<50; j++)
		{
			cout << seats[i][j] <<" ";
		}
		cout << endl;
	}
	return 0;
}
void * Agency1(void*)
{
	bool cont = true; //to get out of infinite loop
	while(cont)
	{
		bool full= false; // boolean for checking if the plane is full or not
		int seatNo = 1 +(rand()%100);  // taking a random integer between 1 and 100
		int row = seatNo/51; // return 0 until 51 then 1
		int colmn;
		if(seatNo >50)
			colmn = seatNo-51;  // if its in second row then decrement the value with 51 for finding true index
		else
			colmn = seatNo-1;  // if it is in first row then decrement the value with 1 for finding true index
		while(turn != 0)// busy waiting
		{
		};
		cout << "Agency 1 Entered Critical Region" << endl; // entered critical region
		if(numberOfSeatsLeft!=0) // check if the plane is full or not
		{
			if(seats[row][colmn] == 0) // check if the current seat is taken or not
			{
				seats[row][colmn] = 1; //mark
				numberOfSeatsLeft--; //decrement the avaliable seats
				cout << "Seat Number " << seatNo << " is reserved by Agency 1" << endl; // reserve
			}
		}
		else
			full = true;
		cout << "Agency 1 Exit Critical Region" << endl<<endl; 
		turn = 1; // exit the critical region
		if(full) // if the plane is full then stop the execution
			cont = false;

	}
}
void * Agency2(void*) // all the things are same with agency 1
{
	bool cont = true;
	while(cont)
	{
		bool full= false;
		int seatNo = 1 +(rand()%100);
		int row = seatNo/51;
		int colmn;
		if(seatNo >50)
			colmn = seatNo-51;
		else
			colmn = seatNo-1;
		while(turn != 1)
		{
		};
		cout << "Agency 2 Entered Critical Region" << endl;
		if(numberOfSeatsLeft!=0)
		{
			if(seats[row][colmn] == 0)
			{
				seats[row][colmn] = 2;
				numberOfSeatsLeft--;
				cout << "Seat Number " << seatNo << " is reserved by Agency 2" << endl;
			}
		}
		else
			full = true;
		cout << "Agency 2 Exit Critical Region" << endl<<endl;
		turn = 0;
		if(full)
			cont = false;

	}
}