#include "global.h"

extern u8 data_08BABA58[];

int cw_8002BCC();

int sub_80D2AD8(int a0)
{
    return cw_8002BCC((void *)data_08BABA58, a0);
}
