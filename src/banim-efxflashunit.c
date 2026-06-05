#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "hardware.h"
#include "bmlib.h"

#include "constants/video-banim.h"



void EfxFlashHPBarDelay(struct ProcEfxFlashing * proc)
{
    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashHPBarMain1(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(gPalEfxHpBarGreen, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(gPalEfxHpBarGreen, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
    }

    EnablePaletteSync();

    if (++proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashHPBarRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(gBanimmisc_10, gBanimFactionPal[EKR_POS_L], 0),
                      PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20); /* Why right? */
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(gBanimmisc_10, gBanimFactionPal[EKR_POS_R], 0),
                      PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
        else
            CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);
    }

    EnablePaletteSync();
    Proc_Break(proc);
}

void NewEfxHpBarColorChange(struct Anim * anim)
{
    struct ProcEfxHpBarColorChange * proc;
    gpProcEfxHpBarColorChange = proc = Proc_Start(ProcScr_efxHPBarColorChange, PROC_TREE_3);
    proc->anim = anim;
    proc->timer1 = 0;
    proc->frame1 = 0;
    proc->frame_lut1 = gFrameLut_EfxHPBarColorChange1;
    proc->unk54 = 0;
    proc->timer2 = 0;
    proc->frame2 = 0;
    proc->frame_lut2 = gFrameLut_EfxHPBarColorChange2;
    proc->unk58 = 0;
    proc->disabled = false;

    EfxSplitColor(
        gBanimmisc_10 + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufA,
        0x10);

    EfxSplitColor(
        gBanimmisc_11 + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufB,
        0x10);

    EfxCalcSplitedColorStep(
        gEfxSplitedColorBufA,
        gEfxSplitedColorBufB,
        gEfxSplitedColorBufC,
        0x10, 5);

    EfxSplitColor(
        gBanimmisc_10 + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufD,
        0x10);

    EfxSplitColor(
        gBanimmisc_11 + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufE,
        0x10);

    EfxCalcSplitedColorStep(
        gEfxSplitedColorBufD,
        gEfxSplitedColorBufE,
        gEfxSplitedColorBufF,
        0x10, 5);
}

void EndEfxHPBarColorChange(void)
{
    Proc_End(gpProcEfxHpBarColorChange);
}

void DisableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = true;
}

void EnableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = false;
}

void EfxHPBarColorChangeMain(struct ProcEfxHpBarColorChange * proc)
{
    int ret;
    u8 *buf1, *buf2;
    u16 *buf3;

    if (proc->disabled == true)
        return;

    ret = EfxAdvanceFrameLut(&proc->timer1, (s16 *)&proc->frame1, proc->frame_lut1);
    if (ret >= 0)
        proc->unk54 = ret;

    ret = EfxAdvanceFrameLut(&proc->timer2, (s16 *)&proc->frame2, proc->frame_lut2);
    if (ret >= 0)
        proc->unk58 = ret;

    if (gEkrGaugeHp[EKR_POS_L] <= 80)
    {
        buf1 = gEfxSplitedColorBufA;
        buf2 = gEfxSplitedColorBufB;
        buf3 = gEfxSplitedColorBufC;

        EfxDecodeSplitedPalette(
            PAL_OBJ(OBPAL_EFXHPBAR_L),
            (s8 *)gEfxSplitedColorBufA,
            (s8 *)gEfxSplitedColorBufB,
            (s16 *)gEfxSplitedColorBufC,
            0x10,
            proc->unk54,
            5);
    }
    else
        CpuFastCopy(gPalEfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(OBPAL_EFXHPBAR_L), 0x20);

    if (gEkrGaugeHp[EKR_POS_R] <= 80)
    {
        buf1 = gEfxSplitedColorBufD;
        buf2 = gEfxSplitedColorBufE;
        buf3 = gEfxSplitedColorBufF;

        EfxDecodeSplitedPalette(
            PAL_OBJ(OBPAL_EFXHPBAR_R),
            (s8 *)buf1,
            (s8 *)buf2,
            (s16 *)buf3,
            0x10, proc->unk54,
            5);
    }
    else
        CpuFastCopy(gPalEfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(OBPAL_EFXHPBAR_R), 0x20);

    EnablePaletteSync();
}
