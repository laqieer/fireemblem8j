#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"

//! FE8U = 0x0803C818
s8 AiIsUnitEnemy(struct Unit* unit) {

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}
