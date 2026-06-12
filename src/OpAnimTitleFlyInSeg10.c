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

//! FE8U = 0x080CB878
void OpAnimTitleFlyInSeg10(struct ProcOpAnim * proc)
{
    int timer;
    int y;
    int x;

    timer = proc->timer + 2;
    x = 0x1e;
    y = OpAnimCalcObjSlideIn(0x50, -1, timer, 7);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x28), gUnkData_100, 0);
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 2, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_105, 0);
    }

    y--, y++;

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x66, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x6a, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0x7a, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_105, 0);
    }

    y = OpAnimCalcObjSlideIn(0x50, 1, timer, 7);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x2a, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x2e, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x3e, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_105, 0);
    }

    y--, y++;

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0xa2, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0x2D0) + OAM2_PAL(6));
        PutSpriteExt(2, 0xa6, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x348) + OAM2_PAL(7));
        PutSpriteExt(0, 0xb6, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_105, 0);
    }

    if (proc->timer == 7)
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
