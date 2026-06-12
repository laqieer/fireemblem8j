extern int CheckInLinkArena();
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

//! FE8U = 0x08097EA0
s8 CheckValidLinkArenaItemSwap(struct Unit* unitA, int itemSlotA, struct Unit* unitB, int itemSlotB) {

    if (unitA == unitB) {
        return 1;
    }

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (!(unitA->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitA, unitA->items[itemSlotA]) != 0) {
            if (CountUnitUsableWeapons(unitA) <= 1) {
                if (IsWeaponUsable(unitA, unitB->items[itemSlotB]) == 0) {
                    return 0;
                }
            }
        }
    }

    if (!(unitB->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitB, unitB->items[itemSlotB]) != 0) {
            if (CountUnitUsableWeapons(unitB) <= 1) {
                if (IsWeaponUsable(unitB, unitA->items[itemSlotA]) == 0) {
                    return 0;
                }
            }
        }
    }

    return 1;
}
