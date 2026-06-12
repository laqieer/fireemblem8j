extern int CanUnitUseItemPrepScreen();
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"
#include "constants/characters.h"
#include "prepscreen.h"

//! FE8U = 0x0809839C
s8 CanUnitPrepScreenUse(struct Unit* unit) {
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        u16 item = unit->items[i];

        if (CanUnitUseItemPrepScreen(unit, item)) {
            return 1;
        }
    }

    return 0;
}
