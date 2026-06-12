#include "global.h"
#include "gbafe.h"

void ekrDispUPMain(struct ProcEkrDispUP *proc)
{
    int val0, iy, height, map_idx, ix1;
    int ix2 = 15; // for matching

    if (proc->asnyc == true)
        return;

    if (proc->sync != false)
        return;

    val0 = (proc->y << 0x10) >> 0x13;
    iy = val0 << 5;
    if (iy < 0)
        iy = 0;

    height = val0 + 7;
    if (height > 6)
        height = 6;

    map_idx = 30 * (6 - height);

    if (gEkrDistanceType >= 0)
    {
        if (gEkrDistanceType <= 2)
            ix1 = 0;
        else
            goto label;
    }
    else
    {
        ix1 = 0; // for matching, can be any value
    label:
        ix1 = 15;
    }

    FillBGRect(gBG0TilemapBuffer, 30, 7, 0, 128);

    if (height > 0) {
        if (proc->unk4C == 0) { 
            EfxTmCpyBG(&gBanimmisc_0[map_idx], &gBG0TilemapBuffer2D[iy][ix1], 15, height, -1, -1);
            EfxTmReplacePal(&gBG0TilemapBuffer2D[iy][ix1], 15, height, 2, 128);
        }

        if (proc->unk50 == 0) {
            EfxTmCpyBG(&gBanimmisc_1[map_idx], &gBG0TilemapBuffer2D[iy][ix2], ix2, height, -1, -1);
            EfxTmReplacePal(&gBG0TilemapBuffer2D[iy][ix2], 15, height, 3, 128);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
