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

inline struct UnitUsageStats *GetPidStats(u8 pid)
{
    if (pid >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(pid)->affinity)
        return 0;
    else
        return &gBWLDataArray[pid];  
}
