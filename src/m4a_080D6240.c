#include "global.h"
#include "gba/m4a_internal.h"

void ply_xcmd(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 n = *track->cmdPtr;
    track->cmdPtr++;

    gXcmdTable[n](mplayInfo, track);
}

void ply_xxx(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    void (*func)(struct MusicPlayerInfo *, struct MusicPlayerTrack *) = *(&gMPlayJumpTable[0]);
    func(mplayInfo, track);
}
