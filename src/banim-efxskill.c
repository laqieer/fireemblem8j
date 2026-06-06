#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void NewEfxSkillCommonBG(struct Anim *anim, u8 debuff)
{
    struct ProcEfxSkill *proc;
    proc = Proc_Start(ProcScr_efxSkillCommonBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->caught_debuff = debuff;

    proc->time_lut = FrameLut_EfxSkill;
    proc->tsa_lut = TsaLut_EfxSkill;
    proc->tsa_cur = TsaLut_EfxSkill;
    proc->img_lut = ImgLut_EfxSkill;
    proc->pal_lut = PalLut_EfxSkill;

    SpellFx_SetSomeColorEffect();

    anim = GetAnimAnotherSide(proc->anim);
    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void EfxSkillCommonBG_PlaySfx(struct ProcEfxSkill *proc)
{
    PlaySFX(0x3D1, 0x100, proc->anim->xPosition, 1);
    Proc_Break(proc);
}
