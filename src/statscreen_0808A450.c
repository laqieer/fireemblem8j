/* TU-private data externs bound at their JP addresses */
enum
{
    // Magical constants

    // Neutral left arrow position
    PAGENUM_LEFTARROW_X = 103,
    PAGENUM_LEFTARROW_Y = 3,

    // Neutral right arrow position
    PAGENUM_RIGHTARROW_X = 217,
    PAGENUM_RIGHTARROW_Y = 3,

    // initial arrow offset on select
    PAGENUM_SELECT_XOFF = 6,

    // arrow animation speeds
    PAGENUM_ANIMSPEED = 4,
    PAGENUM_SELECT_ANIMSPEED = 31,

    PAGENUM_DISPLAY_X = 215,
    PAGENUM_DISPLAY_Y = 17,

    // name animation scaling time
    PAGENAME_SCALE_TIME = 6,
};
#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void PageNumCtrl_CheckSlide(struct StatScreenPageNameProc* proc)
{
    if (gStatScreen.pageSlideKey & DPAD_LEFT)
    {
        proc->animSpeedLeft = PAGENUM_SELECT_ANIMSPEED;
        proc->xLeftCursor = PAGENUM_LEFTARROW_X - PAGENUM_SELECT_XOFF;
    }

    if (gStatScreen.pageSlideKey & DPAD_RIGHT)
    {
        proc->animSpeedRight = PAGENUM_SELECT_ANIMSPEED;
        proc->xRightCursor = PAGENUM_RIGHTARROW_X + PAGENUM_SELECT_XOFF;
    }

    gStatScreen.pageSlideKey = 0;
}

void PageNumCtrl_UpdateArrows(struct StatScreenPageNameProc* proc)
{
    int baseref = TILEREF(0x240, STATSCREEN_OBJPAL_4) + OAM2_LAYER(1);

    proc->animTimerLeft  += proc->animSpeedLeft;
    proc->animTimerRight += proc->animSpeedRight;

    if (proc->animSpeedLeft > PAGENUM_ANIMSPEED)
        proc->animSpeedLeft--;

    if (proc->animSpeedRight > PAGENUM_ANIMSPEED)
        proc->animSpeedRight--;

    if ((GetGameClock() % 4) == 0)
    {
        if (proc->xLeftCursor < PAGENUM_LEFTARROW_X)
            proc->xLeftCursor++;

        if (proc->xRightCursor > PAGENUM_RIGHTARROW_X)
            proc->xRightCursor--;
    }

    PutSprite(0,
        gStatScreen.xDispOff + proc->xLeftCursor,
        gStatScreen.yDispOff + PAGENUM_LEFTARROW_Y,
        gObject_8x16, baseref + 0x5A + (proc->animTimerLeft >> 5) % 6);

    PutSprite(0,
        gStatScreen.xDispOff + proc->xRightCursor,
        gStatScreen.yDispOff + PAGENUM_RIGHTARROW_Y,
        gObject_8x16_HFlipped, baseref + 0x5A + (proc->animTimerRight >> 5) % 6);
}

void PageNumCtrl_UpdatePageNum(struct StatScreenPageNameProc* proc)
{
    int chr = 0x289;

    // page amt
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X + 13,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_LAYER(3) + gStatScreen.pageAmt);

    // '/'
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X + 7,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_LAYER(3));

    // page num
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_LAYER(3) + gStatScreen.page + 1);
}

void PageNumCtrl_DisplayMuPlatform(struct StatScreenPageNameProc* proc)
{
    PutSprite(11,
        gStatScreen.xDispOff + 64,
        gStatScreen.yDispOff + 131,
        gObject_32x16, TILEREF(0x28F, STATSCREEN_OBJPAL_4) + OAM2_LAYER(3));
}

void PageNumCtrl_DisplayBlinkIcons(struct StatScreenPageNameProc* proc)
{
    s8 displayIcon = (GetGameClock() % 32) < 20;

    u16 palidLut[3] = { 0xC, 0xE, 0xD }; // TODO: palid constants

    if (!gStatScreen.inTransition)
    {
        if ((gStatScreen.page == STATSCREEN_PAGE_0) && (gStatScreen.unit->state & US_RESCUING))
        {
            UpdateStatArrowSprites(120, 40, 1);
            UpdateStatArrowSprites(120, 56, 1);

            if (displayIcon)
            {
                PutSprite(4,
                    184, 78, gObject_8x8,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescue >> 6]) + OAM2_LAYER(2));
            }
        }

        if (gStatScreen.unit->state & US_RESCUED)
        {
            if (displayIcon)
            {
                PutSprite(4,
                    10, 86, gObject_8x8,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescue>>6]) + OAM2_LAYER(2));
            }
        }
    }
}

