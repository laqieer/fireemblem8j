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

void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref)
{
    int i, j, _ref = Div(ref * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RED_VALUE(pal[j]);
            int g = GREEN_VALUE(pal[j]);
            int b = BLUE_VALUE(pal[j]);

            r = r + (((0x1F - r) * _ref) >> 5);
            g = g + (((0x1F - g) * _ref) >> 5);
            b = b + (((0x1F - b) * _ref) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}
