#include "global.h"
#include "bmmap.h"
#include "bmunit.h"
#include "uiselecttarget.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmreliance.h"
#include "bmarch.h"
#include "rng.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "constants/classes.h"
#include "constants/terrains.h"

void PidStatsRecordTargetListDeaths(int unk) {
    int i;
    int count = GetSelectTargetCount();

    for (i = 0; i < count; i++) {
        struct SelectTarget* target = GetTarget(i);

        struct Unit* unit = GetUnit(target->uid);

        if (GetUnitCurrentHp(unit) <= target->extra) {
            PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, unk);
            PidStatsRecordLoseData(unit->pCharacterData->number);
        }
    }

    return;
}
