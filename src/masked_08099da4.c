#include "global.h"

#include "fontgrp.h"
#include "hardware.h"

#include "prepscreen.h"

//! FE8U = 0x08097ACC
void SallyCir_RectInit(struct SallyCirProc * proc)
{
    proc->unk_29 = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    if (proc->unk_2a > 0) {
        gLCDControlBuffer.win1_left = 0;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 240;
        gLCDControlBuffer.win1_bottom = 160;
    } else {
        gLCDControlBuffer.win1_left = 120;
        gLCDControlBuffer.win1_top = 80;
        gLCDControlBuffer.win1_right = 120;
        gLCDControlBuffer.win1_bottom = 80;
    }

    return;
}
