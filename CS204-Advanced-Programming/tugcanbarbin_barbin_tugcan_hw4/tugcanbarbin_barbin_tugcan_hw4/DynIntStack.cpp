///// I TOOK DYNINTSTACK CPP AND HEADER FILES FROM ALBERT LEVÝ'S WEEK5 LECTURE NOTES

#include <iostream>
#include "dynintstack.h"
using namespace std;
DynIntStack::DynIntStack()
{
	top = NULL; 
}
void DynIntStack::push(int num)
{
	StackNode *newNode;
	newNode = new StackNode;
	newNode->value = num;
	if (isEmpty())
	{
		top = newNode;
		newNode->next = NULL;
	}
	else	// insert NewNode before top
	{
		newNode->next = top;
		top = newNode;
	}
}
void DynIntStack::pop(int &num)
{
	StackNode *temp;

	if (isEmpty())
	{
		cout << "The stack is empty.\n";
	}
	else	// pop top value of stack
	{
		num = top->value;
		temp = top->next;
		delete top;
		top = temp;
	}
}
bool DynIntStack::isEmpty(void)
{
	bool status;

	if (top == NULL)
		status = true;
	else
		status = false;

	return status;
}
DynIntStack::~DynIntStack()
{
	StackNode *temp;
	while(top != NULL)
	{
		temp = top->next;
		delete top;
		top = temp;
	}
}