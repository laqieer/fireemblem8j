#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off

extern struct ProcCmd CONST_DATA ProcScr_efxSilence[];

//! FE8U = 0x08062E44
void efxBerserkBG_Loop(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gLCDControlBuffer.bgoffset[BG_1].y--;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        EkrDragonPalFade_End();

        anim->oamBase &= ~OAM0_WINDOW;

        anim->oam2Base &= ~OAM2_LAYER(3);
        anim->oam2Base |= OAM2_LAYER(2);

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}
