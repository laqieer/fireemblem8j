#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA = {0};





bool ReadMultiArenaSaveTeamName(int team, char *dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));

    if (gMultiArenaSaveTeamBufA.name[0] == 0)
        return FALSE;

    SioStrCpy(gMultiArenaSaveTeamBufA.name, dst);

    return TRUE;
}
