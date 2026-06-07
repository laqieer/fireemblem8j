#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void Sio_LoadingBlendPulse_Loop(struct Proc_Sio_085A93A0 * proc)
{
    int time = (++proc->timer) % 0x40;

    if (time >= 0x20)
        time = 0x40 - time;

    if (time > 0x10)
        time = 0x10;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendAlpha(time, 0x10 - time);
}

void Sio_ScrollBgsParallax_Loop(void)
{
    gLCDControlBuffer.bgoffset[BG_1].x++;
    gLCDControlBuffer.bgoffset[BG_2].x--;
}
