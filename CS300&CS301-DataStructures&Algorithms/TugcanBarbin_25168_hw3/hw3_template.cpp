#include <iostream>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <string>
#include <stdlib.h> 
#include <queue> 
#include <semaphore.h>
#include <time.h>
using namespace std;

#define NUM_THREADS 10
#define MEMORY_SIZE 150

struct node
{
	int id;
	int size;
};


queue<node> myqueue; // shared que
pthread_mutex_t sharedLock = PTHREAD_MUTEX_INITIALIZER; // mutex
pthread_t server; // server thread handle
sem_t semlist[NUM_THREADS]; // thread semaphores

int thread_message[NUM_THREADS]; // thread memory information
char  memory[MEMORY_SIZE]; // memory size





void my_malloc(int thread_id, int size)
{
	//This function will add the struct to the queue
	node temp;
	temp.id = thread_id; 
	temp.size = size;
	pthread_mutex_lock(&sharedLock);  // to acces shared queue
	myqueue.push(temp);	
	pthread_mutex_unlock(&sharedLock);  // to unlock the acces of other threads to shared data
}

void * server_function(void *)
{
	int until = NUM_THREADS;
	node temp;
	int at = 0;
	//This function should grant or decline a thread depending on memory size.
	while(until > 0)//untill all thread's requests are seen, check the queue
	{
		if(!(myqueue.empty()))  // if queue is not empty then take action
		{
			temp = myqueue.front();  // take the node
			myqueue.pop();   // delete the node
			int size = temp.size;
			int id = temp.id;
			if(!((MEMORY_SIZE-at) < size))  // when there is enough memory
			{
				thread_message[id] = at;   // return the index of current avaliable memory
				at += size;   // uptade the current index
			}
			else
				thread_message[id] = -1;  // if not enough memory
			sem_post(&semlist[id]);  // semaphore up for given thread id
			until--; // uptade the while condition
			///////my code before reading document clearly, it looks for avaliable memory block for given size even if there is fragmentation so wrong code
			//for(int i = 0; i < size && size <= MEMORY_SIZE; i++) //for executable when i<size and  when size is not more than memory size 
			//{
			//	if(memory[i] != '0') // if there is a number other than 0 
			//		size = i + temp.size + 1;
			//}
			//if(size <= MEMORY_SIZE)
			//{
			//	at = size - temp.size;
			//	thread_message[id] = at;
			//}
			//else
			//	thread_message[id] = -1;
			//sem_post(&semlist[id]);
			//until--;
		}
	}

}

void * thread_function(void * id) 
{
	//This function will create a random size, and call my_malloc
	int ids = *(int*) id;
	int randomSize = rand() % (MEMORY_SIZE/6);
	randomSize++; //between 1 and memorysize/6
	my_malloc(ids,randomSize);
	//Block
	sem_wait(&semlist[ids]); // semaphore down until server allows
	//Then fill the memory with id's or give an error prompt
	if(thread_message[ids] < 0)  // if not enough memory
	{
		cout << ids << ": Not enough memory" << endl;
	}
	else // if there is enough memory
	{
		char c = '0' + ids;
		int start = thread_message[ids]; // starting index
		pthread_mutex_lock(&sharedLock);  // to access shared data
		for(int i = start; i < (start+randomSize); i++)
		{
			memory[i] = c;  // write the thread's id to the memory
		}
		pthread_mutex_unlock(&sharedLock); // unlock the other thread's acces of shared memory
	}
}

void init()	 
{
	pthread_mutex_lock(&sharedLock);	//lock
	for(int i = 0; i < NUM_THREADS; i++) //initialize semaphores
	{sem_init(&semlist[i],0,0);}
	for (int i = 0; i < MEMORY_SIZE; i++)	//initialize memory 
  	{char zero = '0'; memory[i] = zero;}
   	pthread_create(&server,NULL,server_function,NULL); //start server 
	pthread_mutex_unlock(&sharedLock); //unlock
}



void dump_memory() 
{
 // You need to print the whole memory array here.
	for(int i = 0; i < MEMORY_SIZE; i++)
	{
		cout << memory[i]<< "  " ;
	}
}

int main (int argc, char *argv[])
 {
	 srand (time(NULL));
 	//You need to create a thread ID array here
	 int threadIDs[NUM_THREADS];
	 for(int i =0; i < NUM_THREADS; i++)
	 {
		 threadIDs[i] = i;
	 }
 	init();	// call init

 	//You need to create threads with using thread ID array, using pthread_create()
	pthread_t threads[NUM_THREADS];
	for(int i = 0; i < NUM_THREADS; i++)
	{
		pthread_create(&threads[i],NULL,thread_function,&threadIDs[i]);
	}

 	//You need to join the threads
	for(int j = 0; j < NUM_THREADS; j++)
	{
		pthread_join(threads[j],NULL);
	}

 	dump_memory(); // this will print out the memory
 	
 	printf("\nMemory Indexes:\n" );
 	for (int i = 0; i < NUM_THREADS; i++)
 	{
 		printf("[%d]" ,thread_message[i]); // this will print out the memory indexes
 	}
 	printf("\nTerminating...\n");
 }