#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmsave.h"
#include "bmbattle.h"
#include "constants/classes.h"

void BattleGenerateHitEffects(struct BattleUnit* attacker, struct BattleUnit* defender) {
    attacker->wexpMultiplier++;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        if (defender->unit.pClassData->number != CLASS_DEMON_KING) {
            switch (GetItemWeaponEffect(attacker->weapon)) {

            case WPN_EFFECT_POISON:
                defender->statusOut = UNIT_STATUS_POISON;
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_POISON;

                if (defender->unit.statusIndex == UNIT_STATUS_PETRIFY || defender->unit.statusIndex == UNIT_STATUS_13)
                    defender->unit.state = defender->unit.state &~ US_UNSELECTABLE;

                break;

            case WPN_EFFECT_HPHALVE:
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPHALVE;
                break;

            }
        }

        if ((GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_DEVIL) && (BattleRoll1RN(31 - attacker->unit.lck, FALSE))) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_DEVIL;

            attacker->unit.curHP -= gBattleStats.damage;

            if (attacker->unit.curHP < 0)
                attacker->unit.curHP = 0;
        } else {
            if (gBattleStats.damage > defender->unit.curHP)
                gBattleStats.damage = defender->unit.curHP;

            defender->unit.curHP -= gBattleStats.damage;

            if (defender->unit.curHP < 0)
                defender->unit.curHP = 0;
        }

        if (GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_HPDRAIN) {
            attacker->unit.curHP += gBattleStats.damage;

            if (attacker->unit.curHP > attacker->unit.maxHP)
                attacker->unit.curHP = attacker->unit.maxHP;

            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
        }

        if (GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_PETRIFY) {
            switch (gPlaySt.faction) {

            case FACTION_BLUE:
                if (UNIT_FACTION(&defender->unit) == FACTION_BLUE)
                    defender->statusOut = UNIT_STATUS_13;
                else
                    defender->statusOut = UNIT_STATUS_PETRIFY;

                break;

            case FACTION_RED:
                if (UNIT_FACTION(&defender->unit) == FACTION_RED)
                    defender->statusOut = UNIT_STATUS_13;
                else
                    defender->statusOut = UNIT_STATUS_PETRIFY;

                break;

            case FACTION_GREEN:
                if (UNIT_FACTION(&defender->unit) == FACTION_GREEN)
                    defender->statusOut = UNIT_STATUS_13;
                else
                    defender->statusOut = UNIT_STATUS_PETRIFY;

                break;

            }

            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_PETRIFY;
        }
    }

    gBattleHitIterator->hpChange = gBattleStats.damage;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS) || attacker->weaponAttributes & (IA_UNCOUNTERABLE | IA_MAGIC)) {
        attacker->weapon = GetItemAfterUse(attacker->weapon);

        if (!attacker->weapon)
            attacker->weaponBroke = TRUE;
    }
}
