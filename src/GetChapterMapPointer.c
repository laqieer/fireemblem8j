#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"
#include "bmsave.h"

const void* GetChapterMapPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->map.mainLayerId];

    ReadSramFast(GetExtraMapMapReadAddr(), gGenericBuffer, GetExtraMapMapSize());
    return gGenericBuffer;
}
