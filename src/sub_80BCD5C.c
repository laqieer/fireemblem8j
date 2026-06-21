#include "global.h"

extern u8 data_08AC0EE0[];

void *sub_8002BCC();

void sub_80BCD5C(int a)
{
    *(int *)((char *)sub_8002BCC((void *)data_08AC0EE0) + 0x58) = a;
}
