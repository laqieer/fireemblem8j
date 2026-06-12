#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

extern EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20];

extern CONST_DATA struct ProcCmd ProcScr_EkrDK[];

/* prototypes for same-file helpers called by this run */
void NewEkrWhiteOUT(int a, int b, int c);

void EkrDragonTunk_WhiteOutSfx(void)
{
    NewEkrWhiteOUT(3, 2, 3);
    PlaySFX(0x147, 0x100, 0x78, 0x0);
}
