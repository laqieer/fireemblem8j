#include "global.h"

extern u8 data_08A95AD8[];

int cw_8002C30();

void sub_80A4868(int a0)
{
    cw_8002C30((void *)data_08A95AD8, a0);
}
