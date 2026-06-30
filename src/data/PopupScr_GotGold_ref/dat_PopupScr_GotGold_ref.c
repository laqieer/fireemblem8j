#include "global.h"

#include "fontgrp.h"
#include "popup.h"

/* JP popup definition. Opcodes follow the JP enum in include/popup.h.
 *
 * In the JP ROM, PopupScr_GoldWasStole is laid out immediately after this script
 * with no padding, so the extracted PopupScr_GotGold.bin over-spanned by 16 bytes
 * (the first two records of PopupScr_GoldWasStole). To stay byte-identical to that
 * blob without disturbing the surrounding layout, those two records are emitted
 * here after the POPUP_END; the rest of PopupScr_GoldWasStole continues in the
 * adjacent data_085BA10C residue. Total: 9 records = 72 bytes. */

SECTION(".rodata.dat_PopupScr_GotGold_ref") struct PopupInstruction PopupScr_GotGold[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_NUM,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x804),
    POPUP_END,

    /* --- PopupScr_GoldWasStole begins here (continues in data_085BA10C) --- */
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
};
