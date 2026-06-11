#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809E2C8
void PrepItemSupply_TakeItemFromSupply(struct PrepItemSupplyProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (gPrepscreen_2 == 0)) {
        PlaySoundEffect(SONG_6C);
        return;
    }

    proc->unk_38 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    RebuildConvoyFromPrepList();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_ClampScroll(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawItemList(
        &PrepItemSuppyTexts.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );

    StartParallelFiniteLoop(PrepItemSupply_RedrawConvoyHeaderWorker, 1, proc);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    gActionData.unitActionType = UNIT_ACTION_TRADED_SUPPLY;

    if (GetUnitItemCount(proc->unit) == UNIT_ITEM_COUNT) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    } else {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }

    return;
}

//! FE8U = 0x0809E420
void PrepItemSupply_Loop_ItemListKeyHandler(struct PrepItemSupplyProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0) {
        if ((proc->unk_38 == 0) || (proc->unk_38 == 0xff)) {
            if (gKeyStatusPtr->newKeys & R_BUTTON) {
                if (gPrepscreen_2 != 0) {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                    proc->unk_38 = 1;
                    return;
                } else {
                    PlaySoundEffect(SONG_6C);
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                PrepItemSupply_TakeItemFromSupply(proc);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Goto(proc, 1);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                proc->unk_38 = 0;
                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                CloseHelpBox();
                proc->unk_38 = 0;
                return;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            SetUiSpinningArrowFastMaybe(0);
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            Proc_Goto(proc, 5);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageLeft(proc);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            Proc_Goto(proc, 6);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageRight(proc);
            return;
        }

        if (gKeyStatusPtr->heldKeys & L_BUTTON) {
            proc->scrollAmount = 8;
        } else {
            proc->scrollAmount = 4;
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) ||
            ((gKeyStatusPtr->heldKeys & DPAD_UP) && (proc->scrollAmount == 8))) {
            if (proc->idxPerPage[proc->currentPage] != 0) {
                proc->idxPerPage[proc->currentPage]--;
            }
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) ||
            ((gKeyStatusPtr->heldKeys & DPAD_DOWN) && (proc->scrollAmount == 8))) {
            if (proc->idxPerPage[proc->currentPage] < gPrepscreen_2 - 1) {
                proc->idxPerPage[proc->currentPage]++;
            }
        }
    } else {
        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) < 0x38) {
            proc->yOffsetPerPage[proc->currentPage] -= proc->scrollAmount;
        }

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) > 0x78) {
            proc->yOffsetPerPage[proc->currentPage] += proc->scrollAmount;
        }

        BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
    }

    if (idx != proc->idxPerPage[proc->currentPage]) {
        u16 item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) && (proc->idxPerPage[proc->currentPage] != 0)) {
            if (proc->unk_38 != 0) {
                StartItemHelpBox(
                    0x80,
                    proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] + 16,
                    item
                );
            }

            PrepItemSupply_ScrollVertical(proc, -proc->scrollAmount);
        } else {
            if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78)
                && (proc->idxPerPage[proc->currentPage] != gPrepscreen_2 - 1)) {

                if (proc->unk_38 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] - 0x10,
                        item
                    );
                }
                PrepItemSupply_ScrollVertical(proc, +proc->scrollAmount);
            } else {
                if (proc->unk_38 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                }

                ShowSysHandCursor(
                    0x80,
                    proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                    0xb,
                    0x800
                );
            }
        }
    }

    return;
}

//! FE8U = 0x0809E7A8
s8 PrepItemSupply_HandleUnitInvCursorInput(struct PrepItemSupplyProc * proc)
{

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx != 0) {
            proc->unitInvIdx--;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unitInvIdx = count - 1;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
                return 1;
            }
        }

        return 0;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx < count - 1) {
            proc->unitInvIdx++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unitInvIdx = 0;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
                return 1;
            }
        }
    }

    return 0;
}
