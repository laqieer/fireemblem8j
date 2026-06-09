#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
struct ChapterStats *GetChapterStats(int index);

bool IsChapterStatsValid(struct ChapterStats *chapter_stats)
{
    return chapter_stats->chapter_turn > 0;
}

int GetNextChapterStatsSlot(void)
{
    struct ChapterStats *cur = GetChapterStats(0);
    int ret = 0;

    while (cur->chapter_turn) {
        ++ret;
        ++cur;
    }

    return ret;
}
