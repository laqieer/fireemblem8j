#include "global.h"

extern u8 data_08A13438[];

int cw_8002DEC();

int sub_807C37C(void)
{
    return cw_8002DEC((void *)data_08A13438) != 0;
}
