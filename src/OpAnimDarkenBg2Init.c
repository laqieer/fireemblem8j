#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C8580
void OpAnimDarkenBg2Init(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, 14);
    SetBlendTargetA(0, 0, 1, 0, 0);

    proc->unk4C = 0;

    return;
}
