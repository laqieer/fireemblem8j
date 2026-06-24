#include "global.h"

#include "fontgrp.h"
#include "popup.h"

/* JP popup opcode enum (differs from US ordering: no ITEM_STR_CAP / ITEM_STR) */
enum
{
    JP_POPUP_OP_END,         /* 0 */
    JP_POPUP_OP_SPACE,       /* 1 */
    JP_POPUP_OP_ITEM_NAME,   /* 2 */
    JP_POPUP_OP_UNIT_NAME,   /* 3 */
    JP_POPUP_OP_MSG,         /* 4 */
    JP_POPUP_OP_STR,         /* 5 */
    JP_POPUP_OP_COLOR,       /* 6 */
    JP_POPUP_OP_ITEM_ICON,   /* 7 */
    JP_POPUP_OP_WTYPE_ICON,  /* 8 */
    JP_POPUP_OP_NUM,         /* 9 */
    JP_POPUP_OP_SOUND        /* 10 */
};

extern struct PopupInstruction gPopupInst[4];

//! FE8U = 0x08086928
void NewPopup_VerySimple(u32 msg, u32 sound_index, ProcPtr parent)
{
    gPopupInst[0].opcode = JP_POPUP_OP_SOUND;
    gPopupInst[0].data   = sound_index;

    gPopupInst[1].opcode = JP_POPUP_OP_COLOR;
    gPopupInst[1].data   = TEXT_COLOR_SYSTEM_WHITE;

    gPopupInst[2].opcode = JP_POPUP_OP_MSG;
    gPopupInst[2].data   = msg;

    gPopupInst[3].opcode = JP_POPUP_OP_END;
    gPopupInst[3].data   = 0;

    NewPopup_Simple(gPopupInst, 0x60, 0x0, parent);
}
