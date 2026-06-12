#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





void WriteMultiArenaSaveRankings(struct MultiArenaRankingEnt const *src)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(src, dst_sram->rankings, sizeof(dst_sram->rankings));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
