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

//! FE8U = 0x08062ED8
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc)
{
    struct Anim clone;

    struct Anim * anim = proc->anim;

    clone.xPosition = anim->xPosition;
    clone.yPosition = anim->yPosition;

    clone.pSpriteData = anim->pSpriteData;

    clone.oamBase = anim->oamBase & ~(OAM0_WINDOW);

    clone.oam2Base = anim->oam2Base;
    clone.oam2Base &= ~OAM2_LAYER(3);
    clone.oam2Base |= OAM2_LAYER(2);

    AnimDisplay(&clone);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}
