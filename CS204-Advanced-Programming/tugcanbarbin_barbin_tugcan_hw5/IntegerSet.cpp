#include "IntegerSet.h" ///////////////////tuðcan barbin 25168    tugcanbarbin
#include <iostream>
#include <string>

using namespace std;

IntegerSet:: IntegerSet() // constructor without parameters, sets size to 0  and pointer to NULL
{
	this ->size = 0;
	this ->Array = NULL;
}
int IntegerSet::getSize() const  // gets private size of class
{
	return size;
}
int * IntegerSet::GetArray() const // gets private array of class
{
	return Array;
}
void IntegerSet::display() // displays the object without << operand
{
	cout << "{";
	for(int i = 0; i<size;i++)
	{
		if(i==size-1)
			cout << Array[i] << "}"<< endl;
		else
			cout << Array[i]<< ", ";
	}
}
IntegerSet:: IntegerSet(int a) // constructor with parameter
{
	size = a;
	if(size<0) // if given size is negative, just create an empty object
		IntegerSet();
	else      // otherwise create an array with given size long
	{
		Array = new int[size];
		for(int i = 0; i<size;i++)
		{
			Array[i] = i;
		}
	}
}
IntegerSet::~IntegerSet() // destructor which deletes the array
{
	delete []Array;
	Array = NULL;
}
IntegerSet:: IntegerSet(const IntegerSet &copied) // deep copy constructor 
{
	size = copied.size;
	Array = copied.createClone();
}
int * IntegerSet :: createClone() const // copies the object as a new one with new dynamic allocated memory.
{
	if(Array == NULL)
		return NULL;
	int newsize = size;
	int *newArray = new int[newsize];
	for(int i = 0;i < size;i++)
	{
		newArray[i]=this->Array[i];
	}
	return newArray; // return new array
}
ostream& operator << (ostream &out, const IntegerSet & mySet) // cout operator
{
	int outputsize = mySet.getSize(); // to use for loop, get private size and array 
	int *outputArray = mySet.GetArray();
	out << "{";
	for(int i =0;i< outputsize;i++) // until the end of array display numbers and then close with }
	{
		if(i == outputsize-1)
			out << outputArray[i] << "}";
		else
			out << outputArray[i] << ", ";
	}
	if(outputsize == 0)
		out << "}";
	return out; // return ostream object
}
const IntegerSet IntegerSet::operator + (const int &nr) // returns  the value added version of left hand side object
{
	for(int k = 0 ; k< size;k++)
	{
		if(Array[k] == nr)	 ////// if number is already in set , then return left hand side object
		{
			IntegerSet sameSet(*this);
			return sameSet;
		}
	}
	IntegerSet newSet(size+1);
	for(int i  = 0; i< size; i++) // otherwise create a new object with size+1 and add this value to the end
	{
		newSet.Array[i] = Array[i];
	}
	newSet.Array[size] = nr;
	return newSet; // return new set
}
const IntegerSet IntegerSet::operator + (const IntegerSet & rhs) const // returns union of both operands
{
	bool alreadyIn = false;
	int lhsSize = size; // getting size for better performance in for loops
	int rhsSize = rhs.size;
	if(rhs.size == 0) // if right hand side is null set than return left hand side
	{
		IntegerSet sameSet(*this);
		return sameSet; // return new set
	}
	IntegerSet newSet(*this); // otherwise create a new set with values of left hand side
	for(int k = 0 ; k< rhsSize;k++)
	{
		for(int m = 0; m < lhsSize && !alreadyIn; m++) // and then add the values of right hand side object which is not in left hand side to the new set
		{
			if(rhs.Array[k] == Array[m])
				alreadyIn = true;
		}
		if(!alreadyIn)
		{
			newSet = newSet + rhs.Array[k];
		}
		alreadyIn = false;
	}
	return newSet; // return newset
}
const IntegerSet & IntegerSet::operator += (const IntegerSet & rhs) // returns both operands' union but assigns it to left hand side operand
{
	bool alreadyIn = false;
	int lhsSize = size;
	int rhsSize = rhs.size;
	for(int k = 0 ; k< rhsSize;k++) // when it finds a value of right hand side object which is not in left hand side operand ,   it adds this value to the left hand side.
	{
		for(int m = 0; m < lhsSize && !alreadyIn; m++)
		{
			if(rhs.Array[k] == Array[m])
				alreadyIn = true;
		}
		if(!alreadyIn)
		{
			*this = *this + rhs.Array[k];
		}
		alreadyIn = false;
	}
	return *this; // return updated left hand side object
}
const IntegerSet IntegerSet :: operator * (const IntegerSet & rhs) // returns intersection of both operand objects
{
	bool alreadyIn = false;
	int lhsSize = size;// getting size for better performance in for loops 
	int rhsSize = rhs.size;
	int newSize=0;
	for(int k = 0 ; k< rhsSize;k++) // it gives us the size of intersection set
	{
		for(int m = 0; m < lhsSize && !alreadyIn; m++) 
		{
			if(rhs.Array[k] == Array[m])
			{
				alreadyIn = true;
				newSize +=1;
			}
		}
		alreadyIn = false;
	}
	IntegerSet temp(newSize);// temp set with intersection set size
	int index=0;
	for(int k = 0 ; k< rhsSize;k++) // setting the values of temp set
	{
		for(int m = 0; m < lhsSize && !alreadyIn; m++)
		{
			if(rhs.Array[k] == Array[m])
			{
				alreadyIn = true;
				temp.Array[index] = rhs.Array[k];
				index +=1;
			}
		}
		alreadyIn = false;
	}
	return temp; // return temp set
}
const IntegerSet & IntegerSet :: operator = (const IntegerSet & rhs) // assigns right hand side object to the left hand side object with deep copy technique
{
	int rhsSize = rhs.size;
	size = rhsSize;
	int *tempArray = new int[rhsSize]; // temp array for copy rhs object
	for(int i =0; i< rhsSize; i++)
	{
		tempArray[i] = rhs.Array[i]; // setting values of temp array with rhs array
	}
	delete Array; /// delete the left hand side object's current array
	Array = tempArray; // and assign it as tempArray
	return *this; // return left hand side
}
const bool operator != (const IntegerSet & lhs, const IntegerSet & rhs) // checks whether if both operands are different or not
{
	int *lhsArray = lhs.GetArray(); // getting sizes of both operands
	int lhsSize = lhs.getSize();
	int *rhsArray = rhs.GetArray();
	int rhsSize = rhs.getSize();
	if(rhsSize != lhsSize) // if sizes are different then they are different return true
		return true;
	else
	{
		bool Same = false;
		for(int i  = 0; i<lhsSize; i++) // looks for any different value , if there is then return it true
		{
			for(int k = 0; k < rhsSize && !Same ; k++)
			{
				if(lhsArray[i]== rhsArray[k])
					Same = true;
			}
			if(!Same)
				return true;
			Same = false;
		}
		return false;
	}

}
const bool operator <= (const int & lhs, const IntegerSet & rhs) // checks if left hand side integer is in  right hand side operand or not
{
	int *rhsArray = rhs.GetArray();
	int rhsSize = rhs.getSize(); // getting right hand side operand's private infos
	for(int i  = 0 ; i <rhsSize ; i++)// looking for left hand side operand in right hand side array
	{
		if(rhsArray[i]==lhs)
			return true;
	}
	return false;
}
const bool operator <= (const IntegerSet & lhs, const IntegerSet & rhs) // checks whether left hand side operand is subset of right hand side operand or not
{
	int *lhsArray = lhs.GetArray();
	int lhsSize = lhs.getSize();
	int *rhsArray = rhs.GetArray();
	int rhsSize = rhs.getSize(); // getting both sides private infos to search for values
	if(lhsSize > rhsSize) // if left hand side's size is greater than right hand side operand than it can not be a subset
		return false;
	else
	{
		bool Same = false;
		for(int i  = 0; i<lhsSize; i++) // searches for any different values in left hand side operand, if there is a value that is not in right hand side operand than it is not a subset
		{
			for(int k = 0; k < rhsSize && !Same ; k++)
			{
				if(lhsArray[i]== rhsArray[k])
					Same = true;
			}
			if(!Same)
				return false;
			Same = false;
		}
		return true;
	}
}