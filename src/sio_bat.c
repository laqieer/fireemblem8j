

#include "global.h"

#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"

#include "sio.h"
#include "sio_core.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08045930
int InsertMultiArenaRanking(u8 ranking, u32 playerCount, u32 mode, u32 points)
{
    u32 r4;
    int r2;
    int r7;

    r4 = points;

    for (r2 = 0; r2 < 10; r2++)
    {
        if (gSioResultRankings[r2].points >= r4)
        {
            continue;
        }

        r7 = r2;
        r2 = 9;

        if (r2 <= r7)
        {
            goto _080459E4;
        }
        else
        {
            goto _08045976;
        }
    }

    return -1;

_08045976:
    for (r2 = 9; r2 > r7; r2--)
    {
        gSioResultRankings[r2].ranking = gSioResultRankings[r2 - 1].ranking;
        gSioResultRankings[r2].points = gSioResultRankings[r2 - 1].points;
        gSioResultRankings[r2].player_count = gSioResultRankings[r2 - 1].player_count;
        gSioResultRankings[r2].mode = gSioResultRankings[r2 - 1].mode;
        SioStrCpy(gSioResultRankings[r2 - 1].name, gSioResultRankings[r2].name);
    }

_080459E4:
    gSioResultRankings[r7].ranking = ranking;
    gSioResultRankings[r7].points = points;
    gSioResultRankings[r7].player_count = playerCount;
    gSioResultRankings[r7].mode = mode;

    SioStrCpy(gUnk_Sio_9[gSioSt->selfId], gSioResultRankings[r7].name);

    return r7;
}
