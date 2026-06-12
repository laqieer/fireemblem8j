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

void ClearPidStats()
{
    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    gPlaySt.unk_30.unk_8_2 = 0;
    gPlaySt.unk_30.unk_4_14 = 0;
    gPlaySt.unk_30.unk_8_1 = 0;
    gPlaySt.unk_30.unk_4_00 = 0;
    gPlaySt.unk_30.total_gold = GetPartyTotalGoldValue();
}
