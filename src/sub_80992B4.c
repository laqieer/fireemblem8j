#include "global.h"

void *cw_8002DEC();

void sub_80992B4(int a0)
{
    void *p = cw_8002DEC((void *)0x08A94430);
    if (p) *(int *)((char *)p + 0x58) = a0;
}
