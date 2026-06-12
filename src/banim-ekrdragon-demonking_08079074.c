#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

extern EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20];

extern CONST_DATA struct ProcCmd ProcScr_EkrDK[];

/* prototypes for same-file helpers called by this run */
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc);
void EkrDragonSetBgAndFrontPos(s16 x, s16 y);

void EkrDemoKingAtkRavager_Lunge(struct ProcEfxDKBody1 * proc)
{
    s16 val1;
    s16 val2;
    u32 val3;
    
    GetAnimAnotherSide(proc->fxproc->anim);
    
    val1 = 0;
    val2 = 0;

    val3 = proc->timer - 0x12;
    if (val3 <= 0x27) {
    do {
        EkrDemonkingObj_GetShakeOffset(&val1, &val2, proc->unk64, 1);
        EkrDemonkingObj_SetBgOffset(val1, val2);
        EkrDragonSetBgAndFrontPos(val1, val2);
        proc->unk64++;
    }while(0);
    }

    val1 += gEkrBgPosition;
    EkrDragonTmCpyExt(val1, val2);
    if (proc->timer > 0x1E) {
        gEkrXQuakeOff = -56;
        gEkrYQuakeOff = 16;
    } else {
        gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -56, proc->timer, 0x1E);
        gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0,  16, proc->timer, 0x1E);
    }

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        EkrDemonkingObj_SetBgOffset(0, 0);
        Proc_Break(proc);
    } else
        proc->timer++;
}
