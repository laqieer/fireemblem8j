#include "global.h"

extern u8 data_08AC0EE0[];

void *Proc_Start();

void sub_80BCD5C(int a)
{
    *(int *)((char *)((void *(*)(void *))Proc_Start)((void *)data_08AC0EE0) + 0x58) = a;
}
