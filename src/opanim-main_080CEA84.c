#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

//! FE8U = 0x080C9A94
void OpAnimFaceMontageBlendOut(struct ProcOpAnim * proc)
{
    SetBlendConfig(1, Interpolate(INTERPOLATE_LINEAR, 0, 0xd, proc->timer, 0x30), 0x10, 8);

    if (proc->timer == 0x30)
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
