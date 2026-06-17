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
s8 SoundRoom_GetScrollDirection(struct SoundRoomProc * proc);
void SoundRoom_DrawSongList(struct SoundRoomProc * proc);
void SoundRoom_PutHandCursor(struct SoundRoomProc * proc);
void SoundRoom_UpdateScrollBar(struct SoundRoomProc * proc);
void StopSoundRoomSong(struct SoundRoomProc * proc);
bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag);

void SoundRoomUi_Loop_MainKeyHandler(struct SoundRoomProc * proc)
{
    int moveAmt = 0;

    if (proc->unk_37 == 0)
    {

        u16 keys = gKeyStatusPtr->repeatedKeys;
        proc->unk_38 = 4;

        if (gKeyStatusPtr->heldKeys & L_BUTTON)
        {
            keys = gKeyStatusPtr->heldKeys;
            proc->unk_38 = 8;
        }

        if (keys & DPAD_UP)
        {
            moveAmt = -4;
        }

        if (keys & DPAD_DOWN)
        {
            moveAmt = +4;
        }

        if (keys & DPAD_LEFT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) != 0)
            {
                moveAmt = -1;
            }
        }

        if (keys & DPAD_RIGHT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) < 3)
            {
                moveAmt = +1;
            }
        }

        if (moveAmt != 0)
        {
            if ((proc->curIndex + moveAmt) < 0)
            {
                return;
            }

            if ((proc->curIndex + moveAmt) >= proc->totalSongs)
            {
                return;
            }

            proc->curIndex += moveAmt;

            TryDrawSoundRoomSongTitle(proc);

            proc->unk_37 = SoundRoom_GetScrollDirection(proc);

            if (proc->unk_37 != 0)
            {
                if (proc->unk_37 == -1)
                {
                    Proc_Goto(proc, 10);
                }

                if (proc->unk_37 == +1)
                {
                    Proc_Goto(proc, 11);
                }

                SoundRoom_DrawSongList(proc);
            }
            else
            {
                SoundRoom_PutHandCursor(proc);
            }
        }
    }

    if (proc->unk_37 != 0)
    {
        int tmp;

        proc->bgYOffset = proc->unk_37 * proc->unk_38 + proc->bgYOffset;

        BG_SetPosition(2, -4, proc->bgYOffset & 0xff);

        tmp = proc->bgYOffset;
        if ((tmp & 0xf) == 0)
        {
            proc->unk_37 = 0;
        }

        SoundRoom_UpdateScrollBar(proc);

        return;
    }

    if (gKeyStatusPtr->newKeys & START_BUTTON)
    {
        StopSoundRoomSong(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (IsSoundRoomSongPlayable(proc, proc->curIndex))
        {
            StartSoundRoomSong(proc, proc->curIndex, 0x20);
            return;
        }

        PlaySoundEffect(SONG_6C);
        return;
    }

    if (gKeyStatusPtr->newKeys & SELECT_BUTTON)
    {
        if (MusicProc4Exists())
        {
            return;
        }

        Proc_Goto(proc, 2);

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}
