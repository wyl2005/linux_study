
#include <stdio.h>
#define DUMP(func, call) \
    printf("Enter\n%p\n%p\n", func, call)

#define DUMP_EXIT(func, call) \
    printf("EXIT\n%p\n%p\n", func, call)
void __attribute__((__no_instrument_function__))
__cyg_profile_func_enter(void *this_func, void *call_site)
{
        DUMP(this_func, call_site);
}
void __attribute__((__no_instrument_function__))
__cyg_profile_func_exit(void *this_func, void *call_site)
{
        DUMP_EXIT(this_func, call_site);
}
main()
{
        puts("Hello World!");
        return 0;
}
