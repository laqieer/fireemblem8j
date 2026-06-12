#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x08060FA4
void efxFenrirOBJ2Chiri_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 300, proc->timer, proc->terminator);

    int x = (ret * gSinLookup[proc->unk44]) >> 12;
    int y = (ret * gSinLookup[proc->unk44 + 64]) >> 12;

    anim->xPosition = x + proc->unk32;
    anim->yPosition = y + proc->unk3A;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
