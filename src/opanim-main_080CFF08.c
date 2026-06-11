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
int OpAnimCalcObjSlideIn(int a, int b, int c, int d);

//! FE8U = 0x080CAF2C
void OpAnimTitleFlyInSeg4(struct ProcOpAnim * proc)
{
    int y;
    int timer;

    timer = proc->timer + 10;
    y = OpAnimCalcObjSlideIn(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        int oam2 = 0;
        PutSpriteExt(1, 0, OAM0_Y(y - 0x28), gUnkData_100, oam2);
        PutSpriteExt(2, 4, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 0x10, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    timer = proc->timer + 6;
    y = OpAnimCalcObjSlideIn(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x48, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x4c, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x58, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    timer = proc->timer + 2;
    y = OpAnimCalcObjSlideIn(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x90, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x94, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0xa0, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    if (proc->timer == 0xf)
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

//! FE8U = 0x080CB0A0
void OpAnimTitleFlyInSeg5(struct ProcOpAnim * proc)
{
    int y;
    int timer;

    timer = proc->timer + 10;
    y = OpAnimCalcObjSlideIn(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        int oam2 = 0;
        PutSpriteExt(1, 0, OAM0_Y(y - 0x28), gUnkData_100, oam2);
        PutSpriteExt(2, 4, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 0x10, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    timer = proc->timer + 6;
    y = OpAnimCalcObjSlideIn(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x48, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x4c, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x58, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    timer = proc->timer + 2;
    y = OpAnimCalcObjSlideIn(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x90, OAM0_Y(y - 0x28), gUnkData_100, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x94, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnkData_100, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0xa0, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnkData_104, 0);
    }

    if (proc->timer == 0xd)
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

//! FE8U = 0x080CB20C
void OpAnimTitleFlyInSeg6(struct ProcOpAnim * proc)
{
    int timer;
    int x;

    timer = proc->timer + 6;
    x = OpAnimCalcObjSlideIn(0x3c, -1, timer, 0xb);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x20), 6, gUnkData_100, 0);
        PutSpriteExt(2, OAM1_X(x - 0x1c), 0x00000406, gUnkData_100, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x0000081E, gUnkData_103, 0);
    }

    timer = proc->timer + 2;
    x = OpAnimCalcObjSlideIn(0x3c, -1, timer, 0xb);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x40), 0x3a, gUnkData_100, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x3c), 0x0000043A, gUnkData_100, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000852, gUnkData_103, 0);
    }

    if (proc->timer == 0xb)
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
