/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 4:
Find the pid of all the zombie processes and store it in a file.

*/
//This is to create zombie process to test....

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

    	printf("\nInside parent process, \t Parent PID: %d \t and Child PID: %d\n", getpid(), child_process_pid);
    	printf("Parent process is created...\n");
    	sleep(10);
    	printf("Parent process and Zombie Process is finished...\n");
    }
  
    // If the current process is the child process 
    else    {
    	printf("\nInside child process, \t Parent PID: %d \t and Child PID: %d\n", getppid(), getpid());
    	printf("Child process is finished...\n");
    	printf("Zombie process is created...\n");
    }    
        
  
    return 0; 
} 