#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

struct MusicProc {
    PROC_HEADER
    /*0x2A*/ s16 filler2A[16];
    /*0x4A*/ s16 songId;
    /*0x4C*/ s16 delayCounter;
    /*0x4E*/ s16 unk4E;
    /*0x50*/ s16 filler50[2];
    /*0x54*/ struct MusicPlayerInfo *player;
    /*0x58*/ s32 unk58;
    /*0x5C*/ s32 unk5C;
    /*0x60*/ s16 filler60[2];
    /*0x64*/ s16 vc_init_volume;
    /*0x66*/ s16 vc_end_volume;
    /*0x68*/ s16 vc_clock;
    /*0x6A*/ s16 vc_time_end;
};
extern struct ProcCmd sMusicProc4Script[];

void ChangeBgm(int songId, int vc_init_volume, int vc_end_volume, int duration, ProcPtr parent)
{
    struct MusicProc *mproc;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId && vc_init_volume == vc_end_volume)
        return;

    if (parent != NULL)
        mproc = Proc_StartBlocking(sMusicProc4Script, parent);
    else
        mproc = Proc_Start(sMusicProc4Script, PROC_TREE_3);

    mproc->unk58 = duration;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId)
        mproc->unk5C = -1;
    else
        mproc->unk5C = songId;

    mproc->vc_init_volume = vc_init_volume;
    mproc->vc_end_volume = vc_end_volume;
}
