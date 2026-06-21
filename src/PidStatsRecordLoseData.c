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

//! FE8U = 0x080A8FD8
void PidStatsRecordLoseData(u8 pid)
{
    struct SaveBlockInfo buf;
    int chunk_index;
    struct SuspendSaveBlock *ssb;
    struct GameSaveBlock *gsb;

    if (IsSramWorking()) {

        struct UnitUsageStats *bwl = GetPidStats(pid);
        if (NULL == bwl)
            return;

        if (true == gBmSt.just_resumed)
            return;

        if (PLAY_FLAG_TUTORIAL & gPlaySt.chapterStateBits)
            return;

        if (BM_FLAG_LINKARENA & gBmSt.gameStateBits)
            return;

        if (BM_FLAG_5 & gBmSt.gameStateBits)
            return;

        if (PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits)
            return;

        if (bwl->lossAmt >= 200)
            return;

        bwl->lossAmt++;

        PidStatsAddFavval(pid, -0x80);

        chunk_index = GetLastSuspendSaveId() + SAVE_ID_SUSPEND;

        ssb = GetSaveWriteAddr(chunk_index);
        WriteAndVerifySramFast(bwl, &ssb->pidStats[pid - 1], 1);

        ReadSaveBlockInfo(&buf, chunk_index);
        WriteSaveBlockInfo(&buf, chunk_index);

        gsb = GetSaveWriteAddr(gPlaySt.gameSaveSlot);
        WriteAndVerifySramFast(bwl, &gsb->pidStats[pid - 1], 3);

        ReadSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
        WriteSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
    }
}
