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




 // Purple units





/* prototypes for same-file helpers called by this run */
int GetUnitItemCount(struct Unit* unit);

void UnitLoadSupports(struct Unit* unit) {
    int i, count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; ++i)
        unit->supports[i] = GetUnitSupporterInitialExp(unit, i);
}

void UnitAutolevelWExp(struct Unit* unit, const struct UnitDefinition* uDef) {
    if (uDef->autolevel) {
        int i;

        for (i = 0; i < GetUnitItemCount(unit); ++i) {
            int wType, item = unit->items[i];

            if (!(GetItemAttributes(item) & IA_REQUIRES_WEXP))
                continue;

            if (GetItemAttributes(item) & IA_WEAPON)
                if (CanUnitUseWeapon(unit, item))
                    continue;

            if (GetItemAttributes(item) & IA_STAFF)
                if (CanUnitUseStaff(unit, item))
                    continue;

            if (GetItemAttributes(item) & IA_LOCK_ANY)
                continue;

            wType = GetItemType(item);

            if (unit->ranks[wType] == 0)
                item = 0;

            unit->ranks[wType] = GetItemRequiredExp(item);
        }
    }
}

void UnitAutolevelCore(struct Unit* unit, u8 classId, int levelCount) {
    if (levelCount) {
        unit->maxHP += GetAutoleveledStatIncrease(unit->pClassData->growthHP,  levelCount);
        unit->pow   += GetAutoleveledStatIncrease(unit->pClassData->growthPow, levelCount);
        unit->skl   += GetAutoleveledStatIncrease(unit->pClassData->growthSkl, levelCount);
        unit->spd   += GetAutoleveledStatIncrease(unit->pClassData->growthSpd, levelCount);
        unit->def   += GetAutoleveledStatIncrease(unit->pClassData->growthDef, levelCount);
        unit->res   += GetAutoleveledStatIncrease(unit->pClassData->growthRes, levelCount);
        unit->lck   += GetAutoleveledStatIncrease(unit->pClassData->growthLck, levelCount);
    }
}
