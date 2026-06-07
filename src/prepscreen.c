#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"












 // maybe there is 0xC*sizeof(u16) free space





/* prototypes for same-file helpers called by this run */
struct Unit *GetUnitFromPrepList(int index);
void RegisterPrepUnitList(int index, struct Unit *unit);
int PrepGetUnitAmount();
void PrepSetUnitAmount(int val);
s8 IsUnitInCurrentRoster(struct Unit *unit);

void RemoveSomeUnitItems()
{
    int i, j, itemNum, removeItem;
    struct Unit *unit;

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        removeItem = 0;
        unit->state |= 8;

        itemNum = GetUnitItemCount(unit);
        if (removeItem < itemNum) {
            for (j = 0; j < itemNum; j++) {
                switch (GetItemIndex(unit->items[j])) {
                case ITEM_SWORD_SHADOWKILLR:
                case ITEM_LANCE_BRIGHTLANCE:
                case ITEM_AXE_FIENDCLEAVER:
                case ITEM_BOW_BEACONBOW:
                case ITEM_JUNAFRUIT:
                case ITEM_UNK_CC:
                    unit->items[j] = 0;
                    removeItem = 1;
                }
            }   
        }

        if (removeItem)
            UnitRemoveInvalidItems(unit);
    }
}

void MakePrepUnitList()
{
    int i, cur = 0;
    struct Unit *unit;
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit)) {
            RegisterPrepUnitList(cur, unit);
            cur++;
        }
    }

    PrepSetUnitAmount(cur);
}

int UnitGetIndexInPrepList(int pid)
{
    int i;
    struct Unit *unit;

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (UNIT_CHAR_ID(unit) == pid)
            return i;
    }
    return 0;
}

void PrepUpdateSMS()
{
    int i, state;
    struct Unit *unit;

    ResetUnitSprites();

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (!(unit->state & 8))
            unit->state &= ~2;
        else
            unit->state |= 0xA;

        UseUnitSprite(GetUnitSMSId(unit));
    }

    ForceSyncUnitSpriteSheet();
}
