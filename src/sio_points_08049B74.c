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

const u8 gSioPoints_1[][4] =
{
    0, 2, 1, 3,
    2, 0, 3, 1,
    3, 1, 0, 2,
    1, 3, 2, 0,
};



extern const u8 gSioPoints_3[];

// clang-format off

extern u16 CONST_DATA Sprite_SioPoints_0[];

/* prototypes for same-file helpers called by this run */
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number);

//! FE8U = 0x08048D64
void PointsNumberMover_InitScoreChange(struct PointsNumberMoverProc * proc)
{
    int idx = gSioPoints_1[gSioSt->selfId][proc->playerId];

    proc->x = gSioPoints_3[idx * 2 + 0];
    proc->y = gSioPoints_3[idx * 2 + 1];

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, proc->newScore - proc->difference);

    proc->timer = 0;
    proc->unk_44 = proc->newScore - proc->difference;

    return;
}
