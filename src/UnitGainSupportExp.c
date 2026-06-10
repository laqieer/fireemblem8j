#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

extern int sSupportMaxExpLookup[];

void UnitGainSupportExp(struct Unit* unit, int num)
{
    if (UNIT_SUPPORT_DATA(unit))
    {
        int gain = UNIT_SUPPORT_DATA(unit)->supportExpGrowth[num];
        int currentExp = unit->supports[num];
        int maxExp = sSupportMaxExpLookup[GetUnitSupportLevel(unit, num)];

        if (currentExp + gain > maxExp)
            gain = maxExp - currentExp;

        unit->supports[num] = currentExp + gain;
        gPlaySt.chapterTotalSupportGain += gain;
    }
}
