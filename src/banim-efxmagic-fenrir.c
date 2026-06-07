#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08060B2C
void efxFenrirBG_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08060B48
void efxFenrirBG_Loop(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;
    gLCDControlBuffer.bgoffset[BG_1].x--;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}
