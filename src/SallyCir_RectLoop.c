#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"




void SallyCir_RectLoop(struct SallyCirProc * proc)
{
    int a;
    int t;

    proc->unk_29++;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    a = (15 - proc->unk_29);
    t = (640 - (a * 640 * a) / 225) >> 4;


    if (proc->unk_2a > 0) {
        gLCDControlBuffer.win1_left = t * 3;
        gLCDControlBuffer.win1_top = t * 2;
        gLCDControlBuffer.win1_right = -16 - t * 3;
        gLCDControlBuffer.win1_bottom = -96 - t * 2;
    } else {
        gLCDControlBuffer.win1_left = 120 - t * 3;
        gLCDControlBuffer.win1_top = 80 - t * 2;
        gLCDControlBuffer.win1_right =  120 + t * 3;
        gLCDControlBuffer.win1_bottom = 80 + t * 2;
    }

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


    if (t >= 40) {
        Proc_Break(proc);

        if (proc->unk_2a > 0) {
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        }
    }

    return;
}
