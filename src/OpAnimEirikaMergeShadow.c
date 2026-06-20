#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C8214
void OpAnimEirikaMergeShadow(struct ProcOpAnim * proc)
{
    gOpAnimSt.unk06 = Interpolate(INTERPOLATE_RSQUARE, DISPLAY_HEIGHT, DISPLAY_WIDTH / 2, proc->timer, 0x10);
    OpAnimDrawSplitLine(8, 0x88);

    if (proc->timer > 0xe)
    {
        PutSpriteExt(1, 8, 0x78, (const u16 *)0x08B3F1F0, 0x0000208E);
        PutSpriteExt(1, 8, 0x88, (const u16 *)0x08B3F204, 0x000020B2);
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
