#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"
#include "prepscreen.h"
#include "constants/songs.h"




void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc)
{
    int i;
    int unk;

    PutImg_PrepItemUseUnk(0x5000, 5);
    PutImg_PrepPopupWindow(0x800, 10);

    Decompress(gUnkData_71, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnkData_73, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0, proc);
    EnableSysBrownBox(0, 0x90, 6, 2);
    GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 128;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 224;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(0, 0, 0, 8);
    StartGreenText(proc);
    StartHelpPromptSprite(195, 147, 9, proc);

    InitText(&PrepItemSuppyTexts.th[0], 4);
    InitText(&PrepItemSuppyTexts.th[1], 3);

    PrepItemSupply_InitGiveTakeText();

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        InitText(&PrepItemSuppyTexts.th[2 + i], 7);
    }

    for (i = 0; i < 8; i++) {
        InitTextDb(&PrepItemSuppyTexts.th[7 + i], 7);
    }

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(PrepItemSupply_OnHBlank);

    StoreConvoyWeaponIconGraphics(0x4000, 6);
    PrepItemSupply_DrawConvoyWeaponIconTiles(gBG0TilemapBuffer + 0x6F, 0x4000, 6);

    Decompress(gUnkData_61, (void*)0x06015000);
    ApplyPalette(Pal_SpinningArrow, 0x14);

    StartMenuScrollBarExt(proc, 0xe1, 0x2f, 0x5800, 9);
    UnlockMenuScrollBar();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);

    PrepItemSupply_DrawItemList(
        &PrepItemSuppyTexts.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );
    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x6F + 0xb3, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawConvoyHeader();
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xe9, 0x18);
    SetUiSpinningArrowConfig(3);
    StartParallelWorker(Supply_PutHighlightedCategorySprites, proc);

    return;
}
