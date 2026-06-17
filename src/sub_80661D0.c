#include "global.h"

int cw_8056130();
int cw_8056214();

void sub_80661D0(void)
{
    cw_8056130();
    *(int *)0x0201774C -= 1;
    cw_8056214();
}
