#include "global.h"

extern u8 data_08A9548C[];

void *Proc_Start();

void sub_80A2E4C(int a)
{
    *(int *)((char *)((void *(*)(void *))Proc_Start)((void *)data_08A9548C) + 0x58) = a;
}
