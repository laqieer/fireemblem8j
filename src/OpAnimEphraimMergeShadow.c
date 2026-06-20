#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

void OpAnimEphraimMergeShadow(struct ProcOpAnim * proc)
{
    gOpAnimSt.unk06 =
        Interpolate(4, 0xA0, 0x78, proc->timer, 0x10);

    OpAnimDrawSplitLine(0xE8, 0x88);

    if (proc->timer > 0xE)
    {
        PutSpriteExt(1, 0xaa, 0x78, (const u16 *)0x08B3F1CE, 0x00002046);
        PutSpriteExt(1, 0x98, 0x88, (const u16 *)0x08B3F1DC, 0x00002066);
    }

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}
