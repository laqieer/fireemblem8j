#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

/* prototypes for same-file helpers called by this run */
void ParsePrepMenuDescTexts(int msg);
void DrawPrepMenuDescTexts();
void LoadPrepBannerGfx(int tile, int pal);

void AtMenu_Reinitialize(struct ProcAtMenu* proc)
{
    int i;

    SetupBackgrounds(gBgConfig_ItemUseScreen);
    ResetText();
    LoadUiFrameGraphics();
    LoadHelpBoxGfx(NULL, 0xE);
    SetDispEnable(0, 0, 0, 0, 0);
    LoadObjUIGfx();
    ResetUnitSprites();
    
    MakePrepUnitList();
    PrepAutoCapDeployUnits(proc);
    ReorderPlayerUnitsBasedOnDeployment();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    for (i = 0; i < 5; i++)
        InitText(&gPrepMainMenuTexts[i + 5], 0xE);
    for (i = 0; i < 4; i++)
        InitText(&gPrepMainMenuTexts[i + 1], 0x8);
    InitText(&gPrepMainMenuTexts[0], 0xA);

    /* "Preparations" */
    Decompress(gUnkData_65, (void*)0x6014800);
    /* "Menu", "Start" button */
    Decompress(gUnkData_79, (void*)0x6016000);
    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);
    
    LoadPrepBannerGfx(0x7000, 0x6);
    ApplyPalette(gUnkData_78, 0x14);
    EnablePaletteSync();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on  = 0;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    InitPrepScreenMainMenu(proc);
    BG_EnableSyncByMask(0xF);
    SetDefaultColorEffects();

    StartPrepScreenSpriteDraw(proc);
    RestartMuralBackground();
    ApplyPalettes(gUiFramePaletteB, 0x2, 3);

    if (CheckInLinkArena()) {
        Decompress(gUnkData_68, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 5), gGenericBuffer, 0x1000);
    } else {
        Decompress(gUnkData_67, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x10, 2), gGenericBuffer, 0x1000);
        Decompress(gUnkData_68, gGenericBuffer);
        CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 6), gGenericBuffer, 0x1000);
    }

    Prep_DrawChapterGoal(0x5800, 0xB);
    NewSysBlackBoxHandler(proc);
    SysBlackBoxSetGfx(0x6800);
    proc->unk_35 = GetActivePrepMenuItemIndex();
    ParsePrepMenuDescTexts(Prep_GetActiveMenuItemTextId());
    DrawPrepMenuDescTexts();
}
