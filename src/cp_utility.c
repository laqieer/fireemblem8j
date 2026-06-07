#include "global.h"

#include "cp_common.h"

#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"

#include "constants/items.h"
#include "constants/terrains.h"

#include "cp_utility.h"

// forward decl.
s8 AiGetChestUnlockItemSlot(u8*);
void SetupUnitStatusStaffAIFlags(struct Unit*, u16);
void SetupUnitHealStaffAIFlags(struct Unit*, u16);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit*);



//! FE8U = 0x0803B794
int AiGetItemStealRank(u16 item) {
    int result = 0;

    u16* it = gAiStealPriorityItemList;

    while (*it != 0xFFFF) {
        if (*it == item) {
            return result;
        }

        it++;
        result++;
    }

    return -1;
}
