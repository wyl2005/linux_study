#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <sched.h>
#include <string.h>
#include <cstring>

static void *thread_fun(void *arg)
{
    int i = 1;
    printf("thread start!\n");

    while(1)
    {
        i++;
        printf("thread_fun run !!\n");
        sleep(1);
       // pthread_testcancel();
    }

    return (void *)0;
}

int main()
{
    void *ret = NULL;
    int iret = 0;

		pthread_t tid;
		int nRet = 0;
		int inher = 0;
		pthread_attr_t attr;
		pthread_attr_init(&attr);
		struct sched_param stSchedParam;

		if (0 != (nRet = pthread_attr_getinheritsched(&attr, &inher)))
		{
			printf("pthread_attr_getinheritsched failed! %s\n", strerror(nRet));
			return nRet;
		}

			pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

		//设置调度策略
		if (0 != (nRet = pthread_attr_setschedpolicy(&attr, SCHED_OTHER)))
		{
			printf("pthread_attr_setschedpolicy failed! %s\n", strerror(nRet));
			return nRet;
		}

#if 0
		stSchedParam.sched_priority = 1;
		if (0 != (nRet = pthread_attr_setschedparam(&attr, &stSchedParam)))
		{
			printf("pthread_attr_setschedParam failed! %s\n", strerror(nRet));
			return nRet;
		}
#endif
		pthread_create(&tid, &attr, &thread_fun, NULL);
		pthread_attr_destroy(&attr);

		
    sleep(3);
    pthread_cancel(tid);
    pthread_join(tid, &ret);
    printf("thread 3 exit code  \n");




    pthread_create(&tid, NULL, &thread_fun, NULL);
    sleep(3);
    pthread_cancel(tid);
    pthread_join(tid, &ret);
    printf("thread 4 exit code \n");

    return 0;
}
