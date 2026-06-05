

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

//! FE8U = 0x0809B538
void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB)
{
    u16 itemTmp = unitA->items[itemSlotA];
    unitA->items[itemSlotA] = unitB->items[itemSlotB];
    unitB->items[itemSlotB] = itemTmp;

    UnitRemoveInvalidItems(unitA);
    UnitRemoveInvalidItems(unitB);

    return;
}

//! FE8U = 0x0809B564
s8 PrepItemTrade_DpadKeyHandler(struct PrepMenuTradeProc * proc)
{
    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        int itemCount;

        if ((proc->cursorItemSlot & 8) == 0) {
            return 0;
        }

        itemCount = GetUnitItemCount(proc->units[0]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if (itemCount <= 0) {
            return 0;
        }

        if (itemCount > (proc->cursorItemSlot & 7)) {
            proc->cursorItemSlot = proc->cursorItemSlot - 8;
        } else {
            proc->cursorItemSlot = itemCount - 1;
        }

        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);

        return 1;
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        int itemCount;

        if ((proc->cursorItemSlot & 8) != 0) {
            return 0;
        }

        itemCount = GetUnitItemCount(proc->units[1]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if (itemCount <= 0) {
            return 0;
        }

        if (itemCount > (proc->cursorItemSlot & 7)) {
            proc->cursorItemSlot = proc->cursorItemSlot + 8;
        } else {
            proc->cursorItemSlot = itemCount + 7;
        }

        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);

        return 1;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);

        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if ((proc->cursorItemSlot & 7) > 0) {
            proc->cursorItemSlot--;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }

        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->cursorItemSlot = (proc->cursorItemSlot & 8) + itemCount - 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if ((proc->cursorItemSlot & 7) < itemCount - 1) {
            proc->cursorItemSlot++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }

        if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->cursorItemSlot = proc->cursorItemSlot & 8;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }

    }

    return 0;
}
