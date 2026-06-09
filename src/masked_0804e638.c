#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D8A4
u8 SioWeaponSelectMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        return MENU_ACT_SND6B;
    }

    gUnk_Sio_16.unk_07 = menuItem->itemNumber;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;
}
