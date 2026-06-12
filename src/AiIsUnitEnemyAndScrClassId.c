#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"
/* TU-private data externs bound at their JP addresses */
extern struct AiScr* gpAiScriptCurrent;

//! FE8U = 0x0803C934
s8 AiIsUnitEnemyAndScrClassId(struct Unit* unit) {

    if ((unit->pClassData->number == gpAiScriptCurrent->unk_04) && (!AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}
