#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





void ReadMultiArenaSaveConfig(void * config_dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    ReadSramFast(&src_sram->config, config_dst, 2);
}
