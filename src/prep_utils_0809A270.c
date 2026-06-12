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

int CheckInLinkArena(void);

/* prototypes for same-file helpers called by this run */
s8 IsWeaponUsable(struct Unit * unit, int item);
int CountUnitUsableWeapons(struct Unit * unit);

//! FE8U = 0x08097F98
s8 CheckValidLinkArenaItemRemoval(struct Unit* unit, int itemSlot) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!IsWeaponUsable(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (CountUnitUsableWeapons(unit) != 1) {
        return 1;
    }

    return 0;
}
