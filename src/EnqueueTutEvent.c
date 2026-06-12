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

//! FE8U = 0x08083DD8
void EnqueueTutEvent(uintptr_t ptr, u8 event_enqueue_type)
{
    u16 i = 0;
    const u32 * tutorialEvents = GetChapterEventDataPointer(gPlaySt.chapterIndex)->tutorialEvents;

    for (; tutorialEvents[i] != 0; i++)
    {
        if (tutorialEvents[i] == ptr)
        {
            gPlaySt.tutorial_counter = i + 1;
            gPlaySt.tutorial_exec_type = event_enqueue_type;
            break;
        }
    }
}
