#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

u32 SioStrCpy(u8 const * src, u8 * dst)
{
    u32 ret = 0;
    while (*src != '\0')
    {
        *dst++ = *src++;
        ret++;
    }
    *dst = *src;
    return ret;
}
