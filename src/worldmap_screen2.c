

#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080BB5B0
int WMLoc_GetChapterId(int idx)
{
    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            return idx[gWMNodeData].chapteridx_eirika;

        case CHAPTER_MODE_EPHRAIM:
            return idx[gWMNodeData].chapteridx_ephram;
    }
}
