#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





bool IsChapterBelongCurGame(u32 ch_index)
{
    switch (gPlaySt.chapterModeIndex) {
    case CHAPTER_MODE_COMMON:
        if (ch_index < 10)
            return true;
        break;

    case CHAPTER_MODE_EIRIKA:
        if (ch_index >= 10 && ch_index <= 21)
            return true;
        break;

    case CHAPTER_MODE_EPHRAIM:
        if (ch_index <= 34 && ch_index >= 23)
            return true;
        break;
    }
    return false;
}
