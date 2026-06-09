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



//! FE8U = 0x0803A71C
s8 AiCompare(const u8* left, u8 op, u32 right) {
    switch (op) {
        case AI_COMPARE_GT:
            if (*left > right) {
                return 1;
            }

            break;

        case AI_COMPARE_GE:
            if (*left >= right) {
                return 1;
            }

            break;

        case AI_COMPARE_EQ:
            if (*left == right) {
                return 1;
            }

            break;

        case AI_COMPARE_LE:
            if (*left <= right) {
                return 1;
            }

            break;

        case AI_COMPARE_LT:
            if (*left < right) {
                return 1;
            }

            break;

        case AI_COMPARE_NE:
            if (*left != right) {
                return 1;
            }

            break;
    }

    return 0;
}
