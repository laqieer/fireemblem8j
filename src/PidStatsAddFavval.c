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

void PidStatsAddFavval(u8 pid, int val)
{
    int cur;

    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    cur = bwl->favval + val;

    if (cur > 0x4000)
        bwl->favval = 0x4000;
    else if (cur < 0)
        bwl->favval = 0;
    else
        bwl->favval = cur;
}
