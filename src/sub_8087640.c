#include "global.h"

extern u8 data_08A600B0[];

int cw_8002C30();

void sub_8087640(int a0)
{
    cw_8002C30((void *)data_08A600B0, a0);
}
