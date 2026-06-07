#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

EWRAM_DATA struct SoundSt gSoundSt = {0};

static struct Proc *sMusicProc1;
static struct Proc *sMusicProc2;

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

static void MusicVc_OnLoop(struct Proc *proc);

/* prototypes for same-file helpers called by this run */
int GetCurrentBgmSong(void);
void Sound_SetSEVolume(int volume);
void PlaySong(int songId, struct MusicPlayerInfo *player);

static void MusicVc_OnLoop(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    int volume = Interpolate(4, mproc->vc_init_volume, mproc->vc_end_volume, mproc->vc_clock++, mproc->vc_time_end);
    Sound_SetSEVolume(volume);
    if (mproc->vc_clock >= mproc->vc_time_end)
    {
        if (mproc->vc_end_volume == 0)
        {
            m4aSongNumStop(GetCurrentBgmSong());
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.unk2 = 0;
            gSoundSt.songId = 0;
        }
        else
        {
            gSoundSt.is_song_playing = TRUE;
        }
        Proc_Break(proc);
        sMusicProc2 = NULL;
    }
}

void DelaySong_OnLoop(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    mproc->delayCounter--;
    if (mproc->delayCounter < 0)
    {
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.songId = mproc->songId;
        PlaySong(mproc->songId, mproc->player);
        Proc_End((struct Proc *)proc);
    }
}

void StartSongDelayed(int songId, int delay, struct MusicPlayerInfo *player)
{
    if (gPlaySt.config.disableBgm == 0)
    {
        struct MusicProc *mproc = Proc_Start(gMusicProc3Script, PROC_TREE_3);

        mproc->delayCounter = delay;
        mproc->songId = songId;
        mproc->player = player;
    }
}
