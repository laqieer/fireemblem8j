#include "global.h"
#include "gba/m4a_internal.h"

//! FE8U = 0x080D5814
void TrkVolPitSet(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    if (track->flags & MPT_FLG_VOLSET)
    {
        s32 x, y;

        x = (u32)(track->vol * track->volX) >> 5;
        if (track->modT == 1)
            x = (u32)(x * (track->modM + 128)) >> 7;
        y = 2 * track->pan + track->panX;
        if (track->modT == 2)
            y += track->modM;
        if (y < -128)
            y = -128;
        else if (y > 127)
            y = 127;
        track->volMR = (u32)((y + 128) * x) >> 8;
        track->volML = (u32)((127 - y) * x) >> 8;
    }
    if (track->flags & MPT_FLG_PITSET)
    {
        s32 bend = track->bend * track->bendRange;
        s32 x = (track->tune + bend)
              * 4
              + (track->keyShift << 8)
              + (track->keyShiftX << 8)
              + track->pitX;

        if (track->modT == 0)
            x += 16 * track->modM;
        track->keyM = x >> 8;
        track->pitM = x;
    }
    track->flags &= ~(MPT_FLG_PITSET | MPT_FLG_VOLSET);
}
