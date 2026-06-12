#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B6284
u16 GetChapterDeathCount(void) {
    int i;

    int count = 0;

    for (i = 1; i < 0x40; i++) {
        struct UnitUsageStats* bwl;

        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if ((unit->state & (US_DEAD | US_BIT16)) != US_DEAD) {
            continue;
        }

        bwl = GetPidStats(unit->pCharacterData->number);

        if (bwl->deathLoc != gPlaySt.chapterIndex) {
            continue;
        }

        count++;
    }

    return count;
}
