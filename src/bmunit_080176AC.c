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

extern EWRAM_DATA u8 gActiveUnitId;

extern EWRAM_DATA struct Unit gUnitArrayBlue[62]; // Player units
extern EWRAM_DATA struct Unit gUnitArrayRed[50]; // Red units
extern EWRAM_DATA struct Unit gUnitArrayGreen[20]; // Purple units





int GetUnitSMSId(struct Unit* unit) {
    if (!(unit->state & US_IN_BALLISTA))
        return unit->pClassData->SMSId;

    switch (GetTrap(unit->ballistaIndex)->extra) {

        // TODO: SMS id definitions

    case ITEM_BALLISTA_REGULAR:
        return 0x58;

    case ITEM_BALLISTA_LONG:
        return 0x59;

    case ITEM_BALLISTA_KILLER:
        return 0x5A;

    default:
        return 0;

    } // switch (GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMID])
}
