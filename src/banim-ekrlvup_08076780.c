#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/**
 * section.ewramdata
 */

extern EWRAM_OVERLAY(banim) struct ProcEkrLevelup * gpProcEkrLevelup;
extern EWRAM_OVERLAY(banim) u32 gEkrlvup_0[8];
extern EWRAM_OVERLAY(banim) ProcPtr gpProcEfxPartsofScroll;
extern EWRAM_OVERLAY(banim) struct Unit * gpEkrLvupUnit;
extern EWRAM_OVERLAY(banim) struct BattleUnit * gpEkrLvupBattleUnit;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupPreLevel;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupPostLevel;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern EWRAM_OVERLAY(banim) u16 gEkrLvupPostStatus[EKRLVUP_STAT_MAX];
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos1;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos2;

/**
 * section.data
 */

extern const u16 sEfxLvupPartsPos[];









void EkrLvup_PutWindowOffScreen(struct ProcEkrLevelup *proc)
{
    int i, pos, pal;

    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);

    pos = Interpolate(INTERPOLATE_LINEAR, 0, -EKR_LVUP_UI_BASE, proc->timer, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 8, 0, proc->timer, 8);

    gFaces[0]->yPos = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 2, 4, pal);
    EfxPalBlackInOut(PAL_BG(0), 0x13, 0xC, pal);
    EnablePaletteSync();

    /* Maybe some debug routine? */
    for (i = 0; i < 8; i++);

    if (++proc->timer > 8) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
