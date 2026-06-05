#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"

#include "worldmap.h"

// clang-format off

























// clang-format on

//! FE8U = 0x080C0FB0
void GmapEffectPal_OnEnd(struct GmapEffectProc * proc)
{
    gLCDControlBuffer.bldcnt = proc->blendControl;
    gLCDControlBuffer.blendCoeffA = proc->blendCoeffA;
    gLCDControlBuffer.blendCoeffB = proc->blendCoeffB;
    gLCDControlBuffer.blendY = proc->blendY;

    return;
}

//! FE8U = 0x080C0FE8
void GmapEffectPal_Init(struct GmapEffectProc * proc)
{
    proc->unk_30 = 0;

    proc->unk_2e = 4;
    proc->unk_2c = 4;

    proc->flags_0 = 0;

    if (gGMData.state.bits.state_3)
    {
        proc->flags_1 = 1;
        proc->unk_2a = -1;
    }
    else
    {
        proc->flags_1 = 0;
        proc->unk_2a = 0;
    }

    proc->unk_2b_0 = 0;

    proc->blendControl = gLCDControlBuffer.bldcnt;
    proc->blendCoeffA = gLCDControlBuffer.blendCoeffA;
    proc->blendCoeffB = gLCDControlBuffer.blendCoeffB;
    proc->blendY = gLCDControlBuffer.blendY;

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendConfig(BLEND_EFFECT_NONE, 16, 16, 0);

    return;
}
