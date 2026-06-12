#include "gbafe.h"



void EkrMyr_PrepareBanimfx(struct ProcEkrDragon * proc)
{
    struct BattleAnim * banim = banim_data;
    struct Anim * anim = proc->anim;
    proc->timer = 0;

    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_INTRO - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPal_Banim);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
    Proc_Break(proc);
}
