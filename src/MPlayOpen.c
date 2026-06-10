#include "gba/m4a_internal.h"

void MPlayOpen(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *tracks, u8 trackCount)
{
    struct SoundInfo *soundInfo;

    if (trackCount == 0)
        return;

    if (trackCount > MAX_MUSICPLAYER_TRACKS)
        trackCount = MAX_MUSICPLAYER_TRACKS;

    soundInfo = SOUND_INFO_PTR;

    if (soundInfo->ident != ID_NUMBER)
        return;

    soundInfo->ident++;

    Clear64byte(mplayInfo);

    mplayInfo->tracks = tracks;
    mplayInfo->trackCount = trackCount;
    mplayInfo->status = MUSICPLAYER_STATUS_PAUSE;

    while (trackCount != 0)
    {
        tracks->flags = 0;
        trackCount--;
        tracks++;
    }

    if (soundInfo->func != 0)
    {
        mplayInfo->func = soundInfo->func;
        mplayInfo->intp = soundInfo->intp;
        soundInfo->func = 0;
    }

    soundInfo->intp = (u32)mplayInfo;
    soundInfo->func = (u32)MPlayMain;
    soundInfo->ident = ID_NUMBER;
    mplayInfo->ident = ID_NUMBER;
}
