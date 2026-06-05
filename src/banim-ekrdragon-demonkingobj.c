#include "gbafe.h"



/* This function is unusable */
void EkrDemonkingObj_UpdateBgPosLoop(struct Proc08801800 *proc)
{
    EkrDemonkingObj_SetBgPosition(-gUnk_76 + gEkrBgPosition, -gUnk_77);
    EkrDragonTmCpyExt(-gUnk_76 + gEkrBgPosition, -gUnk_77);
    proc->timer++;
}

void EkrDemonkingObj_GetShakeOffset(s16 *out1, s16 *out2, int val1, int val2)
{
    s16 *ref = gEkrdragonDemonkingobj_2[val2];
    int ret = (val1 % ref[0]) * 2 + 1;
    *out1 = ref[ret];
    *out2 = ref[ret + 1];
}

void EkrDemonkingObj_SetBgOffset(int a, int b)
{
    gUnk_76 = a;
    gUnk_77 = b;
}

void EkrDemonkingObj_RevealInit(void)
{
    Decompress(Tsa_Ekrdk_0, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    EkrDemonkingObj_SetBgPosition(gEkrBgPosition, 0);
    SetBlackPal(0x1);
    EnablePaletteSync();
    CpuFill16(0, (void *)(BG_VRAM + 0x2000), 0x1000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SetBlendConfig(0x1, 0x0, 0x10, 0x0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 1);
}

void EkrDemonkingObj_RevealTimerInit(struct Proc08801810 *proc)
{
    proc->timer1 = 0;
    proc->timer2 = 0;
}

void EkrDemonkingObj_RevealLoop(struct Proc08801810 *proc)
{
    if (++proc->timer1 == 0x18) {
        EkrDemonkingObj_StartDissolveProc(proc->timer2, proc);
        proc->timer1 = 0;
        
        if (++proc->timer2 > 0xF)
            Proc_Break(proc);
    }
}

void EkrDemonkingObj_RevealOnEnd(void)
{
    SpellFx_ClearBG1();
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}
