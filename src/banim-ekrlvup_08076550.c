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
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos1;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos2;

/**
 * section.data
 */

extern const u16 sEfxLvupPartsPos[];









void EkrLvup_Promo_WindowScroll1(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(4, 0x1000, 0, proc->timer, proc->index);
    if (++proc->timer > proc->index)
        Proc_Break(proc);
}
