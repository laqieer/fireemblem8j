#include "global.h"

extern u8 data_085BA2FC[];

int cw_8002DEC();

int sub_8012BDC(void)
{
    return cw_8002DEC((void *)data_085BA2FC) != 0;
}
