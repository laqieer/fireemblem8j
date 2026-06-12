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

//! FE8U = 0x080CAA38
void OpAnimTitleFlyInSeg1(struct ProcOpAnim * proc)
{
    int x;

    int timer = proc->timer + 10;

    x = OpAnimCalcObjSlideIn(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0xec, gUnkData_100, 0);
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x000004EC, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x00000804, gUnkData_101, 0);
    }

    timer = proc->timer + 6;
    x = OpAnimCalcObjSlideIn(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x20, gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x420, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x00000838, gUnkData_101, 0);
    }

    timer = proc->timer + 2;
    x = OpAnimCalcObjSlideIn(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x54, gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x00000454, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x0000086C, gUnkData_101, 0);
    }

    if (proc->timer == 0x14)
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
