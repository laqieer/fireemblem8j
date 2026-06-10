#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

int GetCurrentBgmSong(void);

void StartOrChangeBgm(int songId, int speed, struct MusicPlayerInfo * player)
{
    if (gSoundSt.is_song_playing && GetCurrentBgmSong() == songId)
        return;
    if (gPlaySt.config.disableBgm == 0)
    {
        DeleteAll6CWaitMusicRelated();
        if (gSoundSt.is_song_playing)
        {
            Sound_FadeOutBGM(speed);
            StartSongDelayed(songId, speed * 16, player);
        }
        else
        {
            StartBgmCore(songId, player);
        }
    }
}
