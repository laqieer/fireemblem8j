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



//! FE8U = 0x08020B30
void ChapterIntro_InitMapDisplay(void)
{
    int var;

    SetDispEnable(1, 1, 1, 1, 1);

    SetBlendAlpha(16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    SetBlendBackdropB(1);

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    DisableMapPaletteAnimations();

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);

    ApplyUnitSpritePalettes();
    LoadObjUIGfx();

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosX;
    var = GetCameraCenteredX(var * 16);
    var = (var + 0xF) & 0x1F0;
    gBmSt.camera.x = var;

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosY;
    var = GetCameraCenteredY(var * 16);
    var = (var + 0xF) & 0x3F0;
    gBmSt.camera.y = var;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}
