#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void EkrDZ_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc)
{
    int val;

    if (proc->timer == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }

    val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8);
    EfxChapterMapFadeOUT(val);

    if (CheckEkrDragonSkipTransfer(proc->anim) == false) {
        val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0, proc->timer, 8);

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x40);
            EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
            break;

        case EKR_DISTANCE_FAR:
            CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x20);
            EfxPalBlackInOut(PAL_BG(0), 4, 1, val);
            break;

        default:
            break;
        }
    }

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
