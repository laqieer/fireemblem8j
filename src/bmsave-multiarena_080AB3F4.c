#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





void ReadMultiArenaSaveRankings(struct MultiArenaRankingEnt *dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    ReadSramFast(src_sram->rankings, dst, sizeof(src_sram->rankings));
}
