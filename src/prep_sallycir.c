#include "global.h"

#include "fontgrp.h"
#include "hardware.h"

#include "prepscreen.h"

//! FE8U = 0x08097840
void SallyCir_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount == 160) {
        struct Win1H* swap;

        vcount = 0;

        swap = gPrepscreen_4[0];
        gPrepscreen_4[0] = gPrepscreen_4[1];
        gPrepscreen_4[1] = swap;
    } else {
        if (vcount > 160) {
            vcount = 0;
        }
    }

    REG_WIN1H = ((*gPrepscreen_4 + vcount)->left << 8) | (*gPrepscreen_4 + vcount)->right;
    return;
}

//! FE8U = 0x0809788C
void SallyCir_Init(struct SallyCirProc * proc)
{
    u16 i;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    if (proc->unk_2a < 0) {
        proc->unk_2c = 150;

        for (i = 0; i < 160; i++) {
            gPrepscreen_3[0][i].left = 0;
            gPrepscreen_3[0][i].right = 240;

            gPrepscreen_3[1][i].left = 0;
            gPrepscreen_3[1][i].right = 240;
        }

        gLCDControlBuffer.win1_left = 0;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 240;
        gLCDControlBuffer.win1_bottom = 160;
    } else {
        proc->unk_2c = 0;

        for (i = 0; i < 160; i++) {
            gPrepscreen_3[0][i].left = 120;
            gPrepscreen_3[0][i].right = 120;

            gPrepscreen_3[1][i].left = 120;
            gPrepscreen_3[1][i].right = 120;
        }

        gLCDControlBuffer.win1_left = 120;
        gLCDControlBuffer.win1_top = 0;
        gLCDControlBuffer.win1_right = 120;
        gLCDControlBuffer.win1_bottom = 160;
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

    proc->unk_29 = 0;

    gPrepscreen_4[0] = gPrepscreen_3[0];
    gPrepscreen_4[1] = gPrepscreen_3[1];

    SetPrimaryHBlankHandler(SallyCir_OnHBlank);

    return;
}
