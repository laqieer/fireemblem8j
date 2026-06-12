#include "global.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiselecttarget.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmmind.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "trapfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bmusailment.h"
#include "constants/songs.h"

void ApplyHazardHealing(ProcPtr proc, struct Unit* unit, int hp, int status) {

    if (status >= 0) {
        SetUnitStatus(unit, status);
    }

    AddUnitHp(unit, hp);

    if (GetUnitCurrentHp(unit) <= 0) {
        UnitKill(unit);
    }

    DropRescueOnDeath(proc, unit);

    return;
}
