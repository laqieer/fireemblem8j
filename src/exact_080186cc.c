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





int GetUnitAid(struct Unit* unit) {
    if (!(UNIT_CATTRIBUTES(unit) & CA_MOUNTEDAID))
        return UNIT_CON(unit) - 1;

    if (UNIT_CATTRIBUTES(unit) & CA_FEMALE)
        return 20 - UNIT_CON(unit);
    else
        return 25 - UNIT_CON(unit);
}
