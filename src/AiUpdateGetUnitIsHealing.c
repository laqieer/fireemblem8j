#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"

//! FE8U = 0x0803E698
s8 AiUpdateGetUnitIsHealing(struct Unit* unit) {

    u16 hpPercentage = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

    if (unit->aiFlags & AI_UNIT_FLAG_0) {
        if (gAI3HealingThresholdTable[unit->ai_config & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].exitThreshold > hpPercentage) {
            return 1;
        } else {
            unit->aiFlags &= ~AI_UNIT_FLAG_0;
            return 0;
        }
    } else {
        if (gAI3HealingThresholdTable[unit->ai_config & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].enterThreshold > hpPercentage) {
            unit->aiFlags |= AI_UNIT_FLAG_0;
            return 1;
        } else {
            return 0;
        }
    }
}
