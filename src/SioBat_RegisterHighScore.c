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

int InsertMultiArenaRanking(u8 ranking, u32 playerCount, u32 mode, u32 points);

//! FE8U = 0x08045A64
void SioBat_RegisterHighScore(struct SioBatProc * proc)
{
    int mode = gLinkArenaSt.unk_ec.unk_0_1;
    int playerCount = gLinkArenaSt.unk_A0 - 1;
    u8 ranking = LinkArena_GetPlayerRanking();
    int points = gUnk_Sio_16.currentScore[gSioSt->selfId];

    ReadMultiArenaSaveRankings(gSioResultRankings);

    proc->unk_58 = InsertMultiArenaRanking(ranking, playerCount, mode, points);

    WriteMultiArenaSaveRankings(gSioResultRankings);

    if (proc->unk_58 != -1)
    {
        StartSioResultNewHighScore(proc->unk_58, proc);
    }
    else
    {
        Sound_FadeOutBGM(1);
    }

    return;
}
