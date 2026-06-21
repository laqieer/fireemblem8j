#include "global.h"

extern u8 data_08A9CFC4[];

int cw_8002C30();

void sub_80AEB98(int a0)
{
    cw_8002C30((void *)data_08A9CFC4, a0);
}
