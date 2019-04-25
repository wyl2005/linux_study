#include <stdio.h>
#include <stdlib.h>

int main()
{
    char str[30] = "203038 0 9This is test";
    char *ptr;
    long ret;

    ret = strtol(str, &ptr, 10);
    printf("number:%ld\n", ret);
    printf("string:|%s|\n", ptr);
    
    int a = 0;
    a= atoi(str);
    printf("a=%d\n", a);    
}
