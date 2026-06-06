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

//! FE8U = 0x0803DD84
s8 AiSimulateBestBallistaBattleAgainstTarget(struct AiCombatSimulationSt* st, u16 item) {
    int ix;
    int iy;

    u32 score = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u32 scoreTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gMapMovementSigned[iy][ix] != (u8)item) {
                continue;
            }

            if (gMapRangeSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            scoreTmp = AiGetCombatPositionScore(ix, iy, st);

            if (scoreTmp <= score) {
                continue;
            }

            st->xMove = ix;
            st->yMove = iy;
            score = scoreTmp;
        }
    }

    if (score == 0) {
        return 0;
    }

    return AiSimulateBattleAgainstTargetAtPosition(st);
}

//! FE8U = 0x0803DE5C
u32 AiGetCombatPositionScore(int x, int y, struct AiCombatSimulationSt* st) {
    int score;

    score = AiGetInRangeCombatPositionScoreComponent(x, y, GetUnit(st->targetId));
    score += AiGetTerrainCombatPositionScoreComponent(x, y);
    score += AiGetFriendZoneCombatPositionScoreComponent(x, y);
    score -= gMapMovementSigned[y][x];
    score -= gBmMapOther[y][x] / 8;

    score += 0x7FFFFFFF;

    return score;
}

//! FE8U = 0x0803DEC4
s8 AiIsBadFight(struct AiCombatSimulationSt* st) {
    // In FE6, this is used to check if it is worthwhile to use Eclipse
    return 0;
}

//! FE8U = 0x0803DEC8
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt* st) {
    if (st->itemSlot != 0xFFFF) {
        BattleGenerateSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove, st->itemSlot);
    } else {
        BattleGenerateBallistaSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove);
    }

    if (!AiIsBadFight(st)) {
        AiComputeCombatScore(st);
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803DF34
int AiGetDamageDealtCombatScoreComponent(void)
{
    int score;

    if (gBattleTarget.unit.curHP == 0)
        return 50;

    score = (gBattleActor.battleAttack - gBattleTarget.battleDefense) * gBattleActor.battleEffectiveHitRate;

    if (score < 0)
        score = 0;

    score = Div(score, 100);
    score = sCombatScoreCoefficients->coeffDamageDealt * score;

    if (score > 40)
        score = 40;

    return score;
}

//! FE8U = 0x0803DF94
int AiGetOpponentLowHpScoreComponent(void)
{
    int score;

    score = 20 - gBattleTarget.unit.curHP;
    score = sCombatScoreCoefficients->coeffLowHpOpponent * score;

    if (score < 0)
        score = 0;

    return score;
}
