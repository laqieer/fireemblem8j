#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"



void EfxSplitColor(u16 * pal, u8 * dst, u32 length)
{
    u32 i, r, g, b;
    u16 color;

    for (i = 0; i < length; i++)
    {
        color = *pal++;

        r = RED_VALUE(color);
        g = GREEN_VALUE(color);
        b = BLUE_VALUE(color);

        *dst++ = r;
        *dst++ = g;
        *dst++ = b;
    }
}
