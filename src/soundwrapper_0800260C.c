#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

extern EWRAM_DATA struct SoundSt gSoundSt;




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

 void MusicVc_OnLoop(struct Proc *proc);

void _RestoreBgm(u16 speed)
{
    if (gPlaySt.config.disableBgm == 0 && gSoundSt.unk2 != 0)
    {
        m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
        m4aMPlayFadeIn(&gMPlayInfo_BGM2, speed);
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.unk7 = 0;
        gSoundSt.songId = gSoundSt.unk2;
        gSoundSt.unk2 = 0;
    }
}
