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









void EkrLvup_InitPalette(struct ProcEkrLevelup *proc)
{
    if (++proc->timer > EKR_LVUP_UI_BASE) {

        proc->timer = 0;

        proc->unk_44 = 0;
        proc->unk_48 = 0;
        proc->unk_4C = -2;
        proc->unk_50 = -4;

        CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);

        Proc_Break(proc);
    }
}
