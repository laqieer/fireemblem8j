#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"
#include "worldmap.h"

//! FE8U = 0x080BB5E4
int WMLoc_GetNextLocId(int idx)
{
    const s8 * unk_08;

    const struct GMapNodeData * node = &idx[gWMNodeData];

    if (CheckFlag(node->unk_06))
    {
        unk_08 = node->unk_08 + 2;
    }
    else
    {
        unk_08 = node->unk_08;
    }

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            return unk_08[0];

        case CHAPTER_MODE_EPHRAIM:
            return unk_08[1];
    }
}
