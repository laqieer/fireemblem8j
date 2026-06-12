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









/* prototypes for same-file helpers called by this run */
void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup *proc);

void EkrLvup_DrawNewLevel(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        proc->timer = 0;
        BanimDrawStatupAp(0xA0, 1, 0x84, 0x3C, 0, 0);
        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);
        EfxPlaySE(SONG_2CD, 0x100);
        M4aPlayWithPostionCtrl(SONG_2CD, 0x38, 0);
        Proc_Break(proc);
    } else {
        Proc_End(gpProcEfxPartsofScroll);
        gpProcEfxPartsofScroll = NewEfxPartsofScroll();
        proc->timer = 0;
        proc->index = 0;
        Proc_Break(proc);
    }
}
