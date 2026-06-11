#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"

#include "soundroom.h"
#include "constants/songs.h"

// TODO: Implicit declarations
void PutMenuScrollBarAt(int, int);
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);

struct VolumeGraphBufferProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct SoundRoomSpriteDrawProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct Unknown_08A212DC
{
    u8 x;
    u8 y;
} __attribute__((packed));

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
    /* 50 */ u16 unk_50;
};

extern struct Unknown201F148 gUnk_SoundRoom_0;
extern u8 gSoundRoomVolumeGraphBuffer[][0x31];

extern u8 gMenuSoundroom_3[]; // gfx
extern u16 gUnkData_30[]; // pal
extern u16 gUnkData_31[]; // pal
extern u8 gMenuSoundroom_0[]; // tsa
extern u8 gMenuSoundroom_1[]; // tsa

extern u8 Img_PlayStatusSprites[]; // gfx
extern u16 Pal_PlayStatusSprites[]; // pal

extern u8 Img_SoundRoomUiElements[];
extern u16 Pal_SoundRoomUiElements[];

extern u8 gMenuSoundroom_4[];
extern u8 gMenuSoundroom_2[];

extern u16 * CONST_DATA gSoundroom_0;
extern void * CONST_DATA gSoundroom_1;
extern struct Unknown_08A212DC * CONST_DATA gSoundroom_2;

/* prototypes for same-file helpers called by this run */
bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag);
void DrawSoundRoomSongTitle(int index);

//! FE8U = 0x080AF840
void StopSoundRoomSong(struct SoundRoomProc * proc)
{
    if (MusicProc4Exists())
    {
        return;
    }

    proc->currentSongTime = 0;
    ChangeBgm(SONG_NONE, 0x100, 0, 0x18, 0);
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;

    return;
}

//! FE8U = 0x080AF878
void TryDrawSoundRoomSongTitle(struct SoundRoomProc * proc)
{
    if (IsSoundRoomSongPlayable(proc, proc->curIndex))
    {
        DrawSoundRoomSongTitle(proc->curIndex);
    }
    else
    {
        DrawSoundRoomSongTitle(-1);
    }

    return;
}
