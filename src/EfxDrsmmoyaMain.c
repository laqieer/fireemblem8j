#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "proc.h"

void sub_807069C(struct Anim * anim);
ProcPtr sub_8070794(struct Anim * anim, int a);
void sub_807083C(struct Anim * anim, ProcPtr proc, int a2, int a3, int a4);

void EfxDrsmmoyaMain(struct ProcEfx * proc)
{
    struct Anim * other = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_807069C(other);

        if (CheckRoundCrit(proc->anim) == 1)
            PlaySFX(0x2E8, 0x100, proc->anim->xPosition, 1);
        else
            PlaySFX(0x2E3, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 0x1A)
    {
        sub_807083C(proc->anim, sub_8070794(proc->anim, 0x41), 0xA, 0x2D, 0xA);
        NewEfxRestWINH_(proc->anim, 0x41, 1);
    }
    else if (proc->timer == 0x6F)
    {
        struct Anim * a0 = gAnims[GetAnimPosition(proc->anim) * 2];
        struct Anim * a1 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        a0->state3 |= 0x40;
        a1->state3 |= 0x40;
        Proc_Break(proc);
    }
}
