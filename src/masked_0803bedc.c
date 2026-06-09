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



//! FE8U = 0x0803BF4C
u8 AiGetClassRank(u8 classId) {
    u8 num = 0;
    const u8** it = gAiClassRankLists;

    while (*it != NULL) {
        const u8* itClass = *it;

        while (*itClass != 0) {
            if (*itClass == classId) {
                return num;
            }

            itClass++;
        }

        num++;
        it++;
    }

    return num;
}
