#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

void Sound_SetSEVolume(int volume);

void Sound_ForceChangeBgm(int songId)
{
    if (songId != gSoundSt.songId)
    {
        if (IsBgmPlaying() != 0)
            Sound_SetSEVolume(0);
        StartBgmCore(songId, 0);
    }
}

void DeleteAll6CWaitMusicRelated(void)
{
    Proc_EndEach(gMusicProc3Script);
}

void Sound_StopBgmImmediate(void)
{
    DeleteAll6CWaitMusicRelated();
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 1);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, 1);
    gSoundSt.unk2 = 0;
    gSoundSt.songId = 0;
}
