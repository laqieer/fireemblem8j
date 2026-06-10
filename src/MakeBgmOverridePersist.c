#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

void MakeBgmOverridePersist(void)
{
    if (gPlaySt.config.disableBgm == 0)
    {
        gSoundSt.songId = gSoundSt.unk2;
        gSoundSt.unk2 = 0;
    }
}
