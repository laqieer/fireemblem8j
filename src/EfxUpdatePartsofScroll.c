#include "global.h"
#include "ekrbattle.h"
#include "ekrlevelup.h"

void EfxUpdatePartsofScroll(void)
{
    u32 i;

    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpBg2ScrollOffsetTable2
               : gpBg2ScrollOffsetTable1;

    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpBg1ScrollOffsetList2
               : gpBg1ScrollOffsetList1;

    for (i = 0; i < 0xA0; i++)
    {
        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            *buf1++ = gEkrLvupScrollPos1;
            *buf2++ = gEkrLvupScrollPos1;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = gEkrLvupScrollPos2;
            *buf2++ = gEkrLvupScrollPos2;
            continue;
        }
    }
}
