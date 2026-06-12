#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void Fill16_EkrTsaBuffer(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gEkrTsaBuffer;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}
