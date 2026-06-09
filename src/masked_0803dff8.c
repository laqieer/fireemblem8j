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

static const struct AiCombatScoreCoefficients * sCombatScoreCoefficients;

/* file-scope type definitions used by this run */


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

//! FE8U = 0x0803E068
int AiGetTargetClassCombatScoreComponent(void)
{
    u8 rank = AiGetClassRank(gBattleTarget.unit.pClassData->number);

    int score;

    score = sCombatScoreCoefficients->classRankBonuses[rank];
    score = sCombatScoreCoefficients->coeffClassRankBonus * score;

    if (score > 20)
        score = 20;

    return score;
}

//! FE8U = 0x0803E09C
int AiGetTurnCombatScoreComponent(void)
{
    int ret = gPlaySt.chapterTurnNumber;

    ret *= sCombatScoreCoefficients->coeffTurnNumber;
    return ret;
}
