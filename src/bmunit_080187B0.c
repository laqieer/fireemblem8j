#include "global.h"

#include <string.h>

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"

extern EWRAM_DATA u8 gActiveUnitId;
extern EWRAM_DATA struct Vec2 gActiveUnitMoveOrigin;

extern EWRAM_DATA struct Unit gUnitArrayBlue[62]; // Player units
extern EWRAM_DATA struct Unit gUnitArrayRed[50]; // Red units
extern EWRAM_DATA struct Unit gUnitArrayGreen[20]; // Purple units





int GetUnitKeyItemSlotForTerrain(struct Unit* unit, int terrain) {
    int slot, item = 0;

    if (UNIT_CATTRIBUTES(unit) & CA_THIEF) {
        int slot = GetUnitItemSlot(unit, ITEM_LOCKPICK);

        if (slot >= 0)
            return slot;
    }

    switch (terrain) {

    case TERRAIN_CHEST_FULL:
        slot = GetUnitItemSlot(unit, ITEM_CHESTKEY);

        if (slot < 0)
            slot = GetUnitItemSlot(unit, ITEM_CHESTKEY_BUNDLE);

        return slot;

    case TERRAIN_DOOR:
        item = ITEM_DOORKEY;
        break;

    } // switch (terrain)

    return GetUnitItemSlot(unit, item);
}
