#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"
#include "bmsave.h"


const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex) {
    if (chIndex == 0x7F)
        return gExtraMapInfo->chapter_info;

    return gChapterDataTable + chIndex;
}
