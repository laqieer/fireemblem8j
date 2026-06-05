#include "global.h"

#include "bmunit.h"

#include "bmreliance.h"



static const struct SupportBonuses* GetAffinityBonuses(int affinity);
static void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
static void InitSupportBonuses(struct SupportBonuses* bonuses);

static void SetSupportLevelGained(u8 charA, u8 charB);
static s8 HasUnitGainedSupportLevel(struct Unit* unit, int num);

int GetCharacterAffinityIcon(int characterId)
{
    int affinity = GetCharacterData(characterId)->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}

int GetSupportLevelUiChar(int level)
{
    u8 chars[4] = {
        // TODO: special char constant definitions
        0x14, 0x1B, 0x1A, 0x19
    };

    return chars[level];
}

char* GetAffinityName(int affinity)
{
    int textIdLookup[] = {
        // TODO: text ids
        0x4C4, 0x499, 0x49A, 0x49B, 0x49C, 0x49F, 0x49E, 0x49D
    };

    return GetStringFromIndex(textIdLookup[affinity]);
}

static void SetSupportLevelGained(u8 charA, u8 charB)
{
    struct Unit* unit = GetUnitFromCharId(charA);
    int num = GetUnitSupporterNum(unit, charB);

    unit->supportBits |= (1 << num);

    unit = GetUnitFromCharId(charB);
    num = GetUnitSupporterNum(unit, charA);

    unit->supportBits |= (1 << num);
}
