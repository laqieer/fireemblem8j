#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C84D8
void OpAnimFadeToBlack(struct ProcOpAnim * proc)
{
    if (proc->timer == 0)
    {
        SetDispEnable(0, 0, 0, 1, 1);
        SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, 0);
        SetBlendTargetA(1, 1, 1, 1, 1);
    }

    gLCDControlBuffer.blendY = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 8);

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

//! FE8U = 0x080C8554
void OpAnimScrollBg3Loop(void)
{
    gLCDControlBuffer.bgoffset[BG_3].x += 2;
    return;
}
