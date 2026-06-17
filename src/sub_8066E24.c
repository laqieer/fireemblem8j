#include "global.h"

int cw_8056130();
int cw_8056214();

void sub_8066E24(void)
{
    cw_8056130();
    *(int *)0x0201774C -= 1;
    cw_8056214();
}
