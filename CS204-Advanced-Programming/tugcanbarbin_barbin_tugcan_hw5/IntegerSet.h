#ifndef IntegerSet_H ///////////////////////////tuðcan barbin 25168 tugcanbarbin
#define IntegerSet_H
#include <iostream>
using namespace std;
class IntegerSet
{
private:
	int size; // size of array
	int *Array; // pointer to int which we will crate an int array
public:
	IntegerSet();// constructor
	IntegerSet(int); // constructor with parameter(size)
	IntegerSet(const IntegerSet & copied); // deep copy constructor
	int getSize() const; // getting size of object
	int * GetArray() const; // getting the array of object
	int * createClone() const; // used for deepcopy
	const IntegerSet operator + (const int &nr); // returns new set value by adding a right hand side value to left hand side operand which is set object
	const IntegerSet operator + (const IntegerSet & rhs) const; // returns new set which is union of left hand side and right hand side set objects.
	const IntegerSet & operator +=(const IntegerSet & rhs); // assigns union of left hand side and right hand side to the left hand side object
	const IntegerSet operator * (const IntegerSet & rhs);   // returns intersection of two hand side of operands
	const IntegerSet & operator = (const IntegerSet & rhs); // // assigns right hand side object to the left hand side object 
	~IntegerSet();// destructor
	void display(); // displaying the private info's without << commend

};
ostream & operator << (ostream & , const IntegerSet &); // << operand which allows us to print out the set object's array as a mathematical way with cout
const bool  operator != (const IntegerSet & lhs, const IntegerSet & rhs); // returns true if right hand side and left hand side onject is different , otherwise returns false
const bool operator <= (const IntegerSet & lhs, const IntegerSet & rhs);  // returns true if left hand side object is subset of right hand side object, otherwise returns false
const bool operator <= (const int & lhs, const IntegerSet & rhs);         // returns true if left hand side operand, which is integer, is in right hand side object , otherwie returns false
#endif