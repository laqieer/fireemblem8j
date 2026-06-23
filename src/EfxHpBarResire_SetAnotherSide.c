#include "global.h"
#include "efxbattle.h"
#include "ekrbattle.h"

void EfxHpBarResire_SetAnotherSide(struct ProcEfxHpBar * proc)
{
    s16 off_this, off_next;

    if (++proc->timer <= proc->cur)
        return;

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)];
    off_next = off_this + 1;

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_other));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_other));

    proc->timer = 0;
    proc->cur = proc->this;
    proc->timer2 = 0;
    proc->finished = false;

    if (proc->this == proc->next)
        proc->finished = true;

    if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    Proc_Break(proc);
    gEkrHitNow[GetAnimPosition(proc->anim_main_other)] = 2;
}
