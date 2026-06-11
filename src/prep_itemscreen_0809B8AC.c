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
void PrepItem_EndPopupBoxWorkers(void);
void PutImg_PrepItemUseUnk(int vram, int pal);
void PutImg_PrepPopupWindow(int vram, int pal);
void PrepItem_DrawCommandMenuText(struct PrepItemScreenProc * proc, u16 * tilemap, struct Unit * unit);
void PrepItemScreen_DrawSelectedUnitDetails(struct PrepItemScreenProc * proc);
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags);
bool IsCoordHiddenByMinimug(u32 x, int y);
void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc * proc, u8 flag);

//! FE8U = 0x080995D4
void PrepItem_DrawSelectedUnitScreen(struct PrepItemScreenProc * proc)
{
    bool isCoordHidden;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 9), 12, 20, 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);
    PutImg_PrepPopupWindow(0x40 * CHR_SIZE, 10);
    PrepItemScreen_DrawSelectedUnitDetails(proc);

    isCoordHidden = IsCoordHiddenByMinimug(((proc->selectedUnitIdx % 3) * 64) + 20, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset);

    if (isCoordHidden)
    {
        BlockUiCursorHand();
    }
    else
    {
        UnblockUiCursorHand();
    }

    PrepItem_EndPopupBoxWorkers();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08099654
void PrepItem_InitCommandMenu(struct PrepItemScreenProc * proc)
{
    PrepItem_DrawCommandMenuText(proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
    StartParallelWorker(PrepItem_DrawCommandMenuBox, proc);
    StartHelpPromptSprite(120, 140, 9, proc);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 32 + 144, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x20 * CHR_SIZE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080996B0
void PrepItem_RefreshSelectedUnitItems(struct PrepItemScreenProc * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    PrepItemScreen_DrawVisibleUnitNames(proc, 0);
    PrepItemScreen_DrawUnitItems(&gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), unit, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
