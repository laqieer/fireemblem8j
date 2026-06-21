#include "global.h"

extern u8 data_08A9548C[];

void *sub_8002BCC();

void sub_80A2E4C(int a)
{
    *(int *)((char *)sub_8002BCC((void *)data_08A9548C) + 0x58) = a;
}
