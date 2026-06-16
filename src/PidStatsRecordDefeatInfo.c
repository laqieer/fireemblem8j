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

void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause)
{
    int type;
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    type = GetBattleMapKind();
    switch (type) {
    case BATTLEMAP_KIND_SKIRMISH:
        bwl->deathSkirm = true;
        bwl->deathLoc = gGMData.units[0].location;
        break;


    case BATTLEMAP_KIND_STORY:
    case BATTLEMAP_KIND_DUNGEON:
    default:
        bwl->deathSkirm = false;
        bwl->deathLoc = gPlaySt.chapterIndex;
        break;
    }

    bwl->deathTurn = gPlaySt.chapterTurnNumber;
    bwl->killerPid = killerPid;
    bwl->deathCause = deathCause;
}
