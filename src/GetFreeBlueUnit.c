#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmmap.h"
#include "bmitem.h"

struct Unit* GetFreeBlueUnit(const struct UnitDefinition* uDef) {
    int i, last = 0x40;

    // This is ?? and is completely useless but it's required to produce matching asm
    if (uDef->charIndex == GetPlayerLeaderPid())
        ++i;

    for (i = 1; i < last; ++i) {
        struct Unit* unit = gUnitLookup[i & 0xFF];

        if (unit->pCharacterData == NULL)
            return unit;
    }

    return NULL;
}
