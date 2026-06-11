#include "global.h"

#include "cp_common.h"

#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"

#include "constants/items.h"
#include "constants/terrains.h"

#include "cp_utility.h"

// forward decl.
s8 AiGetChestUnlockItemSlot(u8*);
void SetupUnitStatusStaffAIFlags(struct Unit*, u16);
void SetupUnitHealStaffAIFlags(struct Unit*, u16);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit*);



/* prototypes for same-file helpers called by this run */
s8 AiGetChestUnlockItemSlot(u8* out);
void SetupUnitHealStaffAIFlags(struct Unit* unit, u16 item);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit* unit);

//! FE8U = 0x0803C014
s8 AiLocationIsPillageTarget(u8 x, u8 y) {
    u8 tmp;

    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_VILLAGE_REGULAR:
            return 1;

        case TERRAIN_CHURCH:
            return 1;

        case TERRAIN_RUINS_VILLAGE:
            return 1;

        case TERRAIN_CHEST_FULL:
            if (AiGetChestUnlockItemSlot(&tmp) == 1) {
                return 1;
            }

            return 0;
    }

    return 0;
}

//! FE8U = 0x0803C064
void SetupUnitInventoryAIFlags(void) {
    int i;
    int j;

    gAiState.bestBlueMov = 0;

    for (i = 1; i < 0x40; i++) {
        u8 mov;
        int item;

        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        mov = UNIT_MOV(unit);

        if (mov > gAiState.bestBlueMov) {
            gAiState.bestBlueMov = mov;
        }

        for (j = 0; ((j < UNIT_ITEM_COUNT) && (item = unit->items[j])); j++) {

            if (!CanUnitUseWeapon(unit, item) && !CanUnitUseStaff(unit, item)) {
                continue;
            }

            if (GetItemAttributes(item) & IA_MAGIC) {
                unit->aiFlags |= AI_UNIT_FLAG_0;
            }

            SetupUnitStatusStaffAIFlags(unit, item);
            SetupUnitHealStaffAIFlags(unit, item);
        }

        SaveNumberOfAlliedUnitsIn0To8Range(unit);
    }

    return;
}

//! FE8U = 0x0803C120
void SetupUnitStatusStaffAIFlags(struct Unit* unit, u16 item) {
    u8 flags;

    if (!(GetItemAttributes(item) & IA_STAFF)) {
        return;
    }

    flags = AI_UNIT_FLAG_1;

    switch (GetItemIndex(item)) {
        case ITEM_STAFF_SILENCE:
            flags = AI_UNIT_FLAG_3;

            break;

        case ITEM_STAFF_SLEEP:
            flags = AI_UNIT_FLAG_4;

            break;

        case ITEM_STAFF_BERSERK:
            flags = AI_UNIT_FLAG_5;

            break;
    }

    unit->aiFlags |= flags;

    return;
}
