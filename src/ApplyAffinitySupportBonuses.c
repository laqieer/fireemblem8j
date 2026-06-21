#include "global.h"
#include "bmreliance.h"

const struct SupportBonuses* GetAffinityBonuses(int affinity);

//! FE8U = 0x080284E4
void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level)
{
    const struct SupportBonuses* added = GetAffinityBonuses(affinity);

    bonuses->bonusAttack  += level * added->bonusAttack;
    bonuses->bonusDefense += level * added->bonusDefense;
    bonuses->bonusHit     += level * added->bonusHit;
    bonuses->bonusAvoid   += level * added->bonusAvoid;
    bonuses->bonusCrit    += level * added->bonusCrit;
    bonuses->bonusDodge   += level * added->bonusDodge;
}
