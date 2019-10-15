#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

static void *thread_fun(void *arg)
{
    int i = 1;
    printf("thread start!\n");

    while(1)
    {
        i++;
        printf("thread_fun run !!\n");
        sleep(1);
        pthread_testcancel();
    }

    return (void *)0;
}

int main()
{
    void *ret = NULL;
    int iret = 0;

    pthread_t tid;

    pthread_create(&tid, NULL, &thread_fun, NULL);
    sleep(3);
    pthread_cancel(tid);
    pthread_join(tid, &ret);
    printf("thread 3 exit code %d \n", (int)ret);

    pthread_create(&tid, NULL, &thread_fun, NULL);
    sleep(3);
    pthread_cancel(tid);
    pthread_join(tid, &ret);
    printf("thread 4 exit code %d \n", (int)ret);

    return 0;
}
