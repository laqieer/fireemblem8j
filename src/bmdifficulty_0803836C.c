#include "global.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

void SetupDungeonRecordUi(ProcPtr proc) {
    int i;

    SetupBackgrounds(gBgConfig_SaveMenu);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    LoadLegacyUiFrameGraphics();

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    // Load and display background

    SetBlendConfig(1, 6, 16, 0);

    Decompress(Img_SaveMenuBG, (void *)BG_VRAM + GetBackgroundTileDataOffset(3));

    ApplyPalettes(Pal_SaveMenuBG, 8, 8);

    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);

    // Load and display fog overlay

    Decompress(Img_MainMenuBgFog, (void *)(BG_VRAM + 0x4C00) + GetBackgroundTileDataOffset(2));

    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);

    ApplyPalette(Pal_MainMenuBgFog, 7);

    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x7260);

    // Load and display "Combat Record" graphic

    Decompress(gUnkData_27, (void *)(BG_VRAM + 0x4000) + GetBackgroundTileDataOffset(1));

    Decompress(gUnkData_28, gBG1TilemapBuffer);

    ApplyPalettes(gUnkData_29, 2, 2);

    for (i = 0; i < 0x280; i++) {
        gBG1TilemapBuffer[i] = gBG1TilemapBuffer[i] + 0x2200;
    }

    DungeonRecordUi_InitText();

    DrawDungeonRecordUiText(proc);

    BG_EnableSyncByMask(0xF);

    StartSaveBgFog(gBmdifficulty_0);

    CpuFastSet(PAL_BG(BGPAL_BMDIFFICULTY_UNK_0), PAL_OBJ(OBPAL_BMDIFFICULTY_UNK_5), 8);

    return;
}
