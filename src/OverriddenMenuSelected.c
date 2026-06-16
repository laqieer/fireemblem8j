#include "global.h"
#include "uimenu.h"

extern struct MenuItemOverride sMenuOverrides[];

u8 OverriddenMenuSelected(struct MenuProc* proc, struct MenuItemProc* item)
{
    struct MenuItemOverride* it = sMenuOverrides;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ONSELECT)
            continue;

        if (it->cmdid != item->def->overrideId)
            continue;

        return ((MenuSelectFunc)(it->func))(proc, item);
    }

    return 0xFF;
}
