#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"



extern struct MenuItemOverride sMenuOverrides[MENU_OVERRIDE_MAX];

u8 OverriddenMenuAvailability(const struct MenuItemDef* def, int number)
{
    struct MenuItemOverride* it = sMenuOverrides;

    for (; it->kind != 0; ++it)
    {
        if (it->kind != MENU_OVERRIDE_ISAVAILABLE)
            continue;

        if (it->cmdid != def->overrideId)
            continue;

        return ((MenuAvailabilityFunc)(it->func))(def, number);
    }

    return 0;
}
