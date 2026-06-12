#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"

extern EWRAM_DATA struct UnitUsageStats *gPidStatsSaveLoc;
extern EWRAM_DATA struct UnitUsageStats gPidStatsData[BWL_ARRAY_NUM];
extern EWRAM_DATA struct ChapterStats gChapterStats[WIN_ARRAY_NUM];

int PidStatsGetTotalExpGain(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].expGained;

    return ret;
}
