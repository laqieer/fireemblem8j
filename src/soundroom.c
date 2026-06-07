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

u16 * CONST_DATA gSoundroom_0 = (u16 *)gGenericBuffer;
void * CONST_DATA gSoundroom_1 = gGenericBuffer + 0x800;

/* prototypes for same-file helpers called by this run */
bool SoundRoom_StartNextSong_Positive(struct SoundRoomProc * proc);
bool SoundRoom_StartNextSong_Negative(struct SoundRoomProc * proc);
void SoundRoom_DrawCompletionPercent(u16 * tm, struct SoundRoomProc * proc);
void TryDrawSoundRoomSongTitle(struct SoundRoomProc * proc);
void SoundRoom_DrawSlidingUi(struct SoundRoomProc * proc);

//! FE8U = 0x080AFBBC
void SoundRoomUi_0(struct SoundRoomProc * proc)
{
    proc->unk_3b = 0;

    CallARM_FillTileRect(TILEMAP_LOCATED(gSoundroom_0, 0, 7), gMenuSoundroom_0, 0x1000);
    CallARM_FillTileRect(TILEMAP_LOCATED(gSoundroom_0, 10, 5), gMenuSoundroom_1, 0x1000);

    CpuFastCopy(gBG2TilemapBuffer, gSoundroom_1, 0x800);

    SoundRoom_DrawCompletionPercent(gSoundroom_1, proc);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 19), gMenuSoundroom_4, 0x1200);
    CallARM_FillTileRect(TILEMAP_LOCATED(gSoundroom_0, 1, 25), gMenuSoundroom_2, 0x1000);

    HideSysHandCursor();

    proc->unk_3a = 0;

    return;
}

//! FE8U = 0x080AFC60
void SoundRoomUi_Loop_MainUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = ((proc->unk_3a * 2 + proc->unk_3a) << 3) * proc->unk_3a;

    proc->unk_3b = tmp >> 6;

    SoundRoom_DrawSlidingUi(proc);

    if (proc->unk_3b == 24)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFC98
void SoundRoomUi_1(struct SoundRoomProc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | SELECT_BUTTON))
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}

//! FE8U = 0x080AFCE4
void SoundRoomUi_2(struct SoundRoomProc * proc)
{
    TryDrawSoundRoomSongTitle(proc);
    proc->unk_3a = 0;
    return;
}
