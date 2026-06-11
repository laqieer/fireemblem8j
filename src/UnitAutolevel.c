#include "global.h"
#include <string.h>
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"

void UnitAutolevelCore(struct Unit* unit, u8 classId, int levelCount);

void UnitAutolevel(struct Unit* unit) {
    if (UNIT_CATTRIBUTES(unit) & CA_PROMOTED)
        UnitAutolevelCore(unit, unit->pClassData->promotion, GetCurrentPromotedLevelBonus());

    UnitAutolevelCore(unit, unit->pClassData->number, unit->level - 1);
}
