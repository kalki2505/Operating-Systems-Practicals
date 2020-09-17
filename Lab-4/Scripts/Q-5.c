/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 5:
Using system call find:(Take input of file name from the user)
a) The last time the file was accessed.
b) The recent time the file was modified.
c) The permissions on the file

*/


#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h> 
#include <string.h>
int main() 
{ 
	//Declare variables
	char filename[100];
	char command_a[200] = "";
	char command_b[200] = "";
	char command_c[200] = "";

	// Get the name of the file
	printf("\nEnter the file name: ");
	gets(filename);
	//printf("The entered file name is \"%s\"...\n", &filename);

	FILE *fptr;
	if ((fptr = fopen(filename, "r")) == NULL) {
		printf("\n\n OOPS! :( File does not exist...");
		// Program exits if file pointer returns NULL i.e file does not exist.
		exit(1);
	}

	//Get the last access time for the file and rewrite in "Q-5-output.txt"
	//The contents of file "Q-5-output.txt" will be overwritten...
	// %x -> time of last access, human-readable 
	strcat(command_a, " stat -c %x ");
	strcat(command_a, filename);
	strcat(command_a, " > \"Q-5-output.txt\"");
	//printf("%s\n", command_a);
	system(command_a);


	//Get the last modification time for the file and append in "Q-5-output.txt"
	// %y -> time of last data modification, human-readable
	strcat(command_b, " stat -c %y ");
	strcat(command_b, filename);
	strcat(command_b, " >> \"Q-5-output.txt\"");
	//printf("%s\n", command_b);
	system(command_b);


	//Get the permission detail for the file and append in "Q-5-output.txt"
	// %A -> access rights in human readable form
	strcat(command_c, " stat -c %A ");
	strcat(command_c, filename);
	strcat(command_c, " >> \"Q-5-output.txt\"");
	//printf("%s\n", command_c);
	system(command_c);


	//Print the output from the file in the terminal
	printf("\n\n\t\t\t****FILE STATS*****\n");
	char row[100];
	char label[3][30] = {"File Last access time: ", "File Last modification time: ", "File Permissions: "};
	if ((fptr = fopen("Q-5-output.txt", "r")) == NULL) {
		printf("\n\n OOPS! :( Some error occured... \nRerun the program again.");
		// Program exits if file pointer returns NULL.
		exit(1);
	}
	int i = 0;
	while (fgets(row, sizeof(row), fptr)) { 
		printf("%s %s", label[i], row); 
		i++;
	} 

	fclose(fptr);

	return 0; 

  
} 