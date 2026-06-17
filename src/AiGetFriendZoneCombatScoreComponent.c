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
extern struct RangeScore  sFriendZoneRangeScoreLut[];
extern struct AiCombatScoreCoefficients * sCombatScoreCoefficients;

int AiGetFriendZoneCombatScoreComponent(void)
{
    struct RangeScore * it;
    int score = 0;

    for (it = sFriendZoneRangeScoreLut; it->x != 0x7f; it++) {
        u8 x = gBattleActor.unit.xPos + it->x;
        u8 y = gBattleActor.unit.yPos + it->y;

        u8 uid = gBmMapUnit[y][x];

        if (x >= gBmMapSize.x) {
            continue;
        }

        if (y >= gBmMapSize.y) {
            continue;
        }

        if (uid == 0) {
            continue;
        }

        if (AreUnitsAllied(gBattleActor.unit.index, uid) == 1) {
            score += it->score;
        }
    }

    score = sCombatScoreCoefficients->coeffFriendZone * score;

    if (score > 10) {
        score = 10;
    }

    return score;
}
