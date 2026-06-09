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





int GetUnitAidIconId(u32 attributes) {
    // TODO: use icon id constants

    if (attributes & CA_MOUNTED)
        return 0x81;

    if (attributes & CA_PEGASUS)
        return 0x82;

    if (attributes & CA_WYVERN)
        return 0x83;

    return (-1);
}
