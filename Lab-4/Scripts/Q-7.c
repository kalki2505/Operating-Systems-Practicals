/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 7:
Write a program in C display all the system environment variable values and arguments
passed to system

*/

#include <stdio.h> 
  
// Most of the C compilers support a third parameter to main which 
// store all envorinment variables 


int main(int argc, char *argv[], char * envp[]) 
{ 
    int i; 
	printf("\n\n\t\t\t**** ARGUMENTS PASSED *****\n\n");
  	for (i = 0; argv[i] != NULL; i++) 
        printf("\n%s", argv[i]); 
    
    printf("\n\n\t\t\t**** ENVIRONMENT VARIABLES *****\n\n");
    for (i = 0; envp[i] != NULL; i++) 
        printf("\n%s", envp[i]); 
    getchar(); 
    return 0; 
} 