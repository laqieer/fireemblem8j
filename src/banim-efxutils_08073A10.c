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

extern CONST_DATA short gEfxutils_0[0x140];

void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length)
{
    int r, g, b, _c;
    u16 color;
    u32 i;

    for (i = 0; i < length; i++)
    {
        color = *src++;

        r = RED_VALUE(color);
        g = GREEN_VALUE(color);
        b = BLUE_VALUE(color);

        _c = Div(r * 3 + g * 6 + b, 10);

        *dst++ = _c;
        *dst++ = _c;
        *dst++ = _c;
    }
}
