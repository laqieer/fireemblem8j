#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

//! JP = 0x0809E794
void PrepItemUse_InitDisplay(struct ProcPrepItemUse *proc)
{
    int i;
    const char *str;

    struct Text *texts;
    struct FaceVramEntry face_config[4] = {
        {0x5800, 0x6},
        {0x6800, 0x7},
        {0x0000, 0x0},
        {0x0000, 0x0}
    };

    gLCDControlBuffer.dispcnt.mode = 0;
    SetupBackgrounds(gBgConfig_ItemUseScreen);
    SetupFaceGfxData(face_config);
    proc->unk34 = 0xFF;

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    ApplyUnitSpritePalettes();

    BG_SetPosition(BG_0, 0,0);
    BG_SetPosition(BG_1, 0,0);
    BG_SetPosition(BG_2, 0,0);

    LoadHelpBoxGfx(OBJ_VRAM1, -1);
    LoadIconPalettes(4);
    RestartMuralBackground();

    for (i = 0; i < 5; i++)
        InitTextDb(&gPrepItemTexts[0xF + i], 7);

    for (i = 0; i < 8; i++)
        InitText(&gPrepItemTexts[TEXT_PREPITEM_HP + i], 3);

    texts = gPrepItemTexts;

    InitText(&texts[TEXT_PREPITEM_CLASS], 8);
    InitText(&texts[25], 15);
    InitText(&texts[26], 15);
    InitText(&texts[27], 12);
    InitText(&texts[28], 8);

    DrawPrepScreenItemUseStatLabels(proc->unit);
    DrawPrepScreenItemUseStatValues(proc->unit);
    DrawPrepScreenItemUseStatBars(proc->unit, 0);

    StartFace2(0, GetUnitPortraitId(proc->unit), 0x40, -4, 0x203);
    PutImg_PrepItemUseUnk(0x6000, 0x5);
    PutImg_PrepPopupWindow(0x800, 0xA);

    Decompress(Img_PrepItemUseScreen, (void *)BG_VRAM + 0x440);
    Decompress(Tsa_PrepItemUseScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartSysBrownBox(0xD, 0xE00, 0xF, 0xC00, 0, proc);
    EnableSysBrownBox(0, -0x28, -1, 1);

    str = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    PutDrawText(
        0, gBG0TilemapBuffer,
        TEXT_COLOR_SYSTEM_WHITE,
        (0x30 - GetStringTextLen(str))/2,
        6, str
    );

    /* Some hand obj API */
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    StartParallelWorker(PrepItemUseParallel_UpdateSMS, proc);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0x68, 0x66, 0xF0, 0x8A);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);
    SetBlendTargetA(0,0,0,1,0);
    StartGreenText(proc);
    StartHelpPromptSprite(0xC0, 0x8C, 9, proc);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &texts[15],
        proc->unit, 1
    );

    ShowSysHandCursor(
        (proc->slot >> 3) * 7 * 0x10 + 0x10,
        (proc->slot & 0x7) * 0x10 + 0x48,
        0xB, 0x800
    );

    UseUnitSprite(GetUnitSMSId(proc->unit));
    ForceSyncUnitSpriteSheet();
}
