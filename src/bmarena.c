#include "global.h"

#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bmsave.h"
#include "bmarena.h"
#include "bmmind.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"




void ArenaSetResult(int);
void ArenaSetFallbackWeaponsMaybe(void);

struct ArenaData EWRAM_DATA gArenaState = {};

/* prototypes for same-file helpers called by this run */
int GetUnitBestWRankType(struct Unit* unit);
int ArenaGetPowerRanking(struct Unit* unit, s8 opponentIsMagic);

void ArenaGenerateBaseWeapons(void) {
    u8 arenaWeapons[] = {
        [ITYPE_SWORD] = ITEM_SWORD_IRON,
        [ITYPE_LANCE] = ITEM_LANCE_IRON,
        [ITYPE_AXE] = ITEM_AXE_IRON,
        [ITYPE_BOW] = ITEM_BOW_IRON,
        [ITYPE_STAFF] = ITEM_NONE,
        [ITYPE_ANIMA] = ITEM_ANIMA_FIRE,
        [ITYPE_LIGHT] = ITEM_LIGHT_LIGHTNING,
        [ITYPE_DARK] = ITEM_DARK_FLUX
    };

    gArenaState.playerWeapon = MakeNewItem(arenaWeapons[gArenaState.playerWpnType]);

    gArenaState.opponentWeapon = MakeNewItem(arenaWeapons[gArenaState.opponentWpnType]);

    gArenaState.range = 1;

    if (gArenaState.playerWpnType == ITYPE_BOW) {
        gArenaState.range = 2;
    }

    if (gArenaState.opponentWpnType == ITYPE_BOW) {
        gArenaState.range = 2;
    }

    return;
}

u16 ArenaGetUpgradedWeapon(u16 item)
{
    u8 * iter;

    // clang-format off
    u8 arenaWeaponUpgrades[] =
    {
        ITEM_SWORD_IRON, ITEM_SWORD_STEEL, ITEM_SWORD_SILVER, 0,
        ITEM_LANCE_IRON, ITEM_LANCE_STEEL, ITEM_LANCE_SILVER, 0,
        ITEM_AXE_IRON, ITEM_AXE_STEEL, ITEM_AXE_SILVER, 0,
        ITEM_BOW_IRON, ITEM_BOW_STEEL, ITEM_BOW_SILVER, 0,
        ITEM_ANIMA_FIRE, ITEM_ANIMA_ELFIRE, ITEM_ANIMA_FIMBULVETR, 0,
        ITEM_LIGHT_LIGHTNING, ITEM_LIGHT_DIVINE, 0,
        ITEM_DARK_FLUX, 0,

        -1
    };
    // clang-format on

    for (iter = arenaWeaponUpgrades; *iter != (u8)-1; iter++)
    {
        if (GetItemIndex(item) != *iter)
            continue;

        if (*++iter != 0)
            return MakeNewItem(*iter);

        return item;
    }

#if BUGFIX
    return item;
#endif // BUGFIX
}

s8 ArenaAdjustOpponentDamage(void) {
    s8 result = 0;

    gBattleActor.battleAttack = GetUnitPower(gArenaState.playerUnit) + 5;

    if (gArenaState.opponentIsMagic) {
        gBattleActor.battleDefense = GetUnitResistance(gArenaState.playerUnit);
    } else {
        gBattleActor.battleDefense = GetUnitDefense(gArenaState.playerUnit);
    }

    gBattleTarget.battleAttack = GetUnitPower(gArenaState.opponentUnit) + 5;

    if (gArenaState.playerIsMagic) {
        gBattleTarget.battleDefense = GetUnitResistance(gArenaState.opponentUnit);
    } else {
        gBattleTarget.battleDefense = GetUnitDefense(gArenaState.opponentUnit);
    }

    if ((gBattleActor.battleAttack - gBattleTarget.battleDefense) < (GetUnitMaxHp(gArenaState.opponentUnit) / 6)) {
        result = 1;

        if (gArenaState.playerIsMagic) {
            gArenaState.opponentUnit->res -= 4;

            if (gArenaState.opponentUnit->res < 0) {
                gArenaState.opponentUnit->res = 0;
            }
        } else {
            gArenaState.opponentUnit->def -= 4;

            if (gArenaState.opponentUnit->def < 0) {
                gArenaState.opponentUnit->def = 0;
            }
        }

        gArenaState.opponentUnit->spd += 1;
        gArenaState.opponentUnit->skl += 1;
    }

    if (gBattleTarget.battleAttack - gBattleActor.battleDefense < (GetUnitMaxHp(gArenaState.playerUnit) / 6)) {
        result = 1;

        gArenaState.opponentUnit->pow += 3;
        gArenaState.opponentUnit->spd += 2;
        gArenaState.opponentUnit->skl += 2;

        gArenaState.opponentWeapon = ArenaGetUpgradedWeapon(gArenaState.opponentWeapon);
    }

    return result;
}

