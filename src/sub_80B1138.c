#include "global.h"

extern u8 data_08A9DA84[];

int cw_8002BCC();

int sub_80B1138(int a0)
{
    return cw_8002BCC((void *)data_08A9DA84, a0);
}
