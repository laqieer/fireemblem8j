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
int GetNextChapterStatsSlot(void);
bool IsChapterBelongCurGame(u32 ch_index);

int GetGameTotalTime()
{
    int time = 0;
    int ch_index = GetNextChapterStatsSlot();
    int i = 0;
    struct ChapterStats *cur;

    for(; i < ch_index; i++) {
        cur = GetChapterStats(i);

        if (IsChapterBelongCurGame(cur->chapter_index))
            time += cur->chapter_time * 180;
    }

    return time;
}
