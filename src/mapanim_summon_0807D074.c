#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "bm.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmmap.h"
#include "proc.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmind.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "mapanim.h"
#include "constants/songs.h"

void GenerateSummonUnitDef(void)
{
    u8 rand100 = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Unit* unit;
    short summonerNum, i;

    // 1. Find summoner number from active unit
    summonerNum = -1;
    for (i = 0; i < 3; ++i) {
        if (UNIT_CHAR_ID(gActiveUnit) == gSummonConfig[i][0]) {
            summonerNum = i;
            break;
        }
    }

    if (summonerNum == -1)
        return;

    // 2. Clear existing summon
    {
        int i;
        for (i = 1; i < 0x40; ++i) {
            struct Unit* unit = GetUnit(i);

            if (UNIT_IS_VALID(unit)) {
                if (UNIT_CHAR_ID(unit) == gSummonConfig[summonerNum][1])
                    ClearUnit(unit);
            }
        }
    }

    // 3. Set up unit definition
    unit = NULL;

    gUnitDef1.charIndex       = gSummonConfig[summonerNum][1];
    gUnitDef1.classIndex      = CLASS_PHANTOM;
    gUnitDef1.leaderCharIndex = CHARACTER_NONE;
    gUnitDef1.autolevel       = TRUE;

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gUnitDef1.allegiance = 0;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_RED)
        gUnitDef1.allegiance = 2;

    else if (UNIT_FACTION(gActiveUnit) == FACTION_GREEN)
        gUnitDef1.allegiance = 1;

    gUnitDef1.level = gActiveUnit->level;

    gUnitDef1.xPosition = gActionData.xOther;
    gUnitDef1.yPosition = gActionData.yOther;

    gUnitDef1.redaCount = 0;
    gUnitDef1.redas = NULL;

    gUnitDef1.genMonster = FALSE;
    gUnitDef1.itemDrop = FALSE;

    // 3.2. Items (generated from random number)
    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
        gUnitDef1.items[i] = ITEM_NONE;

    if (gActiveUnit->level <= 5)
        gUnitDef1.items[0] = ITEM_AXE_IRON;
    else if (gActiveUnit->level <= 10) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;
        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 15) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }
    else if (gActiveUnit->level <= 20) {
        if (rand100 < 6)
            gUnitDef1.items[0] = ITEM_AXE_DEVIL;

        else if (rand100 >= 6 && rand100 < 26)
            gUnitDef1.items[0] = ITEM_AXE_KILLER;

        else if (rand100 >= 26 && rand100 < 37)
            gUnitDef1.items[0] = ITEM_AXE_TOMAHAWK;

        else
            gUnitDef1.items[0] = ITEM_AXE_IRON;
    }

    // 3.3. Ai (is null)
    for (i = 0; i < 4; ++i)
        gUnitDef1.ai[i] = 0;

    // 4. Load unit
    unit = GetUnitFromCharId(gSummonConfig[summonerNum][1]);

    if (unit == NULL) {
        struct BattleUnit bu = gBattleActor;
        LoadUnits(&gUnitDef1);
        gBattleActor = bu;
    }

    // 5. Set level and weapon ranks
    unit = GetUnitFromCharId(gSummonConfig[summonerNum][1]);

    for (i = 0; i < 4; ++i)
        unit->ranks[i] = 0;

    unit->level = gActiveUnit->level;
    unit->exp   = UNIT_EXP_DISABLED;

    if (gActiveUnit->level <= 5)
        unit->ranks[ITYPE_AXE] = WPN_EXP_D;
    else if (gActiveUnit->level <= 10)
        unit->ranks[ITYPE_AXE] = WPN_EXP_C;
    else if (gActiveUnit->level <= 15)
        unit->ranks[ITYPE_AXE] = WPN_EXP_B;
    else if (gActiveUnit->level <= 20)
        unit->ranks[ITYPE_AXE] = WPN_EXP_A;
}
