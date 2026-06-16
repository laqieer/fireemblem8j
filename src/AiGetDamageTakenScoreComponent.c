#include "global.h"
#include "cp_common.h"
#include "bmbattle.h"
#include "cp_data.h"

extern const struct AiCombatScoreCoefficients * sCombatScoreCoefficients;

int AiGetDamageTakenScoreComponent(void)
{
    int score;

    if (gBattleTarget.weapon == 0)
        return -10;

    score = (gBattleTarget.battleAttack - gBattleActor.battleDefense);
    score = gBattleTarget.battleEffectiveHitRate * score;

    if (score < 0)
        score = 0;

    score = Div(score, 100);
    score = sCombatScoreCoefficients->coeffDamageTaken * score;

    if (score > 40) {
        score = 40;
    }

    return score;
}
