#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EfxSkillCommonBG_MoveCamToSelf(struct ProcEfxSkill *proc)
{
    int val = EfxGetCamMovDuration();

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (proc->timer == (val + 0xA))
        Proc_Break(proc);
}
