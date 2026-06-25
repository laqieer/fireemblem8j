#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

void efxLunaOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = 50;

    proc->unk30 = proc->unk30 + 0x200;

    hm = proc->unk30 / 0x100;

    sin = gSinLookup[proc->unk30 / 0x100];
    cos = gSinLookup[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 60)
    {
        proc->timer = 60;
    }

    if (++proc->terminator > 60)
    {
        proc->timer = 0;
        proc->terminator = 0;

        anim->pScrStart = AnimScr_EfxLuna2;
        anim->pScrCurrent = AnimScr_EfxLuna2;
        anim->timer = 0;

        Proc_Break(proc);
    }

    return;
}
