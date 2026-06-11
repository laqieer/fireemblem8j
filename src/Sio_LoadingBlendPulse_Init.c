#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void Sio_LoadingBlendPulse_Init(struct Proc_Sio_085A93A0 * proc)
{
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    proc->timer = 0;
}
