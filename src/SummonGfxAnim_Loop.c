#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"

// clang-format on

//! FE8U = 0x08080DCC
void SummonGfxAnim_Loop(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = 0;
        }
        else if (proc->frame == 12)
        {
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            exit = 0;
        }
        else if (proc->frame > 17)
        {
            Proc_Break(proc);
            exit = 1;
        }
        else
        {
            exit = 0;
        }

        if (exit)
        {
            return;
        }

        Decompress(gMapanimEventcall_20[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x4140);

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}
