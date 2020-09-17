/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 6:
Design a program in C to get specification of the machine

*/



#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h> 
#include <string.h>
int main() 
{ 
	//Declare variables
  //char command[] = "lshw >> \"Q-6-output.txt\"";
  //List the hardware using "lshw" command and save it in file "Q-6-output.txt"
	//printf("%s\n", command);
	//system(command);
	 
	
	//Print the output - HARDWARE DETAILS from the file in the terminal
	//system("clear");
	//printf("\n\n\t\t\t****HARDWARE DETAILS*****\n\n");     
  FILE *fptr;
  char ch;
/*
  if ((fptr = fopen("Q-6-output.txt", "r")) == NULL) {
      printf("\n\n OOPS! :( Some error occured... \nRerun the program again.");
      // Program exits if file pointer returns NULL.
      exit(1);
  }
  
  ch=fgetc(fptr);
  while(ch != EOF) { 
       printf("%c", ch); 
       ch=fgetc(fptr);
  } 

  fclose(fptr);
*/


  //Print the output - CPU DETAILS from the file in the terminal
  printf("\n\n\t\t\t**** CPU DETAILS*****\n\n");
  if ((fptr = fopen("/proc/cpuinfo", "rb")) == NULL) {
        printf("\n\n OOPS! :( Some error occured... \nRerun the program again.");
        // Program exits if file pointer returns NULL.
        exit(1);
    }
  ch=fgetc(fptr);
  while(ch != EOF) { 
       printf("%c", ch); 
       ch=fgetc(fptr);
  } 
  printf("\n\nCPU details displayed successfully...\n\n");


  return 0; 
} 