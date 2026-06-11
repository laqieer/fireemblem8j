#include "global.h"
#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "event.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! FE8U = 0x080833B0
const struct UnitDefinition * GetChapterEnemyUnitDefinitions(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    const void * ret = NULL;

    switch (gGMData.unk_c9[gGMData.unk_cc]) {
        case 0:
            ret = evGroup->enemyUnitsChoice1InEncounter;
            break;

        case 1:
            ret = evGroup->enemyUnitsChoice2InEncounter;
            break;

        case 2:
            ret = evGroup->enemyUnitsChoice3InEncounter;
            break;
    }

    return ret;
}
