#include <stdio.h>
#include <stdlib.h>
int main ()
{
	char file_name[25] = "loremipsum.txt";
	char ch;
	int counter = 0;
	FILE * filepointer;
	filepointer = fopen(file_name, "r");
	/*while(ch = getc(filepointer) == 'a')
		counter++;*/
	while ( 1 )
   {
	  ch = fgetc ( filepointer ) ; // reading the file
     if ( ch == EOF )
	  break ;
	 if(ch == 'a')
		 counter++ ;
   }
	printf("There are ");
	printf("%d",counter);
	printf(" 'a' characters in this file\n");
}