#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;
struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufB = {0};





void SwapMultiArenaSaveTeams(int team_a, int team_b)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team_a], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    ReadSramFast(&src_sram->teams[team_b], &gMultiArenaSaveTeamBufB, sizeof(struct MultiArenaSaveTeam));

    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_b], sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufB, &dst_sram->teams[team_a], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
