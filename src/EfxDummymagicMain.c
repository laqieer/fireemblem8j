#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void EfxDummymagicMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1)
    {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        return;
    }

    if (time == 10)
    {
        if ((GetAnimNextRoundType(animc) << 16) != 0xFFFF0000)
            animc->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}
