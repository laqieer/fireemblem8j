#include "global.h"

void *sub_8002BCC();

void sub_80A2E4C(int a)
{
    *(int *)((char *)sub_8002BCC((void *)0x08A9548C) + 0x58) = a;
}
