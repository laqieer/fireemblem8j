#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gExtramenuUnk_0[];

struct Proc8A21568 {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x58-0x29];
    /* 58 */ int unk_58;
};

//! FE8U = 0x080B04BC
void ExtramenuUnk_Init(struct Proc8A21568* proc) {
    proc->unk_58 = 4;

    SetupBackgrounds(gExtramenuUnk_0);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    return;
}
