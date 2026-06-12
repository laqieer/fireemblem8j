#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"

void ClearPidChStatsSaveData(struct GameSaveBlock *sram_dest)
{
    int i, j;

    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    CpuFill16(0, gChapterStats, sizeof(gChapterStats));

    for (i = 0; i < BWL_ARRAY_NUM; i++) {
        gPidStatsData[i].favval = 0x2000;
        WriteAndVerifySramFast(gPidStatsData, &sram_dest->pidStats[i], sizeof(struct UnitUsageStats));
    }

    for (i = 0; i < WIN_ARRAY_NUM; i++)
        WriteAndVerifySramFast(gChapterStats, &sram_dest->chapterStats[i], sizeof(struct ChapterStats));

    gPidStatsSaveLoc = sram_dest->pidStats;
}
