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



//! FE8U = 0x08061F78
void efxReserveBG2_Loop(struct ProcEfxBG * proc)
{
    int ret;

    struct Anim * procAnim = proc->anim;
    struct Anim * otherAnim = GetAnimAnotherSide(procAnim);

    struct Anim * anim3 = gEkrbattle_0[GetAnimPosition(procAnim)];

    if (anim3 != NULL)
    {
        anim3->oam2Base &= ~OAM2_LAYER(3);
        anim3->oam2Base |= OAM2_LAYER(1);
    }

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(otherAnim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg2cnt.priority = 2;
            gLCDControlBuffer.bg3cnt.priority = 3;

            procAnim->oam2Base &= ~OAM2_LAYER(3);
            procAnim->oam2Base |= OAM2_LAYER(2);

            if (anim3 != NULL)
            {
                anim3->oam2Base &= ~OAM2_LAYER(3);
                anim3->oam2Base |= OAM2_LAYER(2);
            }

            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}
