#include "global.h"

extern u8 data_08A9D978[];

int cw_8002C30();

void sub_80B0E88(int a0)
{
    cw_8002C30((void *)data_08A9D978, a0);
}
