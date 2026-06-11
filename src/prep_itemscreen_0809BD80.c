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
void PrepItem_EndPopupBoxWorkers(void);
void PutImg_PrepItemUseUnk(int vram, int pal);
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc * proc);
void PrepItem_UpdateGridScroll(struct PrepItemScreenProc * proc);
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp);
void EndPrepItemScreenFace(int slot);
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags);
void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc * proc, u8 flag);

//! FE8U = 0x08099AA0
void PrepItem_TradeRedrawItems(struct PrepItemScreenProc * proc)
{
    BG_Fill(BG_GetMapBuffer(BG_0), 0);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);
    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[20], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08099AF8
void PrepItem_InitTradeScreen(struct PrepItemScreenProc * proc)
{
    BG_SetPosition(BG_1, 0, 4);

    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    TileMap_FillRect(gBG0TilemapBuffer, 31, 8, 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0, 0), gGenericBuffer, TILEREF(0x0, 1));

    Decompress(Tsa_UnkData_4, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 15, 9), gGenericBuffer, TILEREF(0x0, 1));

    proc->unitSelected = false;

    ShowSysHandCursor(
        ((proc->hoverUnitIdx % 3) * 64) + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x40 * CHR_SIZE);
    PrepItemScreen_DrawVisibleUnitNames(proc, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    UpdatePrepItemScreenFace(
        0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
    UpdatePrepItemScreenFace(
        1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76,
        FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);

    SetUiCursorHandConfig(
        0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);

    StartParallelFiniteLoop(PrepItem_TradeRedrawItems, 1, proc);

    UnblockUiCursorHand();
    HideUnitInfoBgSprites();
    EndHelpPromptSprite();

    return;
}

//! FE8U = 0x08099C60
void PrepItem_EndPopupBoxesAndSync(void)
{
    PrepItem_EndPopupBoxWorkers();
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return;
}

//! FE8U = 0x08099C70
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc)
{
    int tmp = proc->scrollOffset;

    if (!(tmp & 15))
    {
        if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            int itemCountA = GetUnitItemCount(GetUnitFromPrepList(proc->hoverUnitIdx));
            int itemCountB = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));

            if ((proc->hoverUnitIdx != proc->selectedUnitIdx) && ((itemCountA > 0) || (itemCountB > 0)))
            {
                Proc_Goto(proc, 6);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }

            PlaySoundEffect(SONG_6C);

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            EndPrepItemScreenFace(1);
            Proc_Goto(proc, 2);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0)
        {
            UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76, 0x0502);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[20], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx),
                2);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
                GetUnitFromPrepList(proc->selectedUnitIdx), 1);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    PrepItem_UpdateGridScroll(proc);

    return;
}
