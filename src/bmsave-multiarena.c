#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"








/* prototypes for same-file helpers called by this run */
bool ReadMultiArenaSaveTeamName(int team, char *dst);

bool IsMultiArenaSaveReady(void)
{
    char buf[MULTIARENA_TEAMNAME_SIZE + 1];
    int i;

    if (!IsMultiArenaSaveValid(SAVE_ID_ARENA))
        return FALSE;

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if (ReadMultiArenaSaveTeamName(i, buf) == TRUE)
            return TRUE;
    }

    return FALSE;
}
