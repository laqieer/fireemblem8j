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

//! FE8U = 0x08083424
bool AreSkirmishUnitsAvailable(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (evGroup->playerUnitsChoice1InEncounter == 0)
        return false;

    if (evGroup->playerUnitsChoice2InEncounter == 0)
        return false;

    if (evGroup->playerUnitsChoice3InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice1InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice2InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice3InEncounter == 0)
        return false;

    return true;
}
