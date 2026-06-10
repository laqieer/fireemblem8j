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
extern struct ProcCmd sMusicProc2Script[];
extern struct Proc *sMusicProc2;

void Sound_SetSEVolume(int volume);

void StartBgmVolumeChange(int volume, int b, int c, ProcPtr parent)
{
    struct MusicProc *proc;

    if (parent)
        proc = Proc_StartBlocking(sMusicProc2Script, parent);
    else
        proc = Proc_Start(sMusicProc2Script, PROC_TREE_3);
    proc->vc_init_volume = volume;
    proc->vc_end_volume = b;
    proc->vc_clock = 0;
    proc->vc_time_end = c;
    if (volume == 0)
        volume = 1;
    Sound_SetSEVolume(volume);
    sMusicProc2 = (ProcPtr)proc;
}
