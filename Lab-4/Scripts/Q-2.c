/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 2:
Write a program that creates a child process which executes command “ls” , prints its
pid along with its parent pid. After that, Parent process should also print its pid and its
child pid.

*/

#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h> 
int main() 
{ 
    // Fork returns process id of the child process
    
    //Create a child process
    pid_t child_process_pid = fork(); 
  
    // If the current process is the parent process 
    if (child_process_pid > 0) {
        wait(NULL);
    	printf("\nInside parent process, \t Parent PID: %d \t and Child PID: %d\n", getpid(), child_process_pid);
    	printf("\nParent process is created...\n");
    }
  
    // If the current process is the child process 
    else  if (child_process_pid == 0)  {
    	printf("\nChild process is created and executing command \"ls\" ...\n");
        printf("\nInside child process, \t Parent PID: %d \t and Child PID: %d\n", getppid(), getpid());
    	system("echo " "; ls -x -1;");
    	printf("\nChild process is finished...\n");
    }   
    else{
        printf("\nError occured...\n");
    } 
        
  
    return 0; 
} 