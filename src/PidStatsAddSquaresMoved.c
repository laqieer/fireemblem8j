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

//! FE8U = 0x080A9260
void PidStatsAddSquaresMoved(u8 pid, int amount)
{
    int move_count;
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    move_count = bwl->moveAmt + amount;
    if (move_count > 1000)
        move_count = 1000;

    bwl->moveAmt = move_count;

    PidStatsAddFavval(pid, 2);
}
