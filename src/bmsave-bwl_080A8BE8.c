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

/* prototypes for same-file helpers called by this run */
void ClearPidStats();

void ClearPidStats_ret()
{
    gPlaySt.unk_2C_04 = 0;
    SetPartyGoldAmount(0);
    ClearPidStats();
}
