#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"

void EfxPartsofScroll2Main(ProcPtr proc)
{
    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpBg2ScrollOffsetTable2
               : gpBg2ScrollOffsetTable1;

    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpBg1ScrollOffsetList2
               : gpBg1ScrollOffsetList1;

    u32 i = 0;

    for (; i < 0xA0; i++)
    {
        s16 * src = gEfxlvup_1;
        src = src - 0x28;

        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            int val2 = (s16)((src[i] * gEkrLvupScrollPos1) >> 0xC);

            if (i + val2 < 0x2F)
                val2 = -0x20;
            else if (i + val2 >= 0x52)
                val2 = -0x20;

            *buf1++ = val2;
            *buf2++ = val2;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }
    }
}
