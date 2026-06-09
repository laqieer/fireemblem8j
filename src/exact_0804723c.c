#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x08047308
u8 SioResult_GetNewHSScrollTarget(int var)
{
    int i;

    if (var > 6)
    {
        return 5;
    }

    i = var - 2;

    if (i < 0)
    {
        i = 0;
    }

    return i;
}
