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

u16 CONST_DATA Sprite_SioPoints_0[] =
{
    1,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x200) + OAM2_PAL(3),
};

// clang-format on

//! FE8U = 0x08048864
void SioPointsSprite_Loop(void)
{
    PutSprite(4, 56, 4, Sprite_SioPoints_0, 0);
    return;
}
