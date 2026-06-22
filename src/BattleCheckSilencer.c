#include "global.h"

#include "constants/classes.h"

#include "rng.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "variables.h"

s8 BattleCheckSilencer(struct BattleUnit* attacker, struct BattleUnit* defender) {
    if (defender->unit.pClassData->number == CLASS_DEMON_KING)
        return FALSE;

    if (BattleRoll1RN(gBattleStats.silencerRate, FALSE) == TRUE)
        return TRUE;

    return FALSE;
}
