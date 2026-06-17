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


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};
extern struct Vec2  sRange3OffsetLut_[];

int AiGetFriendZoneCombatPositionScoreComponent(int x, int y) {
    struct Vec2* it;

    int score = 0;

    for (it = sRange3OffsetLut_; it->x != 9999; it++) {
        if (gBmMapUnit[y + it->y][x + it->x] == 0) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[y + it->y][x + it->x]) == 1) {
            score += 5;
        } else {
            score -= 5;
        }
    }

    return score;
}
