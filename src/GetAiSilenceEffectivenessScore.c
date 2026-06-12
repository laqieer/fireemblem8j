#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x08040300
u8 GetAiSilenceEffectivenessScore(struct Unit* unit) {
    u16 item;

    u8 score = GetOffensiveStaffAccuracy(gActiveUnit, unit);

    if (score < 5) {
        return 0;
    }

    score += GetUnitPower(unit);

    item = GetUnitEquippedWeapon(unit);
    if ((item != 0) && (GetItemAttributes(item) & IA_MAGIC)) {
        score *= 2;
    }

    return score;
}
