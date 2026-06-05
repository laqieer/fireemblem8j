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

struct AiStaffLutEntry {
    u16 itemId;
    void(*func)(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
};

void AiStaffHealMendRecover(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffPhysicRescue(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffFortify(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffWarp(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffRestore(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffSilence(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffSleepBerserk(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffBarrier(int itemIdx, s8 (*isEnemy)(struct Unit* unit));

const struct AiStaffLutEntry sAiStaffFuncLut[] = {
    { ITEM_STAFF_HEAL,    AiStaffHealMendRecover },
    { ITEM_STAFF_MEND,    AiStaffHealMendRecover },
    { ITEM_STAFF_RECOVER, AiStaffHealMendRecover },
    { ITEM_STAFF_PHYSIC,  AiStaffPhysicRescue },
    { ITEM_STAFF_FORTIFY, AiStaffFortify },
    { ITEM_STAFF_WARP,    AiStaffWarp },
    { ITEM_STAFF_RESCUE,  AiStaffPhysicRescue },
    { ITEM_STAFF_RESTORE, AiStaffRestore },
    { ITEM_STAFF_SILENCE, AiStaffSilence },
    { ITEM_STAFF_SLEEP,   AiStaffSleepBerserk },
    { ITEM_STAFF_BERSERK, AiStaffSleepBerserk },
    { ITEM_STAFF_BARRIER, AiStaffBarrier },
    { 0x0, 0x0 },
};

//! FE8U = 0x0803F9D8
int GetAiStaffFuncIndex(u16 item) {
    u16 itemId;

    int i = 0;

    if (!CanUnitUseStaff(gActiveUnit, item)) {
        return -1;
    }

    itemId = GetItemIndex(item);

    for (; sAiStaffFuncLut[i].itemId != 0; i++) {
        if (itemId != sAiStaffFuncLut[i].itemId) {
            continue;
        }

        if (sAiStaffFuncLut[i].func != 0) {
            return i;
        }
    }

    return -1;
}
