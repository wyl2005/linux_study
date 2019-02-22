#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>


int main() {
    int child_pid;
    int pid;

    if (pid = fork()) {
        // father
        child_pid = pid;
        printf("I am father, child_pid = %d \n", child_pid);
        sleep(5);
        exit(0); 
    } else {
        // child
        printf("I am child \n");
        exit(0); 
    }
    
    printf("exit \n");
    return 0; 
}
