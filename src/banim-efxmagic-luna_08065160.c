#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08064060
void efxLunaOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = proc->unk44 * 0x2AAA;

    scr = AnimScr_EfxLuna1;
    anim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;

    anim->timer = 0;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(2);

    anim->xPosition = 256;
    anim->yPosition = 256;

    proc->unk32 = proc->anim->xPosition;
    proc->unk3A = proc->anim->yPosition;

    Proc_Break(proc);

    return;
}
