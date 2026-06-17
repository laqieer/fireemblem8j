#include "global.h"

void *sub_8002BCC();

void sub_80BCD5C(int a)
{
    *(int *)((char *)sub_8002BCC((void *)0x08AC0EE0) + 0x58) = a;
}
