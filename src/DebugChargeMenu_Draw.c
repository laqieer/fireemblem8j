#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "constants/msg.h"

/* JP-divergent reconstruction (FE8J 0x0801C14C).
 *
 * Unlike fe8u (which uses MSG_* indices via GetStringFromIndex), the JP debug
 * "charge / control" menu draws its labels from direct Shift-JIS string pointers
 * baked into rodata at 0x080DC724 (control-type table) and 0x080DC730/0x080DC738
 * (faction names). They are aliased here as extern data symbols.
 */

struct DebugControlTypeStrTable
{
    const char * strs[3];
};

extern const struct DebugControlTypeStrTable sDebugControlTypeStr; /* 0x080DC724: "ＣＰ" "人間" "不参加" */
extern const char Str_DebugGreenArmy[];                            /* 0x080DC730: "緑軍" */
extern const char Str_DebugRedArmy[];                             /* 0x080DC738: "赤軍" */

//! FE8U = 0x0801C4D0
int DebugChargeMenu_Draw(struct MenuProc* param_1, struct MenuItemProc* menuItemProc)
{
    int state;
    struct DebugControlTypeStrTable controlTypeStr = sDebugControlTypeStr;

    if (menuItemProc->itemNumber != 0)
    {
        state = gPlaySt.config.debugControlGreen;
    }
    else
    {
        state = gPlaySt.config.debugControlRed;
    }

    ClearText(&menuItemProc->text);

    Text_InsertDrawString(&menuItemProc->text, 8, 0,
        menuItemProc->itemNumber != 0 ? Str_DebugGreenArmy : Str_DebugRedArmy);
    Text_InsertDrawString(&menuItemProc->text, 0x20, 2, controlTypeStr.strs[state]);

    PutText(&menuItemProc->text,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}
