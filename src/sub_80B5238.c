#include "global.h"

void *cw_8002DEC();

void sub_80B5238(int a0)
{
    void *p = cw_8002DEC((void *)0x08A9E4D0);
    *(int *)((char *)p + 0x58) = a0;
}
