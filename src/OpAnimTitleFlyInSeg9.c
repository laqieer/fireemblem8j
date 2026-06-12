extern int OpAnimCalcObjSlideIn();
#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080CB6A0
void OpAnimTitleFlyInSeg9(struct ProcOpAnim * proc)
{
    int x;
    int y;
    int timer;

    timer = proc->timer + 10;
    x = 0x78;

    y = OpAnimCalcObjSlideIn(0x1c, 1, timer, 8);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, x - 0x30, OAM0_Y(y - 0x30), gUnkData_100, 0);
        PutSpriteExt(2, x - 0x2c, (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, x - 0x60, (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnkData_106, 0);
    }

    timer = proc->timer + 6;
    y = OpAnimCalcObjSlideIn(0x50, +1, timer, 8);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnkData_106, 0);
    }

    timer = proc->timer + 2;
    y = OpAnimCalcObjSlideIn(0x84, +1, timer, 8);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnkData_106, 0);
    }

    if (proc->timer == 8)
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
