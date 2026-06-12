#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0806A0CC
void efxCrimsonEyeOBJFinishPiece_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = Interpolate(INTERPOLATE_LINEAR, 120, (s16)proc->unk32, proc->timer, proc->terminator);
    proc->anim2->yPosition = Interpolate(INTERPOLATE_LINEAR, 64, (s16)proc->unk3A, proc->timer, proc->terminator);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
