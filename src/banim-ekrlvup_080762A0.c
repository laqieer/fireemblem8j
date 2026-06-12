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









void EkrLvup_SetBgs(struct ProcEkrLevelup *proc)
{
    SetPrimaryHBlankHandler(EkrLvupHBlank);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    EnablePaletteSync();

    Proc_Break(proc);
}
