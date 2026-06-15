#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"
#include "bmsave.h"

const char * GetChapterTitleName(unsigned chIndex)
{
    if (chIndex != 0x7F)
        return GetStringFromIndex((int)(&GetROMChapterStruct(chIndex)->chapTitleTextId));

    return gExtraMapInfo->chapter_title;
}
