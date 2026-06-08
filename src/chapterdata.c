#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"
#include "bmsave.h"


/* prototypes for same-file helpers called by this run */
const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex);

const void* GetChapterMapChangesPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->map.changeLayerId];

    return gExtraMapInfo->map_change_info;
}

const struct ChapterEventGroup* GetChapterEventDataPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->mapEventDataId];

    return gExtraMapInfo->event_info;
}
