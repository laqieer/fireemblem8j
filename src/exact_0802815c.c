#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"



 const struct SupportBonuses* GetAffinityBonuses(int affinity);
 void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
 void InitSupportBonuses(struct SupportBonuses* bonuses);

 void SetSupportLevelGained(u8 charA, u8 charB);
 s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

int GetUnitSupporterCount(struct Unit* unit)
{
    if (!UNIT_SUPPORT_DATA(unit))
        return 0;

    return UNIT_SUPPORT_DATA(unit)->supportCount;
}

u8 GetUnitSupporterCharacter(struct Unit* unit, int num)
{
    if (!UNIT_SUPPORT_DATA(unit))
        return 0;

    return UNIT_SUPPORT_DATA(unit)->characters[num];
}
