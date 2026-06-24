#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

static inline void EfxSkillResetAnimState(struct Anim *anim)
{
    struct Anim *anim1, *anim2;

    anim1 = gAnims[GetAnimPosition(anim) * 2];
    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

    anim->state3 |= ANIM_BIT3_BLOCKEND;
    anim->state &= ~ANIM_BIT_FROZEN;

    anim1->state3 |= ANIM_BIT3_BLOCKEND;
    anim1->state &= ~ANIM_BIT_FROZEN;

    anim2->state3 |= ANIM_BIT3_BLOCKEND;
    anim2->state &= ~ANIM_BIT_FROZEN;
}

void EfxSkillType01BGMain(struct ProcEfxSkill *proc)
{
    int ret;

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, proc->time_lut);

    if (ret >= 0) {
        u16 **tsa = proc->tsa_lut;
        u16 **tsa_ = proc->tsa_cur;
        u16 **img = proc->img_lut;
        u16 **pal = proc->pal_lut;

        SpellFx_WriteBgMap(proc->anim, tsa[ret], tsa_[ret]);
        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        SpellFx_RegisterBgPal(pal[ret], 0x20);
        return;
    }

    if (ret != -1)
        return;

    SpellFx_ClearBG1();
    SetDefaultColorEffects_();

    EfxSkillResetAnimState(proc->anim);
    EfxSkillResetAnimState(GetAnimAnotherSide(proc->anim));

    Proc_Break(proc);
}
