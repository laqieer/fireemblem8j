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
extern s8 * CONST_DATA gSoundRoomShuffleBuffer;

/* prototypes for same-file helpers called by this run */
void PlayNextShuffledSong(struct SoundRoomProc * proc);

//! FE8U = 0x080AEF64
void InitSoundRoomShuffleBuffer(struct SoundRoomProc * proc)
{
    int seed1;
    int seed2;
    int it;
    int i;
    int numAvailableSongs;

    for (i = 0; i < 0x80; i++)
    {
        gSoundRoomShuffleBuffer[i] = -1;
    }

    seed1 = GetGameClock() & 0x7f;
    it = seed1;
    i = 0;

    do
    {
        // TODO: Permuter; addition does not seem to match here
        if ((*(proc->flags - -(it >> 5)) >> (it & 0x1f)) & 1)
        {
            gSoundRoomShuffleBuffer[i] = it;
            i++;
        }

        it = ((it + 1) % 0x80);
    } while (it != seed1);

    numAvailableSongs = i;

    seed2 = GetGameClock() + 0x7b;
    for (i = 0; i < 0x100; i++)
    {
        int idx1;
        int idx2;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx1 = (seed2 >> 8) % numAvailableSongs;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx2 = (seed2 >> 8) % numAvailableSongs;

        if (idx1 != idx2)
        {
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] + gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx2] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
        }
    }

    proc->shuffleIndex = 0;

    if ((*(proc->flags + (proc->curIndex >> 5)) >> (proc->curIndex & 0x1f)) & 1)
    {
        for (; gSoundRoomShuffleBuffer[proc->shuffleIndex] != proc->curIndex; proc->shuffleIndex++)
        {
            if (proc->shuffleIndex == 0x80)
            {
                proc->shuffleIndex = 0;
                goto _080AF0C4;
            }
        }
    }
_080AF0C4:
    proc->isSongPlaying = 1;
    PlayNextShuffledSong(proc);

    return;
}
