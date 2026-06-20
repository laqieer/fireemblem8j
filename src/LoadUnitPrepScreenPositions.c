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

extern inline struct Unit* GetUnit(int id) {
    return gUnitLookup[id & 0xFF];
}

void LoadUnitPrepScreenPositions(void) {
    int i;

    ResetAllPlayerUnitState();
    ClearCutsceneUnits();

    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_BIT21)
            unit->state = unit->state | US_NOT_DEPLOYED;
        else
            unit->state = unit->state &~ US_NOT_DEPLOYED;

        if (unit->state & US_BIT26)
            unit->state = unit->state | US_BIT16;
        else
            unit->state = unit->state &~ US_BIT16;

        unit->state |= US_HIDDEN;
    }

    if (gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN)
        LoadUnitWordStructs();
}
