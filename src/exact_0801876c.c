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




 // Purple units





s8 UnitHasMagicRank(struct Unit* unit) {
    u8 combinedRanks = 0;

    combinedRanks |= unit->ranks[ITYPE_STAFF];
    combinedRanks |= unit->ranks[ITYPE_ANIMA];
    combinedRanks |= unit->ranks[ITYPE_LIGHT];
    combinedRanks |= unit->ranks[ITYPE_DARK];

    return combinedRanks ? TRUE : FALSE;
}

void DeployUnitAtPosition(struct Unit* unit, int x, int y) {
    if (!(unit->state & US_UNDER_A_ROOF)) {
        unit->state = unit->state &~ (US_HIDDEN | US_NOT_DEPLOYED);

        unit->xPos = x;
        unit->yPos = y;
    }
}
