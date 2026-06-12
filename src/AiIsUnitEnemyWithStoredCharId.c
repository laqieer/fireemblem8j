#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"
/* TU-private data externs bound at their JP addresses */
extern u8 gUnkData_0;

//! FE8U = 0x0803F5E0
s8 AiIsUnitEnemyWithStoredCharId(struct Unit* unit) {

    if (unit->pCharacterData->number != gUnkData_0) {
        return 0;
    }

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}
