#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

// clang-format off

extern const u8 gSioPoints_0[][4];





extern const u8 gSioPoints_3[];

// clang-format off

extern u16 CONST_DATA Sprite_SioPoints_0[];

/* prototypes for same-file helpers called by this run */
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number);

//! FE8U = 0x08048DD0
void PointsNumberMover_TickScore(struct PointsNumberMoverProc * proc)
{
    int number = Interpolate(INTERPOLATE_LINEAR, proc->newScore - proc->difference, proc->newScore, proc->timer, 10);

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, number);

    if ((proc->unk_44 != number) && (proc->playerId == gSioSt->selfId))
    {
        PlaySoundEffect(SONG_SE_POINT_UP);
    }

    proc->unk_44 = number;

    proc->timer++;

    if (proc->timer > 10)
    {
        proc->timer = 0;
        gUnk_Sio_16.currentScore[proc->playerId] = proc->newScore;
        Proc_Break(proc);
    }

    return;
}
