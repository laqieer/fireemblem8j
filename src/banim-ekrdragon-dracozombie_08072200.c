#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void EkrDZ_CustomBgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
