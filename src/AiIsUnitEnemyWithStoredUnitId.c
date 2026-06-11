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

//! FE8U = 0x0803F680
s8 AiIsUnitEnemyWithStoredUnitId(struct Unit* unit) {

    if (unit->index != gAiState.cmd_result[0]) {
        return 0;
    }

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}
