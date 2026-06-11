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

void OpAnimEphraimSetupSplitWindow(struct ProcOpAnim * proc)
{
    SetPrimaryHBlankHandler(OpAnimHBlank1);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0, gOpAnimSt.x, 0xA0);

    SetBackgroundMapDataOffset(BG_2, 0xF000);
    SetBlendTargetA(0, 1, 1, 0, 0);
    Proc_Break(proc);
}

void OpAnim1AdvanceSplitLine(struct ProcOpAnim * proc)
{
    int x, y;

    gOpAnimSt.x =
        Interpolate(4, 0, 0xF0, proc->timer, 0x10);

    gOpAnimSt.y =
        Interpolate(4, 0, 0xA0, proc->timer, 0x10);

    SetWin0Box(0, 0, gOpAnimSt.x, 0xA0);

    x = gOpAnimSt.x;
    y = gOpAnimSt.y;

    if (x > 0xE8)
        x = 0xE8;

    if (y > 0x88)
        y = 0x88;

    OpAnimDrawSplitLine(x, y);

    if (proc->timer == 0x10)
    {
        SetPrimaryHBlankHandler(OpAnimHBlank2);
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}
