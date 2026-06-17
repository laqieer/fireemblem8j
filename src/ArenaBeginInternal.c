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



extern struct Unit  gArenaOpponent;

void ArenaBeginInternal(struct Unit* unit) {
    int i;

    gArenaState.playerUnit = unit;
    gArenaState.opponentUnit = &gArenaOpponent;

    gUnk_63 = UNIT_ARENA_LEVEL(unit);

    gArenaState.playerClassId = unit->pClassData->number;
    gArenaState.playerWpnType = GetUnitBestWRankType(unit);

    gArenaState.opponentClassId = ArenaGenerateOpposingClassId(gArenaState.playerWpnType);
    gArenaState.opponentWpnType = GetClassBestWRankType(GetClassData(gArenaState.opponentClassId));

    gArenaState.playerIsMagic = IsWeaponMagic(gArenaState.playerWpnType);
    gArenaState.opponentIsMagic = IsWeaponMagic(gArenaState.opponentWpnType);

    gArenaState.playerLevel = unit->level;

    if (UNIT_ARENA_LEVEL(unit) < 5) {
        gArenaState.opponentLevel = ArenaGetOpposingLevel(gArenaState.playerLevel);
    } else {
        gArenaState.opponentLevel = ArenaGetOpposingLevel(gArenaState.playerLevel) + 7;
    }

    ArenaGenerateOpponentUnit();
    ArenaGenerateBaseWeapons();

    for (i = 0; i < 10; i++) {
        if (!ArenaAdjustOpponentPowerRanking()) {
            break;
        }
    }

    for (i = 0; i < 5; i++) {
        if (!ArenaAdjustOpponentDamage()) {
            break;
        }
    }

    gArenaState.playerPowerWeight = ArenaGetPowerRanking(gArenaState.playerUnit, gArenaState.opponentIsMagic);

    gArenaState.opponentPowerWeight = ArenaGetPowerRanking(gArenaState.opponentUnit, gArenaState.playerIsMagic);

    ArenaGenerateMatchupGoldValue();

    gArenaState.unk0B = 1;

    ArenaSetResult(0);

    ArenaSetFallbackWeaponsMaybe();

    return;
}
