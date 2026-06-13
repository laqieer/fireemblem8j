#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

void PlaySong(int songId, struct MusicPlayerInfo *player)
{
    if (songId < 128)
    {
        Sound_SetupMaxChannelsForSong(songId);
        UnlockSoundRoomSong(0, songId);
    }

    if (player != NULL)
        MPlayStart(player, gSongTable[songId].header);
    else
        m4aSongNumStart(songId);
}
