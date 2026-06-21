#include "global.h"

extern u8 data_085D3FC4[];

int cw_8002BCC();

int sub_804944C(int a0)
{
    return cw_8002BCC((void *)data_085D3FC4, a0);
}
