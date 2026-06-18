#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc)
{
    int i;

    struct FaceVramEntry faceConfig[4] =
    {
        {
            0x2C0 * CHR_SIZE,
            6,
        },
        {
            0x340 * CHR_SIZE,
            7,
        },
        {
            0,
            0,
        },
        {
            0,
            0,
        },
    };

    SetupBackgrounds(gBgConfig_ItemUseScreen);

    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    SetupFaceGfxData(faceConfig);

    SetDispEnable(0, 0, 0, 0, 0);

    SetupDebugFontForOBJ((u32)OBJ_CHR_ADDR(0x3C0), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetText();

    ResetIconGraphics_();
    LoadIconPalettes(4);

    LoadUiFrameGraphics();
    ApplyPalette(gUiFramePaletteD, 2);

    LoadObjUIGfx();

    MakePrepUnitList();
    proc->hoverUnitIdx = UnitGetIndexInPrepList(PrepGetLatestCharId());

    ResetSysHandCursor(proc);
    StartParallelWorker(PrepItem_PutUnitGridSprites, proc);
    StartUiCursorHand(proc);

    SetPrimaryHBlankHandler(NULL);

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    for (i = 0; i < 15; i++)
    {
        InitText(gPrepItemTexts + i, 5);
    }

    for (i = 0; i < 5; i++)
    {
        InitText(&gPrepItemTexts[15 + i], 7);
        InitText(&gPrepItemTexts[20 + i], 7);
    }

    InitTextDb(&gPrepItemTexts[25], 8);
    InitTextDb(&gPrepItemTexts[26], 8);
    InitText(&gPrepItemTexts[27], 8);
    InitText(&gPrepItemTexts[29], 7);
    InitText(&gPrepItemTexts[30], 5);

    LoadHelpBoxGfx(OBJ_CHR_ADDR(0x200), -1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 4, 240, 68);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    BG_SetPosition(BG_0, 4, -4);
    BG_SetPosition(BG_1, 0, 4);
    BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ApplyUnitSpritePalettes();
    CpuFastFill(RGB_BLACK, PAL_OBJ(11), PLTT_SIZE_4BPP);

    ForceSyncUnitSpriteSheet();

    Decompress(Img_PrepTextShadow, OBJ_CHR_ADDR(0x1F0));
    UiCursorHand_0(0, 0, 0, 208, 60);
    DisplaySysHandCursorTextShadow(0x30 * CHR_SIZE, 1);

    RestartMuralBackground();

    if (proc->selectedUnitIdx != 0xff)
    {
        SetUiCursorHandConfig(
            0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        UpdatePrepItemScreenFace(
            0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76,
            FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
    }

    StartMenuScrollBarExt(proc, 224, 11, 0x200, 4);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    UnlockMenuScrollBar();

    PrepUpdateSMS();

    SetBlendAlpha(8, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    SetPrimaryHBlankHandler(PrepItemScreen_OnHBlank);

    StartDrawPrepFundsSprite(168, 133, 11, proc);
    StartDrawPrepUnitInfoBgSprites(proc);

    return;
}
