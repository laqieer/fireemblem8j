#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809FA88
s8 PrepItemList_MoveUnitInvCursor(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);
    u8 unitInvSlot = proc->unitInvIdx;

    int maxSlot = count;
    if (count == UNIT_ITEM_COUNT) {
        maxSlot = 4;
    } else {
        if (proc->unk_36 != 0) {
            maxSlot = count - 1;
        }
    }

    if (count != 0) {
        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            if (proc->unitInvIdx != 0) {
                proc->unitInvIdx--;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_UP) {
                    proc->unitInvIdx = maxSlot;
                }
            }
        }
        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            if (proc->unitInvIdx < maxSlot) {
                proc->unitInvIdx++;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                    proc->unitInvIdx = 0;
                }
            }
        }

        if (unitInvSlot != proc->unitInvIdx) {
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        }
    }

    return 0;
}
