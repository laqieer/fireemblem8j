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

s8 BattleCheckTriangleAttack(struct BattleUnit* attacker, struct BattleUnit* defender) {
    s8 adjacentLookup[] = {
        -1, 0,
        0, -1,
        +1, 0,
        0, +1
    };

    int i, count = 0;

    int triangleAttackAttr = CA_TRIANGLEATTACK_ANY & UNIT_CATTRIBUTES(&attacker->unit);

    int x = defender->unit.xPos;
    int y = defender->unit.yPos;

    int faction = UNIT_FACTION(&attacker->unit);

    gBattleStats.taUnitA = NULL;
    gBattleStats.taUnitB = NULL;

    for (i = 0; i < 4; ++i) {
        int uId = gBmMapUnit[adjacentLookup[i*2 + 1] + y][adjacentLookup[i*2 + 0] + x];
        struct Unit* unit;

        if (!uId)
            continue;

        unit = GetUnit(uId);

        if ((uId & 0xC0) != faction)
            continue;

        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            continue;

        if (unit->statusIndex == UNIT_STATUS_PETRIFY)
            continue;

        if (unit->statusIndex == UNIT_STATUS_13)
            continue;

        if (unit->pClassData->number == CLASS_WYVERN_KNIGHT_F)
            continue;

        if (UNIT_CATTRIBUTES(unit) & triangleAttackAttr) {
            ++count;

            if (!gBattleStats.taUnitA)
                gBattleStats.taUnitA = unit;
            else if (!gBattleStats.taUnitB)
                gBattleStats.taUnitB = unit;
        }
    }

    return count >= 2 ? TRUE : FALSE;
}