s8 ArenaAdjustOpponentPowerRanking(void) {
    int max;
    int diff;

    gArenaState.playerPowerWeight = ArenaGetPowerRanking(gArenaState.playerUnit, gArenaState.opponentIsMagic);

    gArenaState.opponentPowerWeight = ArenaGetPowerRanking(gArenaState.opponentUnit, gArenaState.playerIsMagic);

    max = gArenaState.playerPowerWeight > gArenaState.opponentPowerWeight
        ? gArenaState.playerPowerWeight
        : gArenaState.opponentPowerWeight;

    diff = ABS(gArenaState.playerPowerWeight - gArenaState.opponentPowerWeight);

    if (((diff * 100) / max) <= 20) {
        return 0;
    }

    if (gArenaState.playerPowerWeight < gArenaState.opponentPowerWeight) {
        if (gArenaState.opponentUnit->maxHP != 0) {
            gArenaState.opponentUnit->maxHP -= 1;
            gArenaState.opponentUnit->curHP -= 1;
        }

        if (gArenaState.opponentUnit->pow != 0) {
            gArenaState.opponentUnit->pow -= 1;
        }

        if (gArenaState.opponentUnit->skl != 0) {
            gArenaState.opponentUnit->skl -= 1;
        }

        if (gArenaState.opponentUnit->spd != 0) {
            gArenaState.opponentUnit->spd -= 1;
        }

        if (gArenaState.opponentUnit->def != 0) {
            gArenaState.opponentUnit->def -= 1;
        }

        if (gArenaState.opponentUnit->res != 0) {
            gArenaState.opponentUnit->res -= 1;
        }

        if (gArenaState.opponentUnit->lck != 0) {
            gArenaState.opponentUnit->lck -= 1;
        }
    } else {
        if (gArenaState.opponentUnit->maxHP < 80) {
            gArenaState.opponentUnit->maxHP += 2;
            gArenaState.opponentUnit->curHP += 2;
        }

        if (gArenaState.opponentUnit->pow < 30) {
            gArenaState.opponentUnit->pow += 1;
        }

        if (gArenaState.opponentUnit->skl < 30) {
            gArenaState.opponentUnit->skl += 1;
        }

        if (gArenaState.opponentUnit->spd < 30) {
            gArenaState.opponentUnit->spd += 1;
        }

        if (gArenaState.opponentUnit->def < 30) {
            gArenaState.opponentUnit->def += 1;
        }

        if (gArenaState.opponentUnit->res < 30) {
            gArenaState.opponentUnit->res += 1;
        }

        if (gArenaState.opponentUnit->lck < 30) {
            gArenaState.opponentUnit->lck += 1;
        }
    }

    return 1;
}

void ArenaGenerateMatchupGoldValue(void) {
    int value;

    value = gArenaState.opponentPowerWeight - gArenaState.playerPowerWeight;
    value = 800 + 10 * (value / 2);

    if (value < 1) {
        value = 1;
    }

    gArenaState.matchupGoldValue = value;

    return;
}

int ArenaGetMatchupGoldValue(void) {
    return gArenaState.matchupGoldValue;
}

int ArenaGetResult(void) {
    return gArenaState.result;
}

void ArenaSetResult(int result) {
    gArenaState.result = result;
    return;
}

void ArenaContinueBattle(void) {
    int resumedFlag = gBmSt.just_resumed;

    gActionData.trapType = gBattleTarget.unit.curHP;

    gActionData.suspendPointType = SUSPEND_POINT_DURINGARENA;
    WriteSuspendSave(3);

    BattleUnwind();

    if (gBattleTarget.unit.curHP == 0) {
        BattleApplyExpGains();
    }

    UpdateUnitDuringBattle(gArenaState.playerUnit, &gBattleActor);

    if (!(resumedFlag) || (gBattleTarget.unit.curHP == 0)) {
        PidStatsRecordBattleRes();
    }

    return;
}

s8 ArenaIsUnitAllowed(struct Unit* unit) {
    if (unit->statusIndex == UNIT_STATUS_SILENCED) {
        return 0;
    }

    if (GetUnitBestWRankType(unit) < 0) {
        return 0;
    }

    return 1;
}

void ArenaSetFallbackWeaponForUnit(struct Unit* unit, u16* pItem) {

    int i;

    u8 arenaWeapons[] = {
        [ITYPE_SWORD] = ITEM_SWORD_IRON,
        [ITYPE_LANCE] = ITEM_LANCE_IRON,
        [ITYPE_AXE] = ITEM_AXE_IRON,
        [ITYPE_BOW] = ITEM_BOW_IRON,
        [ITYPE_STAFF] = ITEM_NONE,
        [ITYPE_ANIMA] = ITEM_ANIMA_FIRE,
        [ITYPE_LIGHT] = ITEM_LIGHT_LIGHTNING,
        [ITYPE_DARK] = ITEM_DARK_FLUX
    };

    if (CanUnitUseWeapon(unit, *pItem) != 0) {
        return;
    }

    for (i = 0; i < 8; i++) {

        if (unit->pClassData->baseRanks[i] != 0) {
            *pItem = MakeNewItem(arenaWeapons[i]);
            return;
        }
    }

    return;
}
