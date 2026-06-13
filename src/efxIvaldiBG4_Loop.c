#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x08065CA0
void efxIvaldiBG4_Loop(struct ProcEfxBG * proc)
{
    int ret;

    proc->unk3C = (proc->unk3C + 24) & 0xff;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, proc->unk34, proc->unk3C);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (ret >= 0)
    {
        u16 * buf;
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        if (gEkrDistanceType == 0)
        {
            LZ77UnCompWram(*(tsaL + ret), gEkrTsaBuffer);
        }
        else
        {
            LZ77UnCompWram(*(tsaR + ret), gEkrTsaBuffer);
        }

        buf = gEkrTsaBuffer;

        if (GetAnimPosition(proc->anim) == 0)
        {
            EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 32, 1, 0x100);
        }
        else
        {
            EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 32, 1, 0x100);
        }

        BG_EnableSyncByMask(BG1_SYNC_BIT);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}
