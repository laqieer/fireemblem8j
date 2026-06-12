#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EfxSkillCommonBG_MoveCamToOther(struct ProcEfxSkill *proc)
{
    struct Anim *anim = GetAnimAnotherSide(proc->anim);
    int val = EfxGetCamMovDuration();

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(anim, -1);
        return;
    }

    if (proc->timer == (val + 0xA)) {
        anim->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}
