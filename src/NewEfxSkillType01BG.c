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

void NewEfxSkillType01BG(struct Anim *anim)
{
    struct ProcEfxSkill *proc;
    proc = Proc_Start(ProcScr_efxSkillType01BG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    proc->time_lut = FrameLut_EfxSkill;
    proc->tsa_lut = TsaLut_EfxSkill;
    proc->tsa_cur = TsaLut_EfxSkill;
    proc->img_lut = ImgLut_EfxSkill;
    proc->pal_lut = PalLut_EfxSkill;

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }

    EfxSkillSetAnimState(proc->anim);
    EfxSkillSetAnimState(GetAnimAnotherSide(proc->anim));

    PlaySFX(0x3D1, 0x100, proc->anim->xPosition, 1);
}
