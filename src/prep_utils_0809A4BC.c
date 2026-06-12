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
void SortPrepScreenItemsByPage(int page);

//! FE8U = 0x080981E4
void SomethingPrepListRelated(struct Unit* pUnit, int page, int flags) {
    struct PrepScreenItemListEnt* pPrepItemList = gPrepScreenItemList;

    gPrepscreen_1 = 0;

    if (flags & 2) {
        int i;
        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
            int j;
            int itemCount;
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            if (unit == pUnit) {
                continue;
            }

            itemCount = GetUnitItemCount(unit);

            for (j = 0; j < itemCount; j++) {
                pPrepItemList->pid = unit->pCharacterData->number;
                pPrepItemList->item = unit->items[j];
                pPrepItemList->itemSlot = j;
                pPrepItemList++;

                gPrepscreen_1++;
            }
        }
    }

    if (flags & 1) {
        int j;
        u16* convoy = GetConvoyItemArray();

        for (j = 0; j < CONVOY_ITEM_COUNT && convoy[j] != 0; j++) {
            pPrepItemList->item = convoy[j];
            pPrepItemList->pid = 0;
            pPrepItemList->itemSlot = j;
            pPrepItemList++;

            gPrepscreen_1++;
        }
    }

    SortPrepScreenItemsByPage(page);

    return;
}
