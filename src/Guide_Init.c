extern int BuildGuideChapterList();
extern int BuildGuideTopicList();
extern int PutGuideBottomBarText();
extern int StartMenuScrollBarExt();
extern int UnlockMenuScrollBar();
extern int UpdateMenuScrollBarConfig();
#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u8 Img_UnkData_2[];
extern u8 Img_UnkData_3[];
extern u16 Pal_UnkData_3[];
extern u8 Tsa_UnkData_5[];
extern struct GuideSt * gGuideSt;
extern struct ProcCmd gProcScr_Guide_DrawSprites[];

void BuildAndPutGuideEntryList(void);
void PutGuideCategoryList(void);

// clang-format on

//! FE8U = 0x080CECB0
void Guide_Init(ProcPtr proc)
{
    int i = 0;

    SetupBackgrounds(NULL);

    gGuideSt->state = GUIDE_STATE_0;

    gGuideSt->sortMode = CheckFlag(0xb3);

    gGuideSt->categoryIdx = 0;
    gGuideSt->unk_2a = 0;
    gGuideSt->unk_2b = 0;
    gGuideSt->unk_2c = 0;

    BuildGuideTopicList();
    BuildGuideChapterList();
    LoadUiFrameGraphics();

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    ApplyPalette(Pal_UnkData_3, 0x12);
    Decompress(Img_UnkData_3, (void *)0x06011000);
    Decompress(Img_UnkData_2, (void *)0x06011800);

    Decompress(Tsa_UnkData_5, gGenericBuffer + 0x100);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x100, 0x1000);

    ApplyPalette(gUiFramePaletteA + (gPlaySt.config.windowColor + 4) * 0x10, 2);

    ResetTextFont();

    InitText(&gGuideSt->unk_ec, 22);

    PutGuideBottomBarText();

    InitText(&gGuideSt->unk_ac, 9);
    InitText(&gGuideSt->unk_e4, 18);

    for (i = 0; i < 6; i++)
    {
        InitText(&gGuideSt->unk_7c[i], 9);
        InitText(&gGuideSt->unk_b4[i], 18);
    }

    PutGuideCategoryList();
    BuildAndPutGuideEntryList();

    StartMuralBackgroundExt(proc, 0, 18, 2, 0);
    Proc_Start(gProcScr_Guide_DrawSprites, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    StartMenuScrollBarExt(proc, 224, 47, 0x800, 4);
    UpdateMenuScrollBarConfig(10, gGuideSt->unk_2c * 16, gGuideSt->unk_3e, 6);

    UnlockMenuScrollBar();

    return;
}
