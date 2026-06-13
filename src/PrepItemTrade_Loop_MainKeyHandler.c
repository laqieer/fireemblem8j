#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "icon.h"
#include "bmitemuse.h"
#include "face.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "sysutil.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "constants/songs.h"

void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB);

//! FE8U = 0x0809BB34
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc* proc) {
    int item;

    if (proc->helpBoxItemSlot != 0xff) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            CloseHelpBox();
            proc->helpBoxItemSlot = 0xff;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
            if (item == 0) {
                return;
            }
            StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);
            proc->helpBoxItemSlot = proc->cursorItemSlot;
            return;
        }

        if (proc->selectedItemSlot != 0xff) {
            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                int itemCount;

                if (CheckValidLinkArenaItemSwap(proc->units[proc->selectedItemSlot >> 3], proc->selectedItemSlot & 7, proc->units[proc->cursorItemSlot >> 3], proc->cursorItemSlot & 7) == 0) {
                    StartPrepErrorHelpbox(-1, -1, 0x6FC, proc); // TODO: msgid "If you have no usable[.][NL]weapons, you cannot attack.[.]"
                    return;
                }

                PrepItemTrade_ApplyItemSwap(
                    proc->units[proc->selectedItemSlot >> 3],
                    proc->selectedItemSlot & 7,
                    proc->units[proc->cursorItemSlot >> 3],
                    proc->cursorItemSlot & 7
                );

                DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gPrepItemTexts + 15, proc->units[0], 0);
                DrawPrepScreenItems(gBG0TilemapBuffer + 0x122 + 0xe, gPrepItemTexts + 20, proc->units[1], 0);

                BG_EnableSyncByMask(1);

                itemCount = GetUnitItemCount(proc->units[proc->selectedItemSlot >> 3]);
                if (itemCount == 0) {
                    proc->selectedItemSlot = (proc->selectedItemSlot + 8) & 8;
                } else if (itemCount <= (proc->selectedItemSlot & 7)) {
                    proc->selectedItemSlot = ((proc->selectedItemSlot & 8) + itemCount) - 1;
                }

                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                ClearUiCursorHandConfig(0);
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

                PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

                ClearUiCursorHandConfig(0);

                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                int itemCount = GetUnitItemCount(proc->units[((proc->cursorItemSlot >> 3) + 1) & 1]);
                proc->selectedItemSlot = proc->cursorItemSlot;
                SetUiCursorHandConfig(0, (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0);
                if (itemCount < 5) {
                    proc->cursorItemSlot = ((proc->cursorItemSlot + 8) & 8) + itemCount;
                } else {
                    proc->cursorItemSlot = (proc->cursorItemSlot + 8) & 0xf;
                }

                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Break(proc);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                return;
            }
        }
    }

    if (PrepItemTrade_DpadKeyHandler(proc) == 0) {
        return;
    }

    ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

    if (proc->helpBoxItemSlot == 0xff) {
        return;
    }

    item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
    if (item == 0) {
        return;
    }

    StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);

    proc->helpBoxItemSlot = proc->cursorItemSlot;

    return;
}
