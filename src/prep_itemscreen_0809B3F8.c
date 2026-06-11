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
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc * proc);
void PrepItem_UpdateGridScroll(struct PrepItemScreenProc * proc);
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp);
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags);

//! FE8U = 0x08099120
void PrepItem_GridSelectLoop(struct PrepItemScreenProc * proc)
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
            if (gGMData.state.bits.state_0)
            {
                switch (GetGMapBaseMenuKind())
                {
                case SHOP_TYPE_MANAGE_ITEMS:
                    proc->selectedUnitIdx = proc->hoverUnitIdx;

                    if (((proc->hoverUnitIdx % 3) <= 1) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1))
                    {
                        proc->hoverUnitIdx++;
                    }
                    else
                    {
                        proc->hoverUnitIdx--;
                    }

                    break;

                case SHOP_TYPE_SECRET_SHOP:
                    if (UnitHasItem(GetUnitFromPrepList(proc->hoverUnitIdx), ITEM_MEMBERCARD))
                    {
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 13);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);

                    return;

                default:
                    Proc_Goto(proc, 13);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    return;
                }
            }
            else
            {
                proc->selectedUnitIdx = proc->hoverUnitIdx;

                if (((proc->hoverUnitIdx % 3) < 2) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1))
                {
                    proc->hoverUnitIdx++;
                }
                else
                {
                    proc->hoverUnitIdx--;
                }
            }

            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, (proc->selectedUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 2);

            Proc_Goto(proc, 2);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            if (gGMData.state.bits.state_0)
            {
                proc->unk_29 = 1;
            }

            Proc_Goto(proc, 13);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0)
        {
            UpdatePrepItemScreenFace(
                0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76,
                FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx),
                2);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    PrepItem_UpdateGridScroll(proc);

    return;
}
