#include "global.h"
int OpAnimCalcObjSlideIn(int a, int b, int c, int d);
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080CB320
void OpAnimTitleFlyInSeg7(struct ProcOpAnim * proc)
{
    int timer;
    int y;
    int x;

    x = 0x78;

    if (proc->timer == 0)
    {
        SetWinEnable(1, 1, 1);

        gLCDControlBuffer.wincnt.win0_enableBlend = 1;
        SetWin0Layers(0, 0, 0, 1, 1);

        gLCDControlBuffer.wincnt.win1_enableBlend = 1;
        SetWin1Layers(0, 0, 0, 1, 1);

        SetWin0Box(0, 0, 0, 0);
        SetWin1Box(0, 0, 0, 0);
    }

    timer = proc->timer + 2;
    y = OpAnimCalcObjSlideIn(0x1c, -1, timer, 10);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, (x - 0x30), OAM0_Y(y - 0x30), gUnkData_100, 0);
        PutSpriteExt(2, (x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, (x - 0x38), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnkData_103, 0);
    }

    y = OpAnimCalcObjSlideIn(0x84, +1, timer, 10);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnkData_103, 0);
    }

    if (timer > 1 && timer < 10)
    {
        y = Interpolate(4, 0, 0x18, timer - 2, 8);

        SetWin0Box(6, 0x50 - y, 0x76, y + 0x50);
        SetWin1Box(0x7A, 0x50 - y, 0xea, y + 0x50);
    }

    PutSpriteExt(1, 0xe, 0x20, gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
    PutSpriteExt(2, 0x12, 0x420, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
    PutSpriteExt(1, 0x82, 0x20, gUnkData_100, OAM2_CHR(0x2D0) + OAM2_PAL(6));
    PutSpriteExt(2, 0x86, 0x420, gUnkData_100, OAM2_CHR(0x348) + OAM2_PAL(7));

    if (proc->timer == 10)
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
