#include "global.h"
#include "constants/chapters.h"
#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"
#include "bmcontainer.h"

bool8 ChapterHasMerchant(void)
{
    const struct ROMChapterData * chapterData =
        GetROMChapterStruct(gPlaySt.chapterIndex);
    if (chapterData->merchantPosX == 0xFF)
        return false;

    return true;
}
