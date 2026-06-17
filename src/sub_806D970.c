#include "global.h"

int cw_8004F0C();

void sub_806D970(int proc)
{
    cw_8004F0C(*(int *)(proc + 0x60));
    *(int *)0x0201774C -= 1;
}
