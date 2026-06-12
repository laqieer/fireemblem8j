#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

extern EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20];

extern CONST_DATA struct ProcCmd ProcScr_EkrDK[];

void EkrDemoKingAtkRavager_WaitHit(struct ProcEfxDKBody1 * proc)
{
    if (CheckEkrHitDone() == true)
        Proc_Break(proc);
}
