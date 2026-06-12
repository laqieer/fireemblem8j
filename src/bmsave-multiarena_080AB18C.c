#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

void WipeMultiArenaSaveTeam(int team)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    CpuFill16(0, &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
