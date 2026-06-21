#include "global.h"

extern u8 data_085E06F8[];
int cw_8002EAC();
int sub_8050294(int a0)
{
    return cw_8002EAC(a0, (void *)data_085E06F8);
}
