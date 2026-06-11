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




void BattleCheckSureShot(struct BattleUnit* attacker) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    switch (attacker->unit.pClassData->number) {

    case CLASS_SNIPER:
    case CLASS_SNIPER_F:
        switch (GetItemIndex(attacker->weapon)) {

        case ITEM_BALLISTA_REGULAR:
        case ITEM_BALLISTA_LONG:
        case ITEM_BALLISTA_KILLER:
            break;

        default:
            if (BattleRoll1RN(attacker->unit.level, FALSE) == TRUE)
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_SURESHOT;

            break;

        } // switch (GetItemIndex(attacker->weapon))

        break;

    } // switch (attacker->unit.pClassData->number)
}

void BattleCheckPierce(struct BattleUnit* attacker, struct BattleUnit* defender) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    switch (attacker->unit.pClassData->number) {

    case CLASS_WYVERN_KNIGHT:
    case CLASS_WYVERN_KNIGHT_F:
        if (BattleRoll1RN(attacker->unit.level, FALSE) == TRUE)
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_PIERCE;

        break;

    } // switch (attacker->unit.pClassData->number)
}

void BattleCheckGreatShield(struct BattleUnit* attacker, struct BattleUnit* defender) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    if (GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_POISON)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)
        return;

    switch (defender->unit.pClassData->number) {

    case CLASS_GENERAL:
    case CLASS_GENERAL_F:
        if (BattleRoll1RN(attacker->unit.level, FALSE) == TRUE)
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_GREATSHLD;

        break;

    } // switch (defender->unit.pClassData->number)
}
