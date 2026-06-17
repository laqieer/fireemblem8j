#include "global.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"



void WmSell_OnHBlank(void);
void WmSell_DrawValueSpriteText(void);
void WmSell_InitMenuSpriteText(void);
void WmSell_PutSupplyFaceAndText(void);
void WmSell_DrawItemGoldValue(int item);
void WmSell_DrawPartyFunds(void);

void WmSell_Setup(struct WmSellProc* proc) {
    int i;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();

    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    LoadHelpBoxGfx((void*)0x06014000, -1);
    LoadIconPalettes(4);

    RestartMuralBackground();

    PutImg_PrepItemUseUnk(0x5000, 5);
    PutImg_PrepPopupWindow(0x800, 8);

    Decompress(gUnkData_72, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

    StartFace2(
        0,
        GetUnitPortraitId(proc->unit),
        68,
        72,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(FACE_HLAYER_2) | FACE_DISP_BLEND
    );
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

    SetBlendConfig(0, 8, 8, 8);

    StartGreenText((struct Proc*)proc);

    StartHelpPromptSprite(120, 140, 2, (struct Proc*)proc);
    StartDrawPrepFundsSprite(165, 128, 10, proc);
    ShowPrepFundsSpriteAt(165, 128);

    InitText(&_PrepItemSuppyTexts->textA, 4);
    InitText(&_PrepItemSuppyTexts->textB, 2);

    WmSell_InitMenuSpriteText();

    for (i = 0; i < 5; i++) {
        InitText(&_PrepItemSuppyTexts->textArray[i], 7);
    }

    SetPrimaryHBlankHandler(0);
    SetPrimaryHBlankHandler(WmSell_OnHBlank);

    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &_PrepItemSuppyTexts->textArray[0], proc->unit, 0);
    WmSell_PutSupplyFaceAndText();

    StartParallelWorker(WmSell_DrawValueSpriteText, proc);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
    WmSell_DrawPartyFunds();

    return;
}
