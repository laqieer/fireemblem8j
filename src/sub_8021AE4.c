#include "global.h"

extern u8 data_085C3950[];

int cw_8002DEC();

int sub_8021AE4(void)
{
    return cw_8002DEC((void *)data_085C3950) != 0;
}
