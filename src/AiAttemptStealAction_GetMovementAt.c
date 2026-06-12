#include "global.h"
#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"
#include "constants/items.h"

//! FE8U = 0x0803DB08
u8 AiAttemptStealAction_GetMovementAt(int x, int y) {

    if (gMapMovementSigned[y][x] >= MAP_MOVEMENT_MAX) {
        return -1;
    }

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId)) {
        return -1;

    }

    return gBmMapMovement[y][x];
}
