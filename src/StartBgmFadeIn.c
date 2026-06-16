#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "soundwrapper.h"
#include "variables.h"

struct MusicProc {
    PROC_HEADER
    /*0x2A*/ s16 filler2A[16];
    /*0x4A*/ s16 songId;
    /*0x4C*/ s16 delayCounter; // 16
    /*0x4E*/ s16 unk4E; // 17
    /*0x50*/ s16 filler50[2];
    /*0x54*/ struct MusicPlayerInfo *player;
    /*0x58*/ s32 unk58; // 23
    /*0x5C*/ s32 unk5C; // 25
    /*0x60*/ s16 filler60[2];
    /*0x64*/ s16 vc_init_volume;
    /*0x66*/ s16 vc_end_volume;
    /*0x68*/ s16 vc_clock;
    /*0x6A*/ s16 vc_time_end;
};

extern struct ProcCmd sMusicProc1Script[];
extern struct Proc *sMusicProc1;

void StartBgmFadeIn(int songId, int duration, struct MusicPlayerInfo *player)
{
    struct MusicProc *proc;

    if (gPlaySt.config.disableBgm == 0)
    {
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.unk7 = 0;
        gSoundSt.songId = songId;
        proc = Proc_Start(sMusicProc1Script, PROC_TREE_3);
        m4aMPlayStop(&gMPlayInfo_BGM1);
        m4aMPlayStop(&gMPlayInfo_BGM2);
        PlaySong(songId, player);
        m4aMPlayImmInit(&gMPlayInfo_BGM1);
        m4aMPlayImmInit(&gMPlayInfo_BGM2);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, 0);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, 0);
        proc->delayCounter = 0;
        proc->unk4E = duration * 16;
        sMusicProc1 = (struct Proc *)proc;
    }
}
