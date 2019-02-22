#include <stdio.h>
#include <unistd.h>
#include <sys/epoll.h>
#include <errno.h>
#include <string.h>


int main() {
    struct epoll_event ev;
    const int MAXEVENTS = 1024;
    struct epoll_event events[MAXEVENTS];
    int ret, pid;
    int pipe_fd[2];

    if ((ret = pipe(pipe_fd)) < 0) {
        printf("pipe error: %s", strerror(errno));
        return -1;
    }
        
    ev.data.fd = pipe_fd[0];
    ev.events = EPOLLIN | EPOLLET;
    int epfd = epoll_create(MAXEVENTS);        

    ret = epoll_ctl(epfd, EPOLL_CTL_ADD, pipe_fd[0], &ev);
    if (ret != 0)
    {
        printf("error \n"); 
    }


    if ((pid = fork()) > 0) { // father
        printf("father \n");
        int count = epoll_wait(epfd, events, MAXEVENTS, 5000);
        char read_buf[0x100];
        
        
        for(int i = 0; i < count; i++) {
            if((events[i].data.fd == pipe_fd[0]) && (events[0].events & EPOLLIN)) {
                int r_num = read(pipe_fd[0], read_buf, 0x100);
                printf("read num = %d, from pipe: %s \n", r_num, read_buf);
            }
        }
    } else if (pid == 0) { // child
        char write_buf[0x100];
        strcpy(write_buf, "1234");
        write(pipe_fd[1],  write_buf, 5);
        printf("child write pipe \n");
 
    } 
    return 0;
}
