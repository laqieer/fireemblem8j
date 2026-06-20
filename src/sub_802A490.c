#include "global.h"

#include "bmbattle.h"
#include "rng.h"

s8 BattleRoll1RN(u16 threshold, s8 simResult)
{
    int sim = simResult;

    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return sim;

    return Roll1RN(threshold);
}
