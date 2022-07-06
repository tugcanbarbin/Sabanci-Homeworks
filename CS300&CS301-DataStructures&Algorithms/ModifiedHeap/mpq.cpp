#include <iostream>
#include "mpq.h"
#include <vector>

mpq :: mpq (int size)
{
	buildings dummy;
	HEAP.push_back(dummy);
	location.resize(size);
}
void mpq :: insert(buildings value, int label) // insert to HEAP with the heap insertion
{
	int hole = HEAP.size();  // hole  = size because it will be added
	HEAP.push_back(value);   // here
	for(; hole > 1 && value.value > HEAP[hole/2].value; hole/=2)  // percolate down the hole until reaching the first element
	{
		HEAP[hole] = HEAP[hole/2];
		location[HEAP[hole/2].label] = hole;
	}
	HEAP[hole]= value;   // fill the hole
	location[label] = hole;  // uptade the index in HEAP
}
buildings mpq:: Remove(int label)  // remove the given hole from heap with modified version with label list
{
	int index;
	index = location[label];  // get the index in HEAP
	buildings temp = HEAP[index];  // take the target
	location[label] = 0;  // assign it's index in HEAP as 0
	HEAP[index] = HEAP[HEAP.size()-1];  // Take the last element and put it in target index
	location[HEAP[index].label] = index;  // update replaced element's location in HEAP
	HEAP.pop_back();  // pop the HEAP to delete last element
	if(HEAP.size() > index)
		percolateDown(index); // if possible percolate down the replaced element
	return temp; // return the target
}
buildings mpq::GetMax()
{
	return HEAP[1];
}
bool mpq :: IsEmpty()
{
	if(HEAP.size()==1)
		return true ;
	else 
		return false;
}
void mpq :: percolateDown(int index)  // i modified it a little bit it was from lecture notes
{
	int child;
	int currentsize =  HEAP.size()-1;
	buildings temp = HEAP[index];
	for(; index*2 <= currentsize;index  = child)
	{
		child  = index*2;;
		if(child!= currentsize && HEAP[child+1].value > HEAP[child].value)
			child++;
		if(HEAP[child].value > temp.value)
		{
			location[HEAP[child].label] = index;
			HEAP[index] = HEAP[child];
		}
		else 
			break;
	}
	HEAP[index] = temp;
}