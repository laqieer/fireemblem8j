#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/chapters.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

int GetRealChaperIndex(int chapterId);

u8 GetTitleClassReelSet(void)
{
    int furthestChapter;
    int chapter;
    int i;
    struct PlaySt chapterData;

    if (GetGlobalCompletionCount() != 0)
        return 9;

    furthestChapter = 0;

    for (i = 0; i < 3; i++)
    {
        if (IsSaveValid(i) == 0)
            continue;

        ReadGameSavePlaySt(i, &chapterData);

        if (chapterData.unk_2C_2 != 0)
            return 9;

        chapter = GetRealChaperIndex(chapterData.chapterIndex);

        if (furthestChapter < chapter)
            furthestChapter = chapter;
    }

    if (furthestChapter > 17)
        return 8;
    else if (furthestChapter > 15)
        return 7;
    else if (furthestChapter > 13)
        return 6;
    else if (furthestChapter > 11)
        return 5;
    else if (furthestChapter > 9)
        return 4;
    else if (furthestChapter > 7)
        return 3;
    else if (furthestChapter > 5)
        return 2;
    else if (furthestChapter > 3)
        return 1;

    return 0;
}
