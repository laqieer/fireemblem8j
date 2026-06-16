#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"

extern inline struct UnitUsageStats *GetPidStats(u8 pid)
{
    if (pid >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(pid)->affinity)
        return 0;
    else
        return &gBWLDataArray[pid];
}

void PidStatsAddActAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->actAmt < 200)
        bwl->actAmt++;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddStatViewAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->statViewAmt < 200)
        bwl->statViewAmt++;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddDeployAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->deployAmt < 60)
        bwl->deployAmt++;

    PidStatsAddFavval(pid, 0x40);
}
