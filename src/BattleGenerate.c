#include "global.h"
#include "bmbattle.h"
#include "bmmind.h"

void BattleGenerate(struct Unit* actor, struct Unit* target) {
    ComputeBattleUnitStats(&gBattleActor, &gBattleTarget);
    ComputeBattleUnitStats(&gBattleTarget, &gBattleActor);

    ComputeBattleUnitEffectiveStats(&gBattleActor, &gBattleTarget);
    ComputeBattleUnitEffectiveStats(&gBattleTarget, &gBattleActor);

    if (target == NULL)
        ComputeBattleObstacleStats();

    if ((gBattleStats.config & BATTLE_CONFIG_REAL) && (gActionData.scriptedBattleHits))
        BattleUnwindScripted();
    else
        BattleUnwind();
}
