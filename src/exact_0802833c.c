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
u8 GetUnitSupporterCharacter(struct Unit* unit, int num);
struct Unit* GetUnitSupporterUnit(struct Unit* unit, int num);

int GetUnitSupporterNum(struct Unit* unit, u8 charId)
{
    int i, count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetUnitSupporterCharacter(unit, i) == charId)
            return i;
    }

    return -1;
}

void InitUnitsupports(struct Unit* unit)
{
    int i, count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; ++i)
    {
        struct Unit* other = GetUnitSupporterUnit(unit, i);

        if (!other)
            continue;

        other->supports[GetUnitSupporterNum(other, unit->pCharacterData->number)] = 0;
        unit->supports[i] = 0;
    }
}
