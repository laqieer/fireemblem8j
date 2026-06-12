#include "global.h"
#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"
#include "ending_details.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x080B8014
void TurnRecord_SetupGfx(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendAlpha(6, 0x10);

    Decompress(Img_SaveMenuBG, (void *)(BG_VRAM + (GetBackgroundTileDataOffset(BG_3))));
    ApplyPalettes(Pal_SaveMenuBG, 8, 8);
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, TILEREF(0, 8));

    Decompress(Img_MainMenuBgFog, BG_CHR_ADDR(0x260) + GetBackgroundTileDataOffset(BG_2));
    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);
    ApplyPalette(Pal_MainMenuBgFog, 7);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x260, 7));

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG3_SYNC_BIT);

    StartSaveBgFog(gEndingDetailBuf);
    StartBgm(SONG_EPILOGUE, 0);

    return;
}
