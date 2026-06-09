#include "gbafe.h"



void EkrDemonkingObj_SetTilePixel(u16 *buf, int a)
{
    u16 *dst = &buf[a >> 2];
    *dst &= ~gEkrdragonDemonkingobj_0[a & 3];
    *dst |= gEkrdragonDemonkingobj_1[a & 3];
}
