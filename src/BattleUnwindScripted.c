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


struct WeaponTriangleRule {
    s8 attackerWeaponType;
    s8 defenderWeaponType;
    s8 hitBonus;
    s8 atkBonus;
};
static inline u32 BattleHitGetInfo(struct BattleHit *bh) {
    u32 var = bh->info;
    return var;
}

void BattleUnwindScripted(void) {
    struct BattleUnit* attacker;
    struct BattleUnit* defender;

    struct BattleHit* itIn;
    struct BattleHit* itOut;

    itIn = gActionData.scriptedBattleHits;
    itOut = gBattleHitArray;

    while (!(itIn->info & BATTLE_HIT_INFO_END))
        *itOut++ = *itIn++;

    *itOut = *itIn;

    for (gBattleHitIterator = gBattleHitArray; !(gBattleHitIterator->info & BATTLE_HIT_INFO_END); ++gBattleHitIterator) {
        if (gBattleHitIterator->info & BATTLE_HIT_INFO_RETALIATION) {
            attacker = &gBattleTarget;
            defender = &gBattleActor;
        } else {
            attacker = &gBattleActor;
            defender = &gBattleTarget;
        }

        BattleUpdateBattleStats(attacker, defender);
        BattleGenerateHitScriptedDamage(attacker);
        BattleGenerateHitEffects(attacker, defender);

        if ((attacker->unit.curHP == 0) || (defender->unit.curHP == 0)) {
            attacker->wexpMultiplier++;

            gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

            if (gBattleTarget.unit.curHP == 0)
                gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

            (gBattleHitIterator + 1)->info = BATTLE_HIT_INFO_END;

            break;
        }

        if (
            (defender->unit.statusIndex == UNIT_STATUS_PETRIFY) ||
            (defender->unit.statusIndex == UNIT_STATUS_13) ||
            (defender->statusOut == UNIT_STATUS_PETRIFY) ||
            (defender->statusOut == UNIT_STATUS_13)
        ) {
            attacker->wexpMultiplier++;

            gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
            BattleHitGetInfo(gBattleHitIterator); // dummy
            (gBattleHitIterator + 1)->info = BATTLE_HIT_INFO_END;

            break;
        }
    }

    gActionData.scriptedBattleHits = NULL;
}
