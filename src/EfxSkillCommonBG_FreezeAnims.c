#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"



static inline void EfxSkillSetAnimState(struct Anim *anim)
{
    struct Anim *anim1, *anim2;

    anim1 = gAnims[GetAnimPosition(anim) * 2];
    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

    anim->state3 |= ANIM_BIT3_BLOCKING;
    anim->state |= ANIM_BIT_FROZEN;

    anim1->state3 |= ANIM_BIT3_BLOCKING;
    anim1->state |= ANIM_BIT_FROZEN;

    anim2->state3 |= ANIM_BIT3_BLOCKING;
    anim2->state |= ANIM_BIT_FROZEN;
}

void EfxSkillCommonBG_FreezeAnims(struct ProcEfxSkill *proc)
{
    EfxSkillSetAnimState(proc->anim);
    EfxSkillSetAnimState(GetAnimAnotherSide(proc->anim));
    Proc_Break(proc);
}
