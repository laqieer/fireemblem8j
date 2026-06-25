#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

extern const s16 gLunaBgScrollOffsets[];

#define DISPLAY_HEIGHT 160

//! FE8U = 0x08063C40
void efxLunaSCR_Loop(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg2ScrollOffsetTable2 : gpBg2ScrollOffsetTable1;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg1ScrollOffsetList2 : gpBg1ScrollOffsetList1;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 16)
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
        else if (i < 112)
        {
            s16 val = gLunaBgScrollOffsets[i - 16] * proc->unk44 >> 12;

            if (val != 0)
            {
                if (i < 64)
                {
                    if (val < -112 + i)
                    {
                        val = -112 + i;
                    }
                }
                else
                {
                    if (val > 112 - i)
                    {
                        val = 112 - i;
                    }
                }
            }

            *bg2Scroll++ = val;
            *bg1Scroll++ = val;
        }
        else
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
    }

    return;
}
