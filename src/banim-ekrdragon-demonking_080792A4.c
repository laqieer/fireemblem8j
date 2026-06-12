#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

extern EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20];

extern CONST_DATA struct ProcCmd ProcScr_EkrDK[];

/* prototypes for same-file helpers called by this run */
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc);

void EkrDemoKingBodyHold(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}
