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

//! FE8U = 0x0803E1EC
int AiGetInRangeCombatPositionScoreComponent(int x, int y, struct Unit* unit) {
    int dist = RECT_DISTANCE(unit->xPos, unit->yPos, x, y);
    int item = (u16)GetUnitEquippedWeapon(unit);

    if (item == 0) {
        return 0;
    }

    if ((dist > GetItemMaxRange(item)) || (dist < GetItemMinRange(item))) {
        return 50;
    }

    return 0;
}
