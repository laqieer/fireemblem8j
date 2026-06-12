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
/* TU-private data externs bound at their JP addresses */
extern struct Unit gArenaOpponent;

void ArenaGenerateOpponentUnit(void) {
    int level;
    int i;

    struct UnitDefinition udef;

    struct Unit* unit = &gArenaOpponent;

    udef.charIndex = CHARACTER_ARENA_OPPONENT;
    udef.classIndex = gArenaState.opponentClassId;
    udef.allegiance = 0;
    udef.level = gArenaState.opponentLevel;
    udef.autolevel = 1;
    udef.items[0] = 0;
    udef.items[1] = 0;
    udef.items[2] = 0;
    udef.items[3] = 0;
    udef.ai[0] = 0;
    udef.ai[0] = 0;
    udef.ai[1] = 0;
    udef.ai[2] = 0;
    udef.ai[3] = 0;

    ClearUnit(&gArenaOpponent);
    unit->index = 0x80;

    UnitInitFromDefinition(unit, &udef);
    UnitLoadStatsFromChracter(unit, unit->pCharacterData);

    level = unit->level;

    unit->level = ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) ? level * 24 : level * 12) / 10;

    UnitAutolevel(unit);

    unit->level = level;

    for (i = 0; i < 8; i++) {
        if (unit->ranks[i] != 0) {
            unit->ranks[i] = -75;
        }
    }

    if (unit->level < 1) {
        unit->level = 1;
    }

    if (unit->level > 20) {
        unit->level = 20;
    }

    UnitCheckStatCaps(unit);
    SetUnitHp(unit, GetUnitMaxHp(unit));

    return;
}
