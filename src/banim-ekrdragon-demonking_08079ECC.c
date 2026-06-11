#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





void EkrDragonTunk_Nop(void)
{
    return;
}

void NewEkrWhiteOUT(int a, int b, int c)
{
    struct ProcEkrWhiteOUT * proc;
    proc = Proc_Start(ProcScr_ekrWhiteOUT, PROC_TREE_VSYNC);
    proc->timer = 0;
    proc->max_time1 = a;
    proc->max_time2 = b;
    proc->max_time3 = c;

    gLCDControlBuffer.bldcnt.target1_bd_on = 0;
    gLCDControlBuffer.bldcnt.target2_bd_on = 0;
}

void EkrWhiteOutFadeIn(struct ProcEkrWhiteOUT * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->max_time1);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time1) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutDelay(struct ProcEkrWhiteOUT * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time2) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutFadeOut(struct ProcEkrWhiteOUT * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, proc->max_time3);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time3) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutOnEnd(struct ProcEkrWhiteOUT * proc)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = 1;
    gLCDControlBuffer.bldcnt.target2_bd_on = 1;
    EnablePaletteSync();
    Proc_Break(proc);
}
