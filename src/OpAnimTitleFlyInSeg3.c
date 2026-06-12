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

//! FE8U = 0x080CAE20
void OpAnimTitleFlyInSeg3(struct ProcOpAnim * proc)
{
    int timer;
    int x;

    timer = proc->timer + 2;
    x = OpAnimCalcObjSlideIn(0x3e, -1, timer, 0x10);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x20), 0x20, gUnkData_100, 0);
        PutSpriteExt(2, OAM1_X(x - 0x1c), 0x420, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000838, gUnkData_103, 0);
    }

    x = OpAnimCalcObjSlideIn(0xb2, +1, timer, 0x10);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x40), 0x20, gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x3c), 0x420, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000838, gUnkData_103, 0);
    }

    if (proc->timer == 0x10)
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
