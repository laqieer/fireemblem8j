#include "global.h"

extern u8 data_08A9E2A0[];

int cw_8002C30();

int sub_80B4B34(int a0)
{
    return cw_8002C30((void *)data_08A9E2A0, a0);
}
