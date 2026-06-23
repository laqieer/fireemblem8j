#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8J = 0x08046E18
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount)
{
    Text_InsertDrawString(th, 0, 0, nameStr);

    SioDrawNumber(th, 0x58, 2, points);
    Text_InsertDrawString(th, 0x60, 3, GetStringFromIndex(0x5c));

    SioDrawNumber(th, 0x80, 2, rank);
    Text_InsertDrawString(th, 0x88, 0, GetStringFromIndex(0x5e));

    SioDrawNumber(th, 0x94, 2, playerCount);
    Text_InsertDrawString(th, 0x9c, 0, GetStringFromIndex(0x60));

    return;
}
