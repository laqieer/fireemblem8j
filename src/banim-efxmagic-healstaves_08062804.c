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



//! FE8U = 0x08061704
void efxLiveBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        // TODO: Is this the correct data type?
        SpellFx_WriteBgMapRaw(proc->anim, (u16 *)(tsaL + ret * 0x12c), (u16 *)(tsaR + ret * 0x12c));
    }
    else
    {
        if (ret == -1)
        {
            if (proc->unk29 == 0)
            {
                SpellFx_ClearBG1();
                SetDefaultColorEffects_();
            }

            BG_SetPosition(BG_1, 0, 0);
            gEfxBgSemaphore--;

            Proc_Break(proc);
        }
    }

    return;
}
