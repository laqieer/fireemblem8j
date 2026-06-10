#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

void SetSupportLevelGained(u8 charA, u8 charB);

void UnitGainSupportLevel(struct Unit* unit, int num)
{
    unit->supports[num]++;
    gPlaySt.chapterTotalSupportGain++;

    SetSupportLevelGained(unit->pCharacterData->number, GetUnitSupporterCharacter(unit, num));
}
