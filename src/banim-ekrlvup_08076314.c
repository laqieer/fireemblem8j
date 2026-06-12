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
extern EWRAM_OVERLAY(banim) struct Unit * gpEkrLvupUnit;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupPreLevel;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos1;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos2;

/**
 * section.data
 */

extern const u16 sEfxLvupPartsPos[];









void EkrLvup_PutWindowOnScreen(struct ProcEkrLevelup *proc)
{
    int a, b, c, d, pos, pal;

    a = proc->unk_44;
    b = proc->unk_48;
    c = proc->unk_4C;
    d = proc->unk_50;

    LIMIT_AREA_(a, 0, 8);
    LIMIT_AREA_(b, 0, 8);
    LIMIT_AREA_(c, 0, 8);
    LIMIT_AREA_(d, 0, 8);

    proc->unk_44++;
    proc->unk_48++;
    proc->unk_4C++;
    proc->unk_50++;

    pos = Interpolate(INTERPOLATE_LINEAR, -EKR_LVUP_UI_BASE, 0, a, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 0, 8, b, 8);

    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, c, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, d, 8);

    gFaces[0]->yPos = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 2, 4, pal);
    EfxPalBlackInOut(PAL_BG(0), 0x13, 0xC, pal);
    EnablePaletteSync();

    if (++proc->timer > 0x14) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
