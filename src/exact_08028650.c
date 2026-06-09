#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"



 const struct SupportBonuses* GetAffinityBonuses(int affinity);
 void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
 void InitSupportBonuses(struct SupportBonuses* bonuses);

 void SetSupportLevelGained(u8 charA, u8 charB);
 s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

int GetUnitAffinityIcon(struct Unit* unit)
{
    int affinity = unit->pCharacterData->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}
