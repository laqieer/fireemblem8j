#include "global.h"

#include "bmmap.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bmidoten.h"

void GenerateUnitCompleteStaffRange(struct Unit* unit);
void GenerateUnitCompleteAttackRange(struct Unit* unit);

extern inline void SetWorkingBmMap(u8** map)
{
    gWorkingBmMap = map;
}

void GenerateDangerZoneRange(s8 boolDisplayStaffRange)
{
    int i, enemyFaction;
    int hasMagicRank, prevHasMagicRank;
    u8 savedUnitId;
    int displayStaff = boolDisplayStaffRange;

    prevHasMagicRank = -1;

    BmMapFill(gBmMapRange, 0);

    enemyFaction = GetNonActiveFaction();

    for (i = enemyFaction + 1; i < enemyFaction + 0x80; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (displayStaff && !UnitHasMagicRank(unit))
            continue;

        if (gPlaySt.chapterVisionRange && (gBmMapFog[unit->yPos][unit->xPos] == 0))
            continue;

        if (unit->state & US_UNDER_A_ROOF)
            continue;

        GenerateUnitMovementMapExt(unit, UNIT_MOV(unit));

        savedUnitId = gBmMapUnit[unit->yPos][unit->xPos];
        gBmMapUnit[unit->yPos][unit->xPos] = 0;

        hasMagicRank = UnitHasMagicRank(unit);

        if (prevHasMagicRank != hasMagicRank)
        {
            BmMapFill(gBmMapOther, 0);

            if (hasMagicRank)
                GenerateMagicSealMap(1);

            prevHasMagicRank = hasMagicRank;
        }

        SetWorkingBmMap(gBmMapRange);

        if (displayStaff)
            GenerateUnitCompleteStaffRange(unit);
        else
            GenerateUnitCompleteAttackRange(unit);

        gBmMapUnit[unit->yPos][unit->xPos] = savedUnitId;
    }
}
