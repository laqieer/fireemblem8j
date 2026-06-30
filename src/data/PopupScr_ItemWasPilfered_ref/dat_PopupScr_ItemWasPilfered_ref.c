#include "global.h"

#include "fontgrp.h"
#include "popup.h"

/* JP popup definition (region-different layout vs US). Opcodes follow the JP enum
 * in include/popup.h.
 *
 * The extracted PopupScr_ItemWasPilfered.bin over-spanned by 8 bytes into the
 * adjacent data_085BA09C residue (a single {14, 0} word that is NOT a popup
 * record). It is reproduced here as a raw struct literal after the POPUP_END so
 * the symbol stays byte-identical to the blob without disturbing the layout.
 * Total: 9 records = 72 bytes. */

SECTION(".rodata.dat_PopupScr_ItemWasPilfered_ref") struct PopupInstruction PopupScr_ItemWasPilfered[] = {
    POPUP_SOUND(0x5C),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_ICON,
    POPUP_ITEM_NAME,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x808),
    POPUP_END,

    /* data_085BA09C prefix (not a popup record): raw {opcode=14, data=0} */
    {14, 0},
};
