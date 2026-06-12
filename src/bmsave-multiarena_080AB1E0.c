#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





void CopyMultiArenaSaveTeam(int team_src, int team_dst)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team_src], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_dst], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
