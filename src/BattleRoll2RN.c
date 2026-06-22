#include "global.h"

#include "rng.h"
#include "bmbattle.h"

//! FE8U = 0x0802A4C0
s8 BattleRoll2RN(u16 threshold, s8 simResult) {
    int sim = simResult;

    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return sim;

    return Roll2RN(threshold);
}
