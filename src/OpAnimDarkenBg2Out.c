#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C8638
void OpAnimDarkenBg2Out(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, Interpolate(INTERPOLATE_LINEAR, 0, 12, proc->unk4C, 0x28));

    if (proc->unk4C == 0x28)
    {
        Proc_Break(proc);
    }
    else
    {
        proc->unk4C++;
    }

    return;
}
