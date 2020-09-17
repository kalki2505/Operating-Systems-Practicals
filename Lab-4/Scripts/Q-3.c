/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 3:
Create one child process and make it a zombie. (Use sleep(time);)

*/

// This program demonstrates Zombie Process.  
// A child process becomes Zombie as parent is sleeping 
// when child process exits

#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h> 
int main() 
{ 
    // Fork returns process id of the current process
    
    //Create a child process
    pid_t child_process_pid = fork(); 
  
    // If the current process is the parent process 
    if (child_process_pid > 0) {
    	sleep(1000); 
    	printf("Parent process and Zombie process is killed now...\n");
    }
  
    // If the current process is the child process 
    else    {
    	printf("Child process is killed now...\n");

    	//When all the child process instructions are executed
    	// i.e child process is about to get terminated
    	//Zombie process is created since the parent process
    	//is still sleeping until 10 seconds...
    	printf("Zombie process is created...\n");
    }    
        
  
    return 0; 
} 