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





void SetUnitStatus(struct Unit* unit, int status) {
    if (status == 0) {
        unit->statusIndex    = 0;
        unit->statusDuration = 0;
    } else {
        unit->statusIndex    = status;
        unit->statusDuration = 5;
    }
}

void SetUnitStatusExt(struct Unit* unit, int status, int duration) {
    unit->statusIndex    = status;
    unit->statusDuration = duration;
}
