#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C85B0
void OpAnimDarkenBg2In(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, Interpolate(INTERPOLATE_LINEAR, 0xe, 0, proc->unk4C, 0x28));

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
