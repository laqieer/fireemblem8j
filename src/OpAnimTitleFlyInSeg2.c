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

//! FE8U = 0x080CABB0
void OpAnimTitleFlyInSeg2(struct ProcOpAnim * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;
    int timer;

    timer = proc->timer + 2;

    x1 = OpAnimCalcObjSlideIn(0x42, -1, timer, 0x12);
    y1 = OpAnimCalcObjSlideIn(0x2a, -1, timer, 0x12);
    x2 = OpAnimCalcObjSlideIn(0xae, +1, timer, 0x12);
    y2 = OpAnimCalcObjSlideIn(0x76, +1, timer, 0x12);

    if (x1 != 0x0000FFFF)
    {
        if ((y1 != 0x0000FFFF) && (y1 >= -0x28) && (y1 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x1 - 0x30), OAM0_Y(y1 - 0x28), gUnkData_100, 0);
            PutSpriteExt(
                2, OAM1_X(x1 - 0x2c), OAM0_Y(y1 - 0x28) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
            PutSpriteExt(0, OAM1_X(x1 - 0x30), OAM0_Y(y1 - 0x20) | OAM0_WINDOW, gUnkData_102, 0);
        }

        if ((x1 != 0x0000FFFF) && (y2 != 0x0000FFFF) && (y2 >= -0x28) && (y2 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x1 - 0x30), OAM0_Y(y2 - 0x28), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
            PutSpriteExt(
                2, OAM1_X(x1 - 0x2c), OAM0_Y(y2 - 0x28) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
            PutSpriteExt(0, OAM1_X(x1 - 0x30), OAM0_Y(y2 - 0x20) | OAM0_WINDOW, gUnkData_102, 0);
        }
    }

    if (x2 != 0x0000FFFF)
    {
        if ((y1 != 0x0000FFFF) && (y1 >= -0x28) && (y1 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x2 - 0x30), OAM0_Y(y1 - 0x28), gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
            PutSpriteExt(
                2, OAM1_X(x2 - 0x2c), OAM0_Y(y1 - 0x28) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
            PutSpriteExt(0, OAM1_X(x2 - 0x30), OAM0_Y(y1 - 0x20) | OAM0_WINDOW, gUnkData_102, 0);
        }

        if ((x2 != 0x0000FFFF) && (y2 != 0x0000FFFF) && (y2 >= -0x28) && (y2 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x2 - 0x30), (y2 - 0x28) & 0xff, gUnkData_100, OAM2_CHR(0x2D0) + OAM2_PAL(6));
            PutSpriteExt(
                2, OAM1_X(x2 - 0x2c), ((y2 - 0x28) & 0xff) | OAM0_BLEND, gUnkData_100,
                OAM2_CHR(0x348) + OAM2_PAL(7));
            PutSpriteExt(0, OAM1_X(x2 - 0x30), ((y2 - 0x20) & 0xff) | OAM0_WINDOW, gUnkData_102, 0);
        }
    }

    if (proc->timer == 0x12)
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
