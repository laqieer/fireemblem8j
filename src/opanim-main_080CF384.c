#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void OpAnim1_UpdateScroll(int new, int old);
void OpAnimCharacterFlyOutBg1(struct ProcOpAnim * proc);

//! FE8U = 0x080CA3B8
void OpAnimCharacterFlyOut(struct ProcOpAnim * proc)
{
    int ret;

    OpAnimCharacterFlyOutBg1(proc);

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer - 0xf >= 0)
    {
        int bldAmt = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer - 0xf, 0xf);
        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_SQUARE, proc->unk40 + 0x10, proc->unk40 * 2 + 0x10, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        TsaModifyFirstPalReverse(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    if (proc->timer == 0x1e)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA4A4
void OpAnimGatherUnitsBegin(void)
{
    Proc_EndEach(gUnkData_99);
    SetDispEnable(0, 0, 0, 0, 1);
    SetDefaultColorEffects();
    return;
}

//! FE8U = 0x080CA4DC
void OpAnimGatherUnitsMain(struct ProcOpAnim * proc)
{
    int bldAmt;
    int ret;
    u32 timer;
    int i;

    switch (proc->timer)
    {
        case 0:
            break;

        case 1:
            OpAnim1_UpdateScroll(0x1b0, 0x188);

            break;

        case 2:
            OpAnim1_UpdateScroll(0x1f0, 0x1b0);

            break;

        case 3:
            OpAnim1_UpdateScroll(0x230, 0x1f0);

            break;

        case 4:
            proc->unk3A = 0x230;
            proc->unk38 = 0x230;

            break;
    }

    if (proc->timer > 0x8e)
    {
        OpAnimPutObjCommon(0xae, 10, 4, 9);
    }

    if (proc->timer > 0x8d)
    {
        OpAnimPutObjCommon(0x38, 0x28, 4, 7);
    }

    if (proc->timer > 0x8c)
    {
        OpAnimPutObjCommon(0x9c, 0x3a, 3, 3);
    }

    if (proc->timer > 0x8b)
    {
        OpAnimPutObjCommon(0x22, 0, 4, 1);
    }

    if (proc->timer > 0x8a)
    {
        OpAnimPutObjCommon(0xd2, 0x10, 4, 5);
    }

    if (proc->timer > 0x89)
    {
        OpAnimPutObjCommon(0xc, 0x1a, 3, 1);
    }

    if (proc->timer > 0x88)
    {
        OpAnimPutObjCommon(0xcc, 0x2a, 3, 4);
    }

    if (proc->timer > 0x87)
    {
        OpAnimPutObjCommon(0x60, 0, 4, 0);
    }

    if (proc->timer > 0x86)
    {
        OpAnimPutObjCommon(0xe4, 0x10, 4, 0xb);
    }

    if (proc->timer > 0x85)
    {
        OpAnimPutObjCommon(0x58, 0x1e, 3, 3);
    }

    if (proc->timer > 0x84)
    {
        OpAnimPutObjCommon(0x54, 0x2e, 2, 1);
    }

    if (proc->timer > 0x83)
    {
        OpAnimPutObjCommon(0, 2, 4, 2);
    }

    if (proc->timer > 0x82)
    {
        OpAnimPutObjCommon(0xc6, 0x18, 4, 9);
    }

    if (proc->timer > 0x81)
    {
        OpAnimPutObjCommon(0x90, 0x22, 3, 5);
    }

    if (proc->timer > 0x80)
    {
        OpAnimPutObjCommon(0xa8, 0x44, 2, 0);
    }

    if (proc->timer > 0x7f)
    {
        OpAnimPutObjCommon(0xca, 2, 4, 7);
    }

    if (proc->timer > 0x7e)
    {
        OpAnimPutObjCommon(0x26, 0x18, 4, 2);
    }

    if (proc->timer > 0x7d)
    {
        OpAnimPutObjCommon(0x80, 0x26, 3, 0);
    }

    if (proc->timer > 0x7b)
    {
        OpAnimPutObjCommon(0x80, 0x32, 2, 5);
    }

    if (proc->timer > 0x79)
    {
        OpAnimPutObjCommon(0x86, 6, 4, 0);
    }

    if (proc->timer > 0x77)
    {
        OpAnimPutObjCommon(0x98, 0x16, 4, 1);
    }

    if (proc->timer > 0x75)
    {
        OpAnimPutObjCommon(0xe8, 0x16, 3, 3);
    }

    if (proc->timer > 0x73)
    {
        OpAnimPutObjCommon(100, 0x48, 2, 1);
    }

    if (proc->timer > 0x71)
    {
        OpAnimPutObjCommon(0x70, 6, 4, 10);
    }

    if (proc->timer > 0x6f)
    {
        OpAnimPutObjCommon(0x40, 0x14, 4, 8);
    }

    if (proc->timer > 0x6d)
    {
        OpAnimPutObjCommon(0, 0x2e, 3, 4);
    }

    if (proc->timer > 0x6b)
    {
        OpAnimPutObjCommon(0x2c, 0x4a, 2, 4);
    }

    if (proc->timer > 0x69)
    {
        OpAnimPutObjCommon(0x40, 8, 4, 6);
    }

    if (proc->timer > 0x67)
    {
        OpAnimPutObjCommon(0x78, 0x1a, 4, 2);
    }

    if (proc->timer > 0x65)
    {
        OpAnimPutObjCommon(0x24, 0x32, 3, 2);
    }

    if (proc->timer > 0x62)
    {
        OpAnimPutObjCommon(0xe, 0x4e, 2, 0);
    }

    if (proc->timer > 0x5f)
    {
        OpAnimPutObjCommon(0x16, 10, 4, 4);
    }

    if (proc->timer > 0x5c)
    {
        OpAnimPutObjCommon(0xb4, 0x28, 4, 1);
    }

    if (proc->timer > 0x59)
    {
        OpAnimPutObjCommon(0x42, 0x36, 3, 1);
    }

    if (proc->timer > 0x55)
    {
        OpAnimPutObjCommon(0xdc, 0x32, 2, 2);
    }

    if (proc->timer > 0x51)
    {
        OpAnimPutObjCommon(200, 0x48, 1, 0);
    }

    if (proc->timer > 0x4c)
    {
        OpAnimPutObjCommon(0x38, 0x28, 4, 0);
    }

    if (proc->timer > 0x47)
    {
        OpAnimPutObjCommon(0x8c, 0x54, 1, 2);
    }

    if (proc->timer > 0x41)
    {
        OpAnimPutObjCommon(0x10, 100, 1, 1);
    }

    if (proc->timer > 0x37)
    {
        OpAnimPutObjCommon(0, 0x7e, 0, 1);
    }

    if (proc->timer > 0x31)
    {
        OpAnimPutObjCommon(0xa0, 0x78, 0, 2);
    }

    if (proc->timer > 0x1d)
    {
        OpAnimPutObjCommon(0x58, 0x70, 0, 0);
    }

    timer = proc->timer - 0x52;

    if (timer == 0)
    {
        SetDispEnable(0, 0, 1, 0, 1);
        SetBackgroundTileDataOffset(BG_2, 0x8000);
        SetBackgroundMapDataOffset(BG_2, 0xe800);
    }

    if (timer < 0x60)
    {
        CopyToPalOpAnim(pal_OpanimGfx_0, 0, 0x100);

        ret = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0xc, timer, 0x5f);

        for (i = 0; i < 8; i++)
        {
            BlendPaletteToColor(gPaletteBuffer + i * 0x10, 0, ret);
        }
    }

    timer = proc->timer - 0xb1;

    if (timer == 0)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 1);
        SetBlendTargetB(0, 0, 1, 0, 0);
    }

    if (timer < 0x21)
    {
        bldAmt = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, timer, 0x20);
        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;
    }

    if (proc->timer == 0xd1)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA92C
void OpAnimGatherUnitsEnd(struct ProcOpAnim * proc)
{
    SetDefaultColorEffects();
    proc->unk46 = 1;
    return;
}