void StatScreen_BlackenScreen(void)
{
    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    SetBlendConfig(3, 0, 0, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendBackdropA(1);
    SetBlendBackdropB(0);

    // TODO: ResetBackdropColor macro?
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}

void StatScreen_InitDisplay(struct Proc* proc)
{
    u16 bgConfig[12] =
    {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x8000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

    SetupBackgrounds(bgConfig);

    UnpackUiFramePalette(STATSCREEN_BGPAL_EQUIPMENT_FRAME_AND_HIGHLIGHT);
    RegisterBlankTile(0x400);

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    LoadGameCoreGfxLegacyFrame();
    ApplyUnitSpritePalettes();

    // TODO: port the macros from mapanim wip

    gLCDControlBuffer.dispcnt.win0_on   = TRUE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    gLCDControlBuffer.win0_left   = 96;
    gLCDControlBuffer.win0_top    = 0;
    gLCDControlBuffer.win0_right  = 98;
    gLCDControlBuffer.win0_bottom = 160;

    gLCDControlBuffer.wincnt.win0_enableBg0 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg1 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg2 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableObj = TRUE;

    gLCDControlBuffer.wincnt.wout_enableBg0 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg1 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg2 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableObj = TRUE;

    gLCDControlBuffer.wincnt.win0_enableBlend = TRUE;
    gLCDControlBuffer.wincnt.win1_enableBlend = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBlend = TRUE;

    // Load and display Halo

    Decompress(
        Img_StatscreenHalo, (void*)(VRAM + 0x220 * 0x20));

    ApplyPalette(Pal_StatscreenHalo, STATSCREEN_BGPAL_HALO);

    Decompress(
        Tsa_StatscreenHalo, gGenericBuffer);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(12, 0),
        gGenericBuffer, TILEREF(0x220, STATSCREEN_BGPAL_HALO));

    // Load and display Background

    Decompress(
        Img_StatscreenBG, (void*)(VRAM + 0x580 * 0x20));

    ApplyPalettes(Pal_StatscreenBG, STATSCREEN_BGPAL_BACKGROUND, 4);

    Decompress(Tsa_StatscreenBG, gGenericBuffer);

    CallARM_FillTileRect(gBG3TilemapBuffer, gGenericBuffer,
        TILEREF(0x180, 12));

    // Load object graphics

    Decompress(
        Img_StatscreenObjs, (void*)(VRAM + 0x10000 + 0x240 * 0x20));

    LoadIconPalettes(STATSCREEN_BGPAL_ITEMICONS);

    UnpackUiBarPalette(STATSCREEN_BGPAL_6);

    LoadIconPalette(1, 0x13);

    Decompress(
        gUnkData_32, (void*)(VRAM + 0x440 * 0x20));

    ApplyPalette(Pal_StatscreenEquipmentText, STATSCREEN_BGPAL_EQUIPMENT_LABEL);

    LoadIconPalette(1, 0x14);

    Decompress(
        Img_StatscreenEquipmentText, (void*)(VRAM + 0x60 * 0x20));

    gStatScreen.mu = NULL;

    ClearSlide(proc);
}

void StatScreen_Display(struct Proc* proc)
{
    // Get portrait id

    int fid = GetUnitPortraitId(gStatScreen.unit);

    if (gStatScreen.unit->state & US_BIT23)
        fid++;

    // Set page amount (in FE6, this was dependant on whether this is ally or enemy)
    gStatScreen.pageAmt = STATSCREEN_PAGE_MAX;

    // Init text and icons

    ResetText();
    ResetIconGraphics_();

    InitTexts();

    // Display portrait

    PutFace80x72(proc, gBG2TilemapBuffer + TILEMAP_INDEX(1, 1), fid,
        0x4E0, STATSCREEN_BGPAL_FACE);

    if (GetPortraitData(fid)->img)
        ApplyPalette(gUnkData_30, STATSCREEN_BGPAL_2);
    else
        ApplyPalette(gUnkData_31, STATSCREEN_BGPAL_2);

    // Display Map Sprite

    EndAllMus();
    gStatScreen.mu = StartUiMu(gStatScreen.unit, 80, 138);

    // Draw left panel labels and info

    DisplayLeftPanel();

    // Draw page content

    DisplayPage(gStatScreen.page);

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);
    TileMap_CopyRect(gUiTmScratchC, gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void StatScreen_OnIdle(struct Proc* proc)
{
    struct Unit* unit;

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        gLCDControlBuffer.dispcnt.bg0_on = TRUE;
        gLCDControlBuffer.dispcnt.bg1_on = FALSE;
        gLCDControlBuffer.dispcnt.bg2_on = TRUE;
        gLCDControlBuffer.dispcnt.bg3_on = TRUE;
        gLCDControlBuffer.dispcnt.obj_on = TRUE;

        SetBlendConfig(3, 0, 0, 0x10);

        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendBackdropA(1);

        // TODO: ResetBackdropColor macro?
        gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
        EnablePaletteSync();

        Proc_Break(proc);

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1); // TODO: song ids
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt - 1) % gStatScreen.pageAmt;
        StartPageSlide(DPAD_LEFT, gStatScreen.page, proc);
        return;
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt + 1) % gStatScreen.pageAmt;
        StartPageSlide(DPAD_RIGHT, gStatScreen.page, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        unit = FindNextUnit(gStatScreen.unit, -1);
        StartUnitSlide(unit, -1, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        unit = FindNextUnit(gStatScreen.unit, +1);
        StartUnitSlide(unit, +1, proc);
    }

    else if ((gKeyStatusPtr->repeatedKeys & A_BUTTON) && (gStatScreen.unit->rescue))
    {
        unit = GetUnit(gStatScreen.unit->rescue);
        StartUnitSlide(unit, (gStatScreen.unit->state & US_RESCUING) ? +1 : -1, proc);
    }

    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        Proc_Goto(proc, 0); // TODO: label name
        StartStatScreenHelp(gStatScreen.page, proc);
    }
}

