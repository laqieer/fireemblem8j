#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

extern EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20];

extern CONST_DATA struct ProcCmd ProcScr_EkrDK[];

void EkrdragonDemonking_Loop(struct ProcEfxDKfx * proc)
{
    int time;
    s16 val1, val2;

    EkrDemonkingObj_GetShakeOffset(&val1, &val2, proc->timer, 0);
    EkrDemonkingObj_SetBgOffset(val1, val2);

    ++proc->timer;
    
    time = proc->timer;
    if (time == 480) {
        StartPalFade(Pal_AllBlack, 0x17, 0xF0, proc);
        StartPalFade(Pal_AllBlack, 0x06, 0xF0, proc);
    }

    if (Proc_Find(ProcScr_EkrdragonDemonkingobj_1) == NULL) {
        EkrDemonkingObj_SetBgOffset(0, 0);
        Proc_Break(proc);
    }
}
