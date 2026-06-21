#include "global.h"

extern u8 data_08A9E4D0[];

int cw_8002BCC();

void sub_80B5224(int a0)
{
    cw_8002BCC((void *)data_08A9E4D0, a0);
}
