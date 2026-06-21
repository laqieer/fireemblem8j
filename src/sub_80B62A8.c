#include "global.h"

extern u8 data_08A9E510[];

int cw_8002C30();

void sub_80B62A8(int a0)
{
    cw_8002C30((void *)data_08A9E510, a0);
}
