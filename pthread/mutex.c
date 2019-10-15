#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

static pthread_mutex_t foo_mutex;

void foo_init()
{
    pthread_mutex_init(&foo_mutex, NULL);
}

void foo()
{
    int ret  = 0;
    //pthread_once(&foo_once, foo_init);

//    ret = pthread_mutex_destroy(&foo_mutex);
//    printf("destroy ret=%d, %s \n", ret, strerror(ret));

    ret = pthread_mutex_lock(&foo_mutex);
    printf("lock ret=%d, %s\n", ret, strerror(ret));
    
    ret = pthread_mutex_trylock(&foo_mutex);
    printf("try lock ret=%d, %s\n", ret, strerror(ret));
   /* Do work. */
    ret = pthread_mutex_unlock(&foo_mutex);
    printf("unlock ret=%d, %s\n", ret, strerror(ret));
    
    ret = pthread_mutex_unlock(&foo_mutex);
    printf("unlock ret=%d\n", ret);
}

int main(void)
{
    foo_init();
    
    foo();

}
