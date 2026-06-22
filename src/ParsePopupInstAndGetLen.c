#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"

/* JP popup opcode enum (differs from US: no ITEM_STR_CAP / ITEM_STR) */
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

extern struct Unit * gpPopupUnit;
extern u16 gPopupItem;
extern u32 gPopupNumber;

int ParsePopupInstAndGetLen(struct PopupProc * proc)
{
    char str[0x10];
    int len = 0;
    const struct PopupInstruction *inst;

    for (inst = proc->pDefinition; JP_POPUP_OP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case JP_POPUP_OP_SOUND:
            proc->soundId = inst->data;
            break;

        case JP_POPUP_OP_NUM:
            len += NumberToStringAscii(gPopupNumber, str) * 8;
            break;

        case JP_POPUP_OP_ITEM_ICON:
            proc->iconX = len;
            proc->iconId = GetItemIconId(gPopupItem);
            LoadIconPalette(0, proc->iconPalId);
            len += 0x10;
            break;

        case JP_POPUP_OP_WTYPE_ICON:
            proc->iconX = len;
            proc->iconId = gPopupItem + 0x70;
            LoadIconPalette(1, proc->iconPalId);
            len += 0x10;
            break;

        case JP_POPUP_OP_MSG:
            len += GetStringTextLen(
                GetStringFromIndex(inst->data));
            break;

        case JP_POPUP_OP_STR:
            len += GetStringTextLen((char*)inst->data);
            break;

        case JP_POPUP_OP_UNIT_NAME:
            len += GetStringTextLen(
                GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case JP_POPUP_OP_ITEM_NAME:
            len += GetStringTextLen(
                GetItemName(gPopupItem));
            break;

        case JP_POPUP_OP_SPACE:
            len += inst->data;
            break;

        case JP_POPUP_OP_COLOR:
        default:
            break;
        } /* switch inst */
    } /* for inst */

    return len;
}
