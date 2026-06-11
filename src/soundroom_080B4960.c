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
void PlayNextShuffledSong(struct SoundRoomProc * proc);
void InitSoundRoomShuffleBuffer(struct SoundRoomProc * proc);
bool SoundRoom_StartNextSong_Positive(struct SoundRoomProc * proc);
bool SoundRoom_StartNextSong_Negative(struct SoundRoomProc * proc);

//! FE8U = 0x080AFD48
void SoundRoomUi_3(struct SoundRoomProc * proc)
{
    proc->unk_3a = 0;
    proc->currentSongTime = 0;
    InitSoundRoomShuffleBuffer(proc);
    return;
}

//! FE8U = 0x080AFD5C
void SoundRoomUi_Loop_ShufflePlayUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = 0x18 - (tmp / 0x40);

    proc->unk_3c = 0x14 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    BlitClippedTileMapToBg(gSoundroom_0, 1, 25, 1, 3, proc->unk_3c + 4, 24, 3);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_3b == 24)
    {
        proc->unk_3a = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFDF4
void SoundRoomUi_Loop_ShufflePlayKeyHandler(struct SoundRoomProc * proc)
{
    if (proc->unk_3f != 0)
    {
        return;
    }

    if (proc->isSongPlaying != 0)
    {
        if (proc->currentSongTime >= (gSoundRoomTable[proc->currentSongIdx].songLength))
        {
            PlayNextShuffledSong(proc);
            return;
        }
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & (START_BUTTON | SELECT_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
    }

    return;
}

//! FE8U = 0x080AFE8C
void SoundRoomUi_Loop_ShufflePlayUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 0x40);

    proc->unk_3c = 20 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    BlitClippedTileMapToBg(gSoundroom_0, 1, 25, 1, 3, proc->unk_3c + 4, 24, 3);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_3b == 0)
    {
        proc->isSongPlaying = 0;
        Proc_Break(proc);
    }

    return;
}
