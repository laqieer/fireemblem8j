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

void PidStatsAddBattleAmt(struct Unit* unit)
{
    u32 pid;
    struct UnitUsageStats *bwl;

    if (FACTION_BLUE != UNIT_FACTION(unit))
        return;

    pid = UNIT_CHAR_ID(unit);

    bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->battleAmt < 4000)
        bwl->battleAmt++;

    PidStatsAddFavval(UNIT_CHAR_ID(unit), 4);
}

void PidStatsAddWinAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->winAmt < 1000)
        bwl->winAmt++;

    PidStatsAddFavval(pid, 0x10);
}
