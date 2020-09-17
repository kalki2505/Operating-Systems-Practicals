/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 4:
Find the pid of all the zombie processes and store it in a file.

*/


#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h>
#include <string.h> 
int main() 
{ 
	//Declaration
	char filename[100] = "Q-4-output.txt";

	/*										WITH SYSTEM CALL														*/
	//Get the output for command and rewrite in "Q-4-output.txt"
	//The contents of file "Q-4-output.txt" will be overwritten...
	char command[100] = "ps aux | awk '\"[Z]\" ~ $8 {print $2, $8}'";
	strcat(command, " > \"Q-4-output.txt\"");
	//printf("%s\n", command);
	system(command);   

	/*										WITHOUT SYSTEM CALL													*/
	//filename="/etc/";
	
	//Print the output 
	char row[100];
	FILE *fptr;
	if ((fptr = fopen(filename, "r")) == NULL) {
			printf("\n\n OOPS! :( Some error occured... \nRerun the program again.");
			// Program exits if file pointer returns NULL.
			exit(1);
	}
	printf("List of PID of Zombie Processes:\n");
	printf("\t PID \t Process code - Z\n");
	while (fgets(row, sizeof(row), fptr)) { 
			 printf("\t %s", row);       
	} 
	fclose(fptr);
	
	return 0; 
} 