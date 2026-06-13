#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"

 s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

extern int sSupportMaxExpLookup[];

s8 CanUnitSupportNow(struct Unit* unit, int num)
{
    int exp, maxExp;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return FALSE;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return FALSE;

    if (HasUnitGainedSupportLevel(unit, num))
        return FALSE;

    if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    if (GetUnitTotalSupportLevel(GetUnitSupporterUnit(unit, num)) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    exp    = unit->supports[num];
    maxExp = sSupportMaxExpLookup[GetUnitSupportLevel(unit, num)];

    if (exp == SUPPORT_EXP_A)
        return FALSE;

    return (exp == maxExp) ? TRUE : FALSE;
}
