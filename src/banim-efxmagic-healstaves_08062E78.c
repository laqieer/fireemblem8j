#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08061D78
void efxReserveBG_Loop(struct ProcEfxBG * proc)
{
    static const u16 songIds[] = {
        0x010E,
        0x010F,
        0x010E,
        0x010F,
    };

    static const u16 positions[] = {
        160,
        56,
        128,
        40,
    };

    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        int songId;
        int location;

        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(anim, *(tsaL + ret), *(tsaR + ret));

        songId = songIds[ret];
        location = positions[ret];
        PlaySFX(songId, 0x100, location, 0);
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
