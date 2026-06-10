#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

void BattleGenerateHitEffects(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleGenerateHitTriangleAttack(struct BattleUnit* attacker, struct BattleUnit* defender);

s8 BattleGenerateHit(struct BattleUnit* attacker, struct BattleUnit* defender) {
    if (attacker == &gBattleTarget)
        gBattleHitIterator->info |= BATTLE_HIT_INFO_RETALIATION;

    BattleUpdateBattleStats(attacker, defender);

    BattleGenerateHitTriangleAttack(attacker, defender);
    BattleGenerateHitAttributes(attacker, defender);
    BattleGenerateHitEffects(attacker, defender);

    if (attacker->unit.curHP == 0 || defender->unit.curHP == 0) {
        attacker->wexpMultiplier++;

        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

        if (gBattleTarget.unit.curHP != 0) {
            gBattleHitIterator++;
            return TRUE;
        }

        gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

        gBattleHitIterator++;
        return TRUE;
    } else if (defender->statusOut == UNIT_STATUS_PETRIFY || defender->statusOut == UNIT_STATUS_13) {
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

        gBattleHitIterator++;
        return TRUE;
    }

    gBattleHitIterator++;
    return FALSE;
}

void BattleApplyExpGains(void) {
    if ((UNIT_FACTION(&gBattleActor.unit) != FACTION_BLUE) || (UNIT_FACTION(&gBattleTarget.unit) != FACTION_BLUE)) {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)) {
            gBattleActor.expGain  = GetBattleUnitExpGain(&gBattleActor, &gBattleTarget);
            gBattleTarget.expGain = GetBattleUnitExpGain(&gBattleTarget, &gBattleActor);

            gBattleActor.unit.exp  += gBattleActor.expGain;
            gBattleTarget.unit.exp += gBattleTarget.expGain;

            CheckBattleUnitLevelUp(&gBattleActor);
            CheckBattleUnitLevelUp(&gBattleTarget);
        }
    }
}

int GetStatIncrease(int growth) {
    int result = 0;

    while (growth > 100) {
        result++;
        growth -= 100;
    }

    if (Roll1RN(growth))
        result++;

    return result;
}
