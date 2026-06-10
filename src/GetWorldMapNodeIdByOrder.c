#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"
#include "worldmap.h"

extern const u8 gWorldmapScreen2_0[2][0x1d];

//! FE8U = 0x080BBA4C
int GetWorldMapNodeIdByOrder(int nodeId)
{
    int set;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            set = 0;
            break;

        case CHAPTER_MODE_EPHRAIM:
            set = 1;
            break;
    }

    return gWorldmapScreen2_0[set][nodeId];
}
