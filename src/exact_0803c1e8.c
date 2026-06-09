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



//! FE8U = 0x0803C258
void CharStoreAI(struct Unit* unit, const struct UnitDefinition* uDef) {
    unit->ai1 = uDef->ai[UDEF_AIIDX_AI_A];

    unit->ai2 = uDef->ai[UDEF_AIIDX_AI_B];

    unit->ai_config &= ~AI_UNIT_CONFIG_HEALTHRESHOLD_MASK; // clear heal threshold
    unit->ai_config |= uDef->ai[UDEF_AIIDX_AI_CONF_L];
    unit->ai_config |= (uDef->ai[UDEF_AIIDX_AI_CONF_H] << 8);

    return;
}
