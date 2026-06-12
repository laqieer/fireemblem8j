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









// clang-format off

extern u16 CONST_DATA Sprite_SioPoints_0[];

//! FE8U = 0x08048934
void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number)
{
    int ix;
    int iy;

    u16 * tm = gBG1TilemapBuffer + TILEMAP_INDEX(x, y);

    for (iy = 0; iy < 4; iy++)
    {
        for (ix = 0; ix < 6; ix++)
        {
            *tm = var;

            tm++;
            var++;
        }

        tm += 0x1A;
    }

    ClearText(th);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, x + 4, y + 1), TEXT_COLOR_SYSTEM_BLUE, number);

    return;
}
