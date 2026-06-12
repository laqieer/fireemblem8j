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

//! FE8U = 0x0803AE3C
u8 AiGetPositionRange(int x, int y) {

    if (gMapRangeSigned[y][x] >= MAP_MOVEMENT_MAX) {
        return 0xFF;
    }

    if (gBmMapUnit[y][x] != 0 && gBmMapUnit[y][x] != gActiveUnitId) {
        return 0xFF;
    }

    return gBmMapRange[y][x];
}
