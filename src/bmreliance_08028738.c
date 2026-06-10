#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"



 const struct SupportBonuses* GetAffinityBonuses(int affinity);
 void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
 void InitSupportBonuses(struct SupportBonuses* bonuses);

 void SetSupportLevelGained(u8 charA, u8 charB);
 s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

/* prototypes for same-file helpers called by this run */
int GetUnitSupportLevel(struct Unit* unit, int num);
int GetUnitSupporterNum(struct Unit* unit, u8 charId);

s8 HaveCharactersMaxSupport(u8 charA, u8 charB)
{
    struct Unit* unit = GetUnitFromCharId(charA);

    if (GetUnitSupportLevel(unit, GetUnitSupporterNum(unit, charB)) > SUPPORT_LEVEL_B)
        return TRUE;

    return FALSE;
}
