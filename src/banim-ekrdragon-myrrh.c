#include "gbafe.h"



void EkrMyr_ReturnToLoli(struct ProcEkrDragon * proc)
{
    struct Anim * anim = proc->anim;
    struct BattleAnim * banim = banim_data;

    if (GetEfxHp(2 * gEfxHpLutOff[GetAnimPosition(anim)] + GetAnimPosition(anim)) <= 0) {

        /* Transform from dragon to loli */
        proc->timer = 0;
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        gEkrSpellAnimIndex[0] = -1;
        Proc_Break(proc);
        return;
    }

    EfxPlaySE(SONG_DD, 0x100);
    M4aPlayWithPostionCtrl(SONG_DD, anim->xPosition, 1);
    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_EXIT - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    Proc_Break(proc);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPal_Banim);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
}

void EkrMyr_WaitForReturnEnd(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);

        if (GetAnimPosition(anim) == EKR_POS_L)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        else
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);

        Proc_Break(proc);
    }
}
