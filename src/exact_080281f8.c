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
int GetUnitSupportLevel(struct Unit* unit, int num);

int GetUnitTotalSupportLevel(struct Unit* unit)
{
    int i, count, result;

    count = GetUnitSupporterCount(unit);

    for (i = 0, result = 0; i < count; ++i)
    {
        result += GetUnitSupportLevel(unit, i);
    }

    return result;
}
