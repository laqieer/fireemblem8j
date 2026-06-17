#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "constants/video-banim.h"




void NewEfxStatusUnit(struct Anim *anim)
{
    struct Unit *unit;
    struct ProcEfxStatusUnit *proc;

    if (GetAnimPosition(anim) == EKR_POS_L)
        unit = &gpEkrBattleUnitLeft->unit;
    else
        unit = &gpEkrBattleUnitRight->unit;

    proc = Proc_Start(ProcScr_efxStatusUnit, PROC_TREE_3);

    proc->invalid = 0;
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_lut = gFrameLut_EfxStatusUnit;
    proc->debuff = unit->statusIndex;

    if (gEkrDebugModeMaybe == 1)
        proc->debuff = UNIT_STATUS_NONE;

    proc->debuf_bak = 0;
    proc->blue = 0;
    proc->green = 0;
    proc->red = 0;
    gpProcEfxStatusUnits[GetAnimPosition(anim)] = proc;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_L], &gFadeComponents[0], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_L], &gFadeComponents[0x30], 0x10);
        EfxCalcSplitedColorStep(&gFadeComponents[0], &gFadeComponents[0x30], (void *)&gFadeComponents[0x180], 0x10, 0x10);
    } else {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_R], &gFadeComponents[0x60], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_R], &gFadeComponents[0x90], 0x10);
        EfxCalcSplitedColorStep(&gFadeComponents[0x60], &gFadeComponents[0x90], (void *)&gFadeComponents[0x300], 0x10, 0x10);
    }
}
