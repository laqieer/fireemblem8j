#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off





extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[];









extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



/* prototypes for same-file helpers called by this run */
int ChapterIntro_0(ProcPtr proc, void * vramDst, int palId);

//! FE8U = 0x080200F0
void ChapterIntro_Init(struct ChapterIntroFxProc * proc)
{
    SetupBackgrounds(NULL);

    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 0, 0, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetBackgroundTileDataOffset(BG_2, 0x8000);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0, 0, 0);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    MaybeResetSomePal();

    ColorFadeSetupRange(0, 2, 64, -1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 1;

    Decompress(Img_ChapterIntro_LensFlare, BG_CHR_ADDR(0x400));
    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    BlitU8TileMapData(gBG2TilemapBuffer, Tsa_UnkData_6, 0, 5);

    Decompress(Img_ChapterIntro_Sprites, OBJ_CHR_ADDR(0x200));
    ApplyPalette(Pal_ChapterIntro_Sprites, 18);

    ChapterIntro_0(proc, 0, 14);

    BG_EnableSyncByMask(BG1_SYNC_BIT | BG2_SYNC_BIT);

    proc->isSkipping = 0;

    return;
}
