#include "global.h"

#include "fontgrp.h"
#include "popup.h"

/* JP popup definition (region-different layout vs US). Opcodes follow the JP enum
 * in include/popup.h.
 *
 * Total: 8 records = 64 bytes. (The former trailing {14, 0} word was NOT a popup
 * record but the first ProcCmd of the adjacent ProcScr_GotItem @0x085BA094; that
 * table is now carved as a typed struct in src/data/ProcScr_GotItem148_ref/, so
 * this symbol no longer over-spans into it.) */

SECTION(".rodata.dat_PopupScr_ItemWasPilfered_ref") struct PopupInstruction PopupScr_ItemWasPilfered[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_ICON,
    POPUP_ITEM_NAME,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x808),
    POPUP_END,
};
