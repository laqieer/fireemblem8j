#include "global.h"
void ExtramenuUnk_HBlank(void);
extern u8 gMenuMainObjs_3[];
extern u8 gMenuMainObjs_2[];
extern u8 gMenuMainObjs_4[];
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"

//! FE8U = 0x080B04F8
void ExtramenuUnk_LoadGfx(void) {
    ApplyPalettes(Pal_CommGameBgScreenInShop, 0, 2);
    ApplyPalette(Pal_MenuMainObjs_0, 2);
    Decompress(Img_CommGameBgScreen, (void*)0x06001000);
    CallARM_FillTileRect(gBG0TilemapBuffer, Tsa_CommGameBgScreenInShop, 0x80);

    BG_EnableSyncByMask(1);

    ApplyPalettes(gMenuMainObjs_4, 0x11, 8);
    Decompress(gMenuMainObjs_2, (void*)0x06010800);
    Decompress(gMenuMainObjs_3, (void*)0x06014000);

    SetPrimaryHBlankHandler(ExtramenuUnk_HBlank);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    return;
}
