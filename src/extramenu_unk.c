#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"

struct Proc8A21568 {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x58-0x29];
    /* 58 */ int unk_58;
};

extern u16 gMenuMainObjs_4[]; // pal
extern u8 gMenuMainObjs_2[]; // gfx
extern u8 gMenuMainObjs_3[];

 // gfx

//! FE8U = 0x080B0458
void ExtramenuUnk_HBlank(void) {
    u16 vcount = (REG_VCOUNT + 1);

    if (vcount > 160) {
        vcount = 0;
    }

    if ((vcount & 1) == 0) {
        if (vcount < 100) {
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_DARKEN;
            (*(vu16*)REG_ADDR_BLDY) = (100 - vcount) * 16 / 100;
        } else {
            REG_BLDCNT = BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0;
            REG_BLDALPHA = BLDALPHA_BLEND(10, 16);
        }
    }

    return;
}
