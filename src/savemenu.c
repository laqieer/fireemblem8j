#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"

#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

extern u16 gEndingTmScratchA[];



// TODO: Implicit declaration
int LoadBonusContentData(void *);

/* prototypes for same-file helpers called by this run */
void SaveMenuPutChapterTitle(struct SaveMenuProc * proc);
void SaveMenuCopyPalette(u16 * src, u16 * dst, int count);

//! FE8U = 0x080AA1EC
void SaveMenu_ResetLcdFormDifficulty(struct SaveMenuProc * proc)
{
    proc->scroll_cnt = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;
}

//! FE8U = 0x080AA248
void SaveMenuOpenWindowBox(struct SaveMenuProc * proc)
{
    int unkA;
    int unkB;

    proc->scroll_cnt++;

    unkA = (0x10 - proc->scroll_cnt);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0x50 - (unkB);
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = unkB + 0x50;

    if (proc->scroll_cnt == 0x10) {
        Proc_Break(proc);
    }
}

//! FE8U = 0x080AA2A8
void SaveMenuCloseWindowBox(struct SaveMenuProc * proc)
{
    int unkA;
    int unkB;

    proc->scroll_cnt++;

    unkA = (0x10 - proc->scroll_cnt);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = unkB;
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = -0x60 - unkB;

    if (proc->scroll_cnt == 0x10) {
        Proc_Break(proc);
    }
}

//! FE8U = 0x080AA30C
void SaveMenu_ReloadScreenFormDifficulty(struct SaveMenuProc * proc)
{

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    ResetTextFont();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    ApplyPalettes(Pal_SaveMenuBG, 8, 8);

    Decompress(Img_SaveMenuBG, (void*)(GetBackgroundTileDataOffset(3) + VRAM));
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);
    ApplyPalette(Pal_MainMenuBgFog, 7);

    Decompress(Img_MainMenuBgFog, (void*)(GetBackgroundTileDataOffset(3) + 0x06004C00));

    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x00007260);

    Decompress(Img_SaveScreenSprits, (void*)0x06010800);
    ApplyPalettes(Pal_SaveScreenSprits, 0x12, 8);
    ApplyPalette(Pal_MenuMainObjs_0, 2);

    SaveMenuCopyPalette(PAL_OBJ(0x2), PAL_OBJ(0x2) - 0x10, 1);
    Decompress(Img_GameMainMenuObjs, OBJ_VRAM0 + OBJCHR_SAVEMENU_MAINCHOICE_STR * TILE_SIZE_4BPP);

    SaveMenuInitSubBoxText();
    SaveMenuPutChapterTitle(proc);
    SaveMenuInitSlotPalette(proc->sus_slot);

    Proc_UnblockEachMarked(PROC_MARK_SAVEDRAW);
    Proc_UnblockEachMarked(PROC_MARK_D);

    BG_EnableSyncByMask(3);

    if (proc->difficulty != 3) {
        proc->jump_label = PL_SAVEMENU_SAVE_SLOT_SEL;
        proc->unk_2f = 0xdc;
    }

    EnablePaletteSync();
}
