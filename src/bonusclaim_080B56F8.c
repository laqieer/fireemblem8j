#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"








 // maybe lower

extern struct BonusClaimEnt * CONST_DATA gpBonusClaimData;
extern struct BonusClaimEnt * CONST_DATA gpBonusClaimDataUpdated;
extern struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList;
extern int* CONST_DATA gpBonusClaimItemCount;
extern struct Text * CONST_DATA gpBonusClaimText;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

/* prototypes for same-file helpers called by this run */
void BonusClaim_DrawChapterTitle(void);
s8 InitBonusClaimData(void);
void DrawBonusClaimItemText(int idx);
void SetupBonusClaimTargets(struct BonusClaimProc * proc);
void BonusClaim_DrawMainWindowFrame(void);

//! FE8U = 0x080B0ADC
void BonusClaim_Init(struct BonusClaimProc * proc)
{
    int i;

    SetupBackgrounds(0);

    ApplyPalettes(Pal_CommGameBgScreenInShop, 0xC, 2);
    ApplyPalette(Pal_MenuMainObjs_0, 0xE);
    Decompress(Img_CommGameBgScreen, (void*)0x06008000);

    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_CommGameBgScreenInShop, 0xc000);

    BG_EnableSyncByMask(8);

    LoadUiFrameGraphics();
    ResetText();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    BonusClaim_DrawChapterTitle();
    BonusClaim_DrawMainWindowFrame();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 2;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 56;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 136;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitBonusClaimData();

    for (i = 0; i <= 5 && i < *gpBonusClaimItemCount; i++) {
        struct Text* th = gpBonusClaimText + i * 2;
        InitText(th, 7);
        th++;
        InitText(th, 10);
        DrawBonusClaimItemText(i);
    }

    for (i = 0; i < 2; i++) {
        InitText(gpBonusClaimText + 12 + i, 6);
    }

    InitText(gpBonusClaimText + 14, 15);

    StartParallelWorker(PutChapterBannerSprites, proc);

    BG_EnableSyncByMask(2);

    SetPrimaryHBlankHandler(BonusClaim_HBlankHandler);

    proc->menuIndex = 0;
    proc->unk_2c = 0;
    proc->unk_2e = 0;
    proc->submenuIndex = 0;
    proc->targets = 2;

    proc->unk_34 = NULL;

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    StartGreenText(proc);

    StartMenuScrollBar(proc);

    PutMenuScrollBarAt(200, 0x40);

    InitMenuScrollBarImg(0x200, 2);

    UpdateMenuScrollBarConfig(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    StartUiCursorHand(proc);

    SetupBonusClaimTargets(proc);

    LoadHelpBoxGfx((void*)0x06013800, 5);

    return;
}
