#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D8C8
u8 SioAttackTypeMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_16.unk_06 = menuItem->itemNumber + 1;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}
