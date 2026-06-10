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

inline struct Unit* GetUnit(int id);

s8 UnitGive(struct Unit* actor, struct Unit* target) {
    struct Unit* rescuee = GetUnit(actor->rescue);

    // no used be needed to match etc
    int couldGive = CanUnitRescue(target, rescuee);

    UnitDrop(actor, 0, 0);
    UnitRescue(target, rescuee);

    // return couldGive; // devs probably forgot to add this
}
