#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void efxSPDQuake_Loop(struct ProcEfxSpdQuake *proc)
{
    const s16 * vecs = proc->vecs;
    s16 dx = vecs[proc->timer * 2 + 0];
    s16 dy = vecs[proc->timer * 2 + 1];
    struct Anim *anim;

    anim = gAnims[0];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[1];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[2];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[3];
    anim->xPosition += dx;
    anim->yPosition += dy;

    gLCDControlBuffer.bgoffset[2].y -= dx;
    gLCDControlBuffer.bgoffset[2].x -= dy;

    if (Get0201FAC8() == 0) {
        Proc_Break(proc);
        return;
    }

    if (Get0201FAC8() == 2) {
        proc->vecs = gEfxQuakeVecs2;
        proc->timer = 0;
        Set0201FAC8(3);
        return;
    }

    ++proc->timer;
    if (vecs[proc->timer * 2 + 0] == 0x7FFF)
        proc->timer = 0;
}