void StatScreen_OnClose(void)
{
    gPlaySt.chapterStateBits = (gPlaySt.chapterStateBits &~ 3) | (gStatScreen.page & 3);
    sStatScreenInfo.unitId = gStatScreen.unit->index;

    SetInterrupt_LCDVCountMatch(NULL);

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

void StatScreen_ResumeFromHelp(void)
{
    gStatScreen.help = GetLastHelpBoxInfo();
}

void BgOffCtrl_OnLoop(void)
{
    int yBg = 0xFF & -gStatScreen.yDispOff;

    BG_SetPosition(0, 0, yBg);
    BG_SetPosition(2, 0, yBg);
}

void StartStatScreen(struct Unit* unit, ProcPtr parent)
{
    gStatScreen.xDispOff = 0;
    gStatScreen.yDispOff = 0;
    gStatScreen.page = gPlaySt.chapterStateBits & 3;
    gStatScreen.unit = unit;
    gStatScreen.help = NULL;
    gStatScreen.pageSlideKey = 0;
    gStatScreen.inTransition = FALSE;

    PidStatsAddStatViewAmt(unit->pCharacterData->number);

    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1); // TODO: song ids

    Proc_StartBlocking(gProcScr_StatScreen, parent);
}

void StartStatScreenHelp(int pageid, struct Proc* proc)
{
    LoadHelpBoxGfx(NULL, -1); // default

    if (!gStatScreen.help)
    {
        switch (pageid)
        {

        case STATSCREEN_PAGE_0:
            gStatScreen.help = &gHelpInfo_Ss0Pow;
            break;
        
        case STATSCREEN_PAGE_1:
            gStatScreen.help = &gHelpInfo_Ss1Item0;
            break;

        case STATSCREEN_PAGE_2:
            gStatScreen.help = &gHelpInfo_Ss2Rank0;
            break;

        } // switch (pageid)
    }

    StartMovingHelpBox(gStatScreen.help, proc);
}

void HbPopulate_SSItem(struct HelpBoxProc* proc)
{
    int item = gStatScreen.unit->items[proc->info->mid];

    proc->item = item;
    proc->mid  = GetItemDescId(item);
}
