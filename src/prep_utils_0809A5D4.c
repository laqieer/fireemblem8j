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

//! FE8U = 0x080982FC
void DebugFillConvoyWithItems(void)
{
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        AddItemToConvoy(0x88 - i);
    }

    return;
}
