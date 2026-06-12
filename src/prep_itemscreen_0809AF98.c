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
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];







/* prototypes for same-file helpers called by this run */
void HideUnitInfoBgSprites(void);
void PrepItemScreen_DrawFunds(void);
void PutPrepItemScreenPromptText(u16 * tilemap);
void PutWmItemScreenPromptText(u16 * tilemap);
void PrepItem_EndPopupBoxWorkers(void);
void PutImg_PrepItemUseUnk(int vram, int pal);
void PutImg_PrepPopupWindow(int vram, int pal);
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp);
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags);
void PrepItem_SnapGridScroll(struct PrepItemScreenProc * proc);
void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc * proc, u8 flag);

//! FE8U = 0x08098CC0
void PrepItem_DrawUnitGridScreen(struct PrepItemScreenProc * proc)
{
    LoadUiFrameGraphics();

    BG_SetPosition(BG_1, 0, 4);

    PrepItem_SnapGridScroll(proc);

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);
    PutImg_PrepPopupWindow(0x40 * CHR_SIZE, 10);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, TILEREF(0x0, 1));
    ApplyPalette(gUiFramePaletteD, 2);

    UpdatePrepItemScreenFace(
        0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);

    if (gGMData.state.bits.state_0)
    {
        PutWmItemScreenPromptText(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 8));
    }
    else
    {
        PutPrepItemScreenPromptText(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 10));
    }

    proc->unitSelected = false;

    ShowSysHandCursor(
        (proc->hoverUnitIdx % 3) * 64 + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x40 * CHR_SIZE);

    PrepItemScreen_DrawVisibleUnitNames(proc, 0);
    UnblockUiCursorHand();
    ClearAllUiCursorHandConfig();
    StartHelpPromptSprite(120, 140, 9, proc);

    PrepItem_EndPopupBoxWorkers();

    if (gGMData.state.bits.state_0)
    {
        StartParallelWorker(PrepItem_DrawPromptBoxGMap, proc);
    }
    else
    {
        StartParallelWorker(PrepItem_DrawPromptBox, proc);
    }

    PrepItemScreen_DrawFunds();
    HideUnitInfoBgSprites();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}
