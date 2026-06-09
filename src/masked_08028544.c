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
int GetUnitSupportLevel(struct Unit* unit, int num);
int GetUnitSupporterNum(struct Unit* unit, u8 charId);
void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
void InitSupportBonuses(struct SupportBonuses* bonuses);

int GetUnitSupportBonuses(struct Unit* unit, struct SupportBonuses* bonuses)
{
    int i, count;
    int result = 0;

    InitSupportBonuses(bonuses);

    count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; ++i)
    {
        struct Unit* other;
        int level1, level2;

        result = result >> 1;
        other = GetUnitSupporterUnit(unit, i);

        if (!other)
            continue;

        // TODO: gameStateBits constants
        if (!(gBmSt.gameStateBits & 0x40))
        {
            if (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos) > SUPPORT_BONUSES_MAX_DISTANCE)
                continue;
        }

        if (other->state & (US_UNAVAILABLE | US_RESCUED))
            continue;

        level1 = GetUnitSupportLevel(other, GetUnitSupporterNum(other, unit->pCharacterData->number));
        ApplyAffinitySupportBonuses(bonuses, other->pCharacterData->affinity, level1);

        level2 = GetUnitSupportLevel(unit, i);
        ApplyAffinitySupportBonuses(bonuses, unit->pCharacterData->affinity, level2);

        if (level1 != 0 && level2 != 0)
            result += 1 << (count - 1);
    }

    bonuses->bonusAttack  /= 2;
    bonuses->bonusDefense /= 2;
    bonuses->bonusHit     /= 2;
    bonuses->bonusAvoid   /= 2;
    bonuses->bonusCrit    /= 2;
    bonuses->bonusDodge   /= 2;

    return result;
}
