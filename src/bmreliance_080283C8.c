#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"



 const struct SupportBonuses* GetAffinityBonuses(int affinity);
 void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
 void InitSupportBonuses(struct SupportBonuses* bonuses);

 void SetSupportLevelGained(u8 charA, u8 charB);
 s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

/* prototypes for same-file helpers called by this run */
int GetUnitSupporterCount(struct Unit* unit);
struct Unit* GetUnitSupporterUnit(struct Unit* unit, int num);
int GetUnitTotalSupportLevel(struct Unit* unit);
void UnitGainSupportExp(struct Unit* unit, int num);

void ProcessTurnSupportExp(void)
{
    int i, j, jMax;

    if (gPlaySt.chapterTurnNumber == 1)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return;

    for (i = 1; i < 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
            continue;

        jMax = GetUnitSupporterCount(unit);

        for (j = 0; j < jMax; ++j)
        {
            struct Unit* other = GetUnitSupporterUnit(unit, j);

            if (!other)
                continue;

            if (other->state & US_UNAVAILABLE)
                continue;

            if (UNIT_FACTION(other) != FACTION_BLUE)
                continue;

            switch (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos))
            {

            case 0:
                if (!(unit->rescue == other->index))
                    continue;
                break;

            case 1:
                if ((unit->state & US_RESCUED) || (other->state & US_RESCUED))
                    continue;
                break;

            default:
                continue;
            }

            if (GetUnitTotalSupportLevel(other) < MAX_SIMULTANEOUS_SUPPORT_COUNT)
                UnitGainSupportExp(unit, j);
        }
    }
}
