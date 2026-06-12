#include "global.h"
#include "constants/chapters.h"
#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"
#include "bmcontainer.h"

bool8 HasConvoyAccess(void)
{
    u32 chapterId;
    if (gGMData.state.bits.state_0)
    {
        chapterId = GetNextUnclearedChapter();
        if (chapterId == CHAPTER_L_PROLOGUE || chapterId == CHAPTER_L_1)
            return false;
        else if (chapterId == CHAPTER_CASTLE_FRELIA)
            return false;
        else
            return true;
    }

    if (gPlaySt.chapterIndex <= CHAPTER_L_1)
        return false;
    else if (gPlaySt.chapterIndex == CHAPTER_CASTLE_FRELIA)
        return false;
    else if (gPlaySt.chapterIndex != CHAPTER_L_5X)
        return true;

    return false;
}
