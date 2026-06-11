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

//! FE8U = 0x0803C490
void AiGenerateUnitMovementMapRespectStay(struct Unit* unit) {

    if (gAiState.flags & AI_FLAG_STAY) {
        GenerateUnitMovementMapExt(unit, 0);
    } else {
        GenerateUnitMovementMap(unit);
    }

    return;
}
