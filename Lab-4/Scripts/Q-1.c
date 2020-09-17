/*
Author: Kalki Bhavsar
Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
Enrollment Number: AU1841029

Question 1:
Create one child process and make sure that child process runs first and then parent
executes and vice versa (if it is possible). Print appropriate messages for validating it.

*/

#include <stdlib.h> 
#include <stdio.h>
#include <sys/types.h> 
#include <sys/wait.h> 
#include <unistd.h> 
int main() 
{ 
    // Fork returns process id of the child process
    
    //Create a child process
    pid_t child_process_pid = fork(); 
  
    // If the current process is the parent process,
    //then goto child process block and
    // execute instructions of child process block
    if (child_process_pid > 0) {
        wait(NULL);
        printf("\nParent process is created...\n");
        system("date");
        printf("\nInside parent process, \t Parent PID: %d \t and Child PID: %d\n", getppid(), getpid());
        printf("\nParent process is finished and child is terminated...\n");
        exit(1);  
    	
    }
  
    // If the current process is the child process 
    else if(child_process_pid == 0)  {
        printf("\nChild process is created ...\n");
        system("date");
        printf("\nInside child process, \t Parent PID: %d \t and Child PID: %d\n", getpid(), child_process_pid);
        sleep(100);
        printf("\nChild process is finished...\n");
        exit(1);
     }else{
        printf("\n\nError occured...\n");
     }
  
    return 0; 
} 