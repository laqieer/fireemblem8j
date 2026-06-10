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

extern const s16 gLinkArenaBanList[];

//! FE8U = 0x08097E74
s8 CanUnitBeDeployedLinkArena(struct Unit* unit) {
    u32 i;

    for (i = 0; i < 0xb; i++) {
        if (unit->pCharacterData->number == gLinkArenaBanList[i]) {
            return 0;
        }
    }

    return 1;
}
