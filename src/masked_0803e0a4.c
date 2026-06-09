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

/* prototypes for same-file helpers called by this run */
int AiGetDamageDealtCombatScoreComponent(void);
int AiGetOpponentLowHpScoreComponent(void);
int AiGetFriendZoneCombatScoreComponent(void);
int AiGetTargetClassCombatScoreComponent(void);
int AiGetTurnCombatScoreComponent(void);
int AiGetDamageTakenScoreComponent(void);

//! FE8U = 0x0803E114
int AiGetDangerScoreComponent(void)
{
    int score;

    score = gBmMapOther[gBattleActor.unit.yPos][gBattleActor.unit.xPos] / 8;
    score = sCombatScoreCoefficients->coeffDanger * score;

    if (score > 20)
        score = 20;

    return score;
}

//! FE8U = 0x0803E150
int AiGetLowHpScoreComponent(void)
{
    int score;

    score = 20 - gBattleActor.unit.curHP;
    score = sCombatScoreCoefficients->coeffLowHpSelf * score;

    if (score < 0)
        score = 0;

    return score;
}

//! FE8U = 0x0803E178
void AiComputeCombatScore(struct AiCombatSimulationSt * st)
{
    int score;
    int backup;

    sCombatScoreCoefficients = gAiCombatScoreCoefficientTable + gAiState.combatWeightTableId;

    score = AiGetDamageDealtCombatScoreComponent();
    backup = score;

    score += AiGetOpponentLowHpScoreComponent();
    score += AiGetFriendZoneCombatScoreComponent();
    score += AiGetTargetClassCombatScoreComponent();
    score += AiGetTurnCombatScoreComponent();
    score -= AiGetDamageTakenScoreComponent();
    score -= AiGetDangerScoreComponent();
    score -= AiGetLowHpScoreComponent();

    if (score < 0) {
        score = 0;
    }

    if (score != 0) {
        score = score * 40;
    } else {
        score = backup;
    }

    st->score = score;

    return;
}
