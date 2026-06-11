#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"
#include "sio.h"

//! FE8U = 0x0804D858
u8 SioWeaponSelectMenu_Usability(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if ((GetItemAttributes(item) & IA_WEAPON) == 0)
    {
        return MENU_NOTSHOWN;
    }

    if (GetItemMinRange(item) > 2)
    {
        return MENU_DISABLED;
    }

    if (!CanUnitUseWeapon(gActiveUnit, item))
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}
