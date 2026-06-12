#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"
#include "constants/songs.h"

//! FE8U = 0x080B57A0
void ArenaUi_Init(ProcPtr proc) {
    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitTalk(0x200, 2, 0);
    ResetFaces();
    StartTalkFace(0x68, 0x20, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gGenericBuffer);

    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    TileMap_FillRect(gBG1TilemapBuffer + 0x100, 0x1e, 0xc, 0);

    BG_EnableSyncByMask(2);

    StartUiGoldBox(proc);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win0_left = 88;
    gLCDControlBuffer.win0_top = 72;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 8;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 56;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Decompress(gGfx_ArenaBuildingFront, (void*)(GetBackgroundTileDataOffset(3) + VRAM));
    CallARM_FillTileRect(gBG3TilemapBuffer, gTsa_ArenaBuildingFront, 0xc000);
    ApplyPalettes(gPal_ArenaBuildingFront, 0xC, 4);

    BG_EnableSyncByMask(8);

    return;
}
