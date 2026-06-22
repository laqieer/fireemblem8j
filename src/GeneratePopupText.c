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

void GeneratePopupText(const struct PopupInstruction *inst, struct Text th)
{
    char str[0x10];
    struct Text text = th;

    for ( ;JP_POPUP_OP_END != inst->opcode; inst++) {
        switch (inst->opcode) {
        case JP_POPUP_OP_NUM:
            NumberToStringAscii(gPopupNumber, str);
            Text_DrawString(&text, str);
            break;

        case JP_POPUP_OP_WTYPE_ICON:
        case JP_POPUP_OP_ITEM_ICON:
            Text_Skip(&text, 0x10);
            break;

        case JP_POPUP_OP_COLOR:
            Text_SetColor(&text, inst->data);
            break;

        case JP_POPUP_OP_MSG:
            Text_DrawString(&text, GetStringFromIndex(inst->data));
            break;

        case JP_POPUP_OP_STR:
            Text_DrawString(&text, (char*)inst->data);
            break;

        case JP_POPUP_OP_UNIT_NAME:
            Text_DrawString(&text, GetStringFromIndex(gpPopupUnit->pCharacterData->nameTextId));
            break;

        case JP_POPUP_OP_ITEM_NAME:
            Text_DrawString(&text, GetItemName(gPopupItem));
            break;

        case JP_POPUP_OP_SPACE:
            Text_Skip(&text, inst->data);

        default:
            break;
        } /* switch opcode */
    } /* while opcode */

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}
