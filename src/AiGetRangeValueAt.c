#include "global.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"

u8 AiGetRangeValueAt(int x, int y) {

    if (gMapRangeSigned[y][x] >= MAP_MOVEMENT_MAX) {
        return -1;
    }

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId)) {
        return -1;
    }

    return gBmMapRange[y][x];
}
