#include "global.h"

#include "fontgrp.h"
#include "popup.h"

/* JP popup definition (region-different layout vs US): the JP build shows the item
 * icon and name where the US build uses ITEM_STR. Opcodes follow the JP enum in
 * include/popup.h. Byte-identical to the former INCBIN of PopupScr_GotItem.bin. */

SECTION(".rodata.dat_PopupScr_GotItem_ref") struct PopupInstruction PopupScr_GotItem[] = {
    POPUP_SOUND(0x5A),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_BLUE),
    POPUP_ITEM_ICON,
    POPUP_ITEM_NAME,
    POPUP_SPACE(3),
    POPUP_COLOR(TEXT_COLOR_SYSTEM_WHITE),
    POPUP_MSG(0x805),
    POPUP_END,
};
