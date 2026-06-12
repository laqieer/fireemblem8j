#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





bool ReadMultiArenaSaveTeam(int team, struct Unit *units_dst, char *name_dst)
{
    int i;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(src_sram->teams[team].name, name_dst, sizeof(src_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        LoadSavedUnit(&src_sram->teams[team].units[i], &units_dst[i]);

    // I've been told that reading from sram directly is bad and that one shouldn't do it

#if BUGFIX
    if (name_dst[0] == 0)
        return FALSE;
#else
    if (src_sram->teams[team].name[0] == 0)
        return FALSE;
#endif

    return TRUE;
}
