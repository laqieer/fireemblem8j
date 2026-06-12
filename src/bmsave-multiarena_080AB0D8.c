#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"








bool ReadMultiArenaSaveTeamRaw(int team, struct MultiArenaSaveTeam *dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team], dst, sizeof(struct MultiArenaSaveTeam));

    if (dst->name[0] == 0)
        return FALSE;

    return TRUE;
}
