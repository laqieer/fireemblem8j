#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "gamecontrol.h"
#include "opanim.h"



























//! FE8U = 0x080C69B0
void BlendPaletteToColor(u16 * pal, u16 color, u16 blend)
{
    int i;

    for (i = 0; i < 0x10; i++)
    {
        u8 r = ((RED_VALUE(*pal) * (0x10 - blend)) + (RED_VALUE(color) * blend)) >> 4;
        u8 g = ((GREEN_VALUE(*pal) * (0x10 - blend)) + (GREEN_VALUE(color) * blend)) >> 4;
        u8 b = ((BLUE_VALUE(*pal) * (0x10 - blend)) + (BLUE_VALUE(color) * blend)) >> 4;

        *pal++ = ((b & 0x1f) << 10) | ((g & 0x1f) << 5) | (r & 0x1f);
    }

    return;
}
