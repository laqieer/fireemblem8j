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

//! FE8U = 0x08098014
int GetPrepPageForItem(int item) {
    int i;

    for (i = 0; i < 9; i++) {
        int itemType = GetItemType(item);

        if (itemType < gPrepItemTypePageLut[i].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[i].upperBound) {
            continue;
        }

        return i;
    }

    return 8;
}
