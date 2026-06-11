#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

// clang-format on

//! FE8U = 0x0804C5A4
void UpdateSioMenuSelectedGlow(u8 idx)
{
    // clang-format off
    const u8 sioMenuItemGlowLut[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };
    // clang-format on

    if (gUnk_Sio_22 == 0)
    {
        int color = sioMenuItemGlowLut[idx] + 0x10;
        PAL_OBJ_COLOR(3, 1) = ((color) << 10) + ((color) << 5) + (color);
        EnablePaletteSync();
    }

    return;
}
