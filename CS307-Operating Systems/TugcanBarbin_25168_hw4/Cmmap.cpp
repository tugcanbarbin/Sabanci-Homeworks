#include <stdio.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(){
    int fd = open ("loremipsum.txt", O_RDWR); /* Open the file for reading and writing. */
    struct stat s;
    size_t size;
    int status = fstat(fd, &s);
    size = s.st_size;

    char *ptr = (char*)mmap(0,size,
        PROT_READ|PROT_WRITE,MAP_SHARED,
        fd,0);
    if(ptr == MAP_FAILED){
        printf("Mapping Failed\n");
        return 1;
    }
    close(fd);
	
	char ch;
	int counter = 0;
	size_t i;
	for(i=0; i<=size; i++)
	{
		ch = ptr[i];
		if(ch == 'a')
			counter++;
	}
	printf("There are ");
	printf("%d", counter);
	printf(" 'a' characters in this file.\n");

	status=munmap(ptr,size);
	if(status!=0)
	{
		printf("Unmapping Failed\n");
		return 1;
	}
	return 0;
}