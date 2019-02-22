#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void handler(int num) {
    int status;
    pid_t pid = waitpid(-1, &status, WNOHANG);

    if (WIFEXITED(status)){
        printf("child pid %d, exit with code: %d \n", pid, WEXITSTATUS(status));
    }

}

int main() {
    int child_pid;
    int pid;

    signal(SIGCHLD, handler);    

    if (pid = fork()) {
        // father
        child_pid = pid;
        printf("I am father, child_pid = %d \n", child_pid);
        
        //父进程不用等待，做自己的事情吧～   
        for (int i = 0; i < 10; i++) {   
            printf("Do parent things.\n");   
            sleep(1);   
        }   

        exit(0); 
    } else {
        // child
        printf("I am child \n");
        sleep(2);
        exit(0); 
    }
    
    printf("exit \n");
    return 0; 
}
