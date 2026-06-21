#include "global.h"

extern u8 data_08A9D688[];

int cw_8002BCC();

int sub_80B06B4(int a0)
{
    return cw_8002BCC((void *)data_08A9D688, a0);
}
