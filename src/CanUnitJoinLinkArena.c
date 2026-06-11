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

//! FE8U = 0x08097E38
s8 CanUnitJoinLinkArena(struct Unit* unit) {

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return 0;
    }

    if (!ArenaIsUnitAllowed(unit)) {
        return 0;
    }

    if (CountUnitUsableWeapons(unit) == 0) {
        return 0;
    }

    return 1;
}
