#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

void Sound_SetupMaxChannelsForSong(int songId)
{
    switch (songId)
    {
    case 1:
    case 2:
    case 0x40:
    case 0x42:
    case 0x43:
    case 0x74:
        if (gSoundSt.maxChannels != 8)
            Sound_SetMaxNumChannels(8);
        break;
    default:
        if (gSoundSt.maxChannels != -1)
            Sound_SetDefaultMaxNumChannels();
        break;
    }
}
