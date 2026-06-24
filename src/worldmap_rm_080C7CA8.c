#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

extern u16 CONST_DATA Sprite_WmPlaceDot[];

void PutWmDotSprite(struct ProcWmPlaceDot * proc)
{
    s16 xOam1;
    s16 yOam0;
    int palId;
    s16 x;
    s16 y;

    GmapRm_GetPosition(&x, &y);

    xOam1 = -(x + 4) + proc->x;
    yOam0 = -(y + 4) + proc->y;

    if (((unsigned)((xOam1 + 0x20) << 0x10) <= 0x1100000) && ((u16)(yOam0 + 0x20) < 0xc1))
    {
        if ((proc->unk_2a & 1) != 0)
        {
            palId = 5;
        }
        else
        {
            palId = 4;
        }

        PutSprite(0xb, xOam1, yOam0, Sprite_WmPlaceDot, proc->unk_2c + (palId << 0xc | 0x19e) + 0xc00);
    }

    return;
}
