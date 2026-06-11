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
void OpAnimDrawSplitLine(int xOam1, int yOam0);

//! FE8U = 0x080C7F90
void OpAnimEirikafxFlyIn(struct ProcOpAnim * proc)
{
    int time;
    int ret;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->timer <= 0x10)
    {
        ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0x68, proc->timer, 0x10);

        switch (proc->timer)
        {
            case 12:
                TsaModifyFirstPalReverse(ret, 0, 0x98, 2, (void *)(0x0600C800), 0, 0);

                break;

            case 13:
                Decompress(Img_OpAnimEirikaBlur1, (void *)(0x06008000));
                TsaModifyFirstPalReverse(ret, proc->unk30, 0x98, 2, (void *)(0x0600C800), 0, 0);

                break;

            case 14:
                Decompress(Tsa_OpAnimEirikaBlur1, (void *)(0x0600C000));
                TsaModifyFirstPalReverse(ret, 0, 0x98, 2, (void *)(0x0600C000), 0, 0);

                break;

            case 15:
            default:
                TsaModifyFirstPalReverse(ret, proc->unk30, 0x98, 2, (void *)(0x0600C000), 0, 0);

                break;

            case 16:
                TsaModifyFirstPalReverse(ret, 0, 0x98, 2, (u16 *)(gGenericBuffer + 0x1000), 0, 0);
                SetBackgroundTileDataOffset(2, 0x4000);

                break;
        }

        proc->unk30 = ret;
    }

    time = proc->timer - 5;

    if (time >= 0)
    {
        ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0xcc, time, 0x10);
        TsaModifyFirstPalMaybe(ret, proc->unk32, 0xc0, 1, (u16 *)gGenericBuffer, (u16 *)(gGenericBuffer + 0x800), 1);
        proc->unk32 = ret;

        if (time == 0x10)
        {
            TsaModifyFirstPalMaybe(proc->unk32, 0, 0xc0, 0, (u16 *)gGenericBuffer, (u16 *)(gGenericBuffer + 0x800), 0);
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C8100
void OpAnimEirikaSetupSplitWindow(struct ProcOpAnim * proc)
{
    SetPrimaryHBlankHandler(OpAnimHBlank1);

    SetWinEnable(1, 0, 0);
    SetDispEnable(1, 1, 1, 1, 1);

    SetWin0Box(gOpAnimSt.x, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetBackgroundMapDataOffset(BG_2, 0xf000);

    SetBlendTargetA(0, 1, 1, 0, 0);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080C8184
void OpAnimEirikaAdvanceSplitLine(struct ProcOpAnim * proc)
{
    int x;
    int y;

    gOpAnimSt.x = Interpolate(INTERPOLATE_RSQUARE, DISPLAY_WIDTH, 0, proc->timer, 0x10);
    gOpAnimSt.y = Interpolate(INTERPOLATE_RSQUARE, 0, DISPLAY_HEIGHT, proc->timer, 0x10);

    SetWin0Box(gOpAnimSt.x, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    x = gOpAnimSt.x;
    y = gOpAnimSt.y;

    if (x < 8)
    {
        x = 8;
    }

    if (y > 0x88)
    {
        y = 0x88;
    }

    OpAnimDrawSplitLine(x, y);

    if (proc->timer == 0x10)
    {
        SetPrimaryHBlankHandler(OpAnimHBlank2);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
