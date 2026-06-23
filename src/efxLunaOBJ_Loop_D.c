#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

void efxLunaOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = Interpolate(INTERPOLATE_SQUARE, 50, 0, proc->timer, 10);

    proc->unk30 = proc->unk30 + 0x400;

    hm = proc->unk30 / 0x100;

    sin = gSinLookup[hm];
    cos = gSinLookup[0x40 + hm];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 10)
    {
        proc->timer = 10;
    }

    if (++proc->terminator > 10)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
