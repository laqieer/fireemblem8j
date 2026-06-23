#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/video-banim.h"

void sub_805DE74(struct ProcEfxBG * proc)
{
    int x;

    gLCDControlBuffer.bgoffset[BG_1].x =
        Interpolate(INTERPOLATE_LINEAR, 0, proc->frame, proc->timer, proc->terminator);

    if (GetAnimPosition(proc->anim) == POS_L)
        x = (gLCDControlBuffer.bgoffset[BG_1].x >> 3) + 30;
    else
        x = (gLCDControlBuffer.bgoffset[BG_1].x >> 3) - 1;

    FillBGRect(gBG1TilemapBuffer + TILEMAP_INDEX((x + 0) & 0x1F, 0), 1, 20, 1, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
    FillBGRect(gBG1TilemapBuffer + TILEMAP_INDEX((x + 1) & 0x1F, 0), 1, 20, 1, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
    FillBGRect(gBG1TilemapBuffer + TILEMAP_INDEX((x + 2) & 0x1F, 0), 1, 20, 1, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}
