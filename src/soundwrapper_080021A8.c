#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct Proc * sMusicProc1;
extern struct Proc * sMusicProc2;

int GetCurrentBgmSong(void)
{
    return gSoundSt.songId;
}

s8 IsBgmPlaying(void)
{
    return gSoundSt.is_song_playing;
}

void Sound_SetBGMVolume(int volume)
{
    m4aMPlayVolumeControl(&gMPlayInfo_SE1_SYS1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2_SYS2, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3_BMP1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE4_BMP2, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE5_BMP3, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE6_BMP4, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE7_EVT, 0xFFFF, volume);
}

void Sound_SetSEVolume(int volume)
{
    m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
}

void Sound_FadeOutBGM(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
}

void Sound_FadeOutBGMAlt(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 1;
}

void Sound_FadeOutSE(int speed)
{
    if (speed == 0)
        speed = 6;
    m4aMPlayFadeOut(&gMPlayInfo_SE1_SYS1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE2_SYS2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE3_BMP1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE4_BMP2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE5_BMP3, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE6_BMP4, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE7_EVT, speed);
}

void StartBgmCore(int songId, struct MusicPlayerInfo *player)
{
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = songId;
    PlaySong(songId, player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
}
