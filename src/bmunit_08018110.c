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





void UnitKill(struct Unit* unit) {
    if (UNIT_FACTION(unit) == FACTION_BLUE) {
        if (UNIT_IS_PHANTOM(unit))
            unit->pCharacterData = NULL;
        else {
            unit->state |= US_DEAD | US_HIDDEN;
            InitUnitsupports(unit);
        }
    } else
        unit->pCharacterData = NULL;
}
