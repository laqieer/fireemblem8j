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

//! FE8U = 0x080982B8
void RebuildConvoyFromPrepList(void) {
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < gPrepscreen_1; i++) {
        if (gPrepScreenItemList[i].pid != 0) {
            continue;
        }

        if (gPrepScreenItemList[i].item == 0) {
            continue;
        }

        AddItemToConvoy(gPrepScreenItemList[i].item);
    }

    return;
}
