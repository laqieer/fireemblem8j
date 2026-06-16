#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "bm.h"
#include "constants/songs.h"

extern int CheckInLinkArena(void);

void PrepScreenProc_UpdateBgm(void)
{
    if (CheckInLinkArena())
    {
        return;
    }

    if (gGMData.state.bits.state_0)
    {
        UpdateWorldMapBgm();
        return;
    }

    ChangeBgm(SONG_COMBAT_PREPARATION, 0x100, 0x100, 0x18, NULL);

    return;
}
