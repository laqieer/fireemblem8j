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

//! FE8U = 0x08083348
const void * GetChapterAllyUnitDataPointer(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH) {
        if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD) {
            return evGroup->playerUnitsInHard;
        }

        return evGroup->playerUnitsInNormal;
    } else {
        switch (gGMData.unk_c9[gGMData.unk_cc]) {
            case 0:
                return evGroup->playerUnitsChoice1InEncounter;

            case 1:
                return evGroup->playerUnitsChoice2InEncounter;

            case 2:
                return evGroup->playerUnitsChoice3InEncounter;
        }
    }
}
