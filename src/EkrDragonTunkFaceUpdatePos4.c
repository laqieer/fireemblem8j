#include "global.h"
#include "gbafe.h"

void EkrDragonTunkFaceUpdatePos4(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer == 4) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
