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

//! FE8U = 0x080CBC40
void OpAnimTitleFlyInSeg12(struct ProcOpAnim * proc)
{
    int timer;
    int x;
    int i;
    u16 * ptr;

    timer = proc->timer + 2;
    x = OpAnimCalcObjSlideIn(0x3e, -1, timer, 5);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x28, gUnkData_100, 0);
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x428, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000828, gUnkData_107, 0);
    }

    x = OpAnimCalcObjSlideIn(0xb2, +1, timer, 5);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x28, gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x428, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000828, gUnkData_107, 0);
    }

    if (proc->timer == 1)
    {
        Decompress(Tsa_OpAnimShiningRingBlinking, (void *)0x0600F000);

        ptr = (void *)0x0600F000;
        for (i = 0; i < 0x280; i++, ptr++)
        {
            *ptr = *ptr + 0x8000;
        }
    }

    if (proc->timer == 5)
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
