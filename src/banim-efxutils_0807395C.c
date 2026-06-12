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

void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length)
{
    int i, j;

    for (i = line; i < (line + length); i++)
    {
        for (j = 0; j < 0x10; j++)
        {
            int r, g, b, c;
            u16 * pal = pal_buf + i * 0x10 + j;

            r = RED_VALUE(pal[0]);
            g = GREEN_VALUE(pal[0]);
            b = BLUE_VALUE(pal[0]);

            c = r * 3 + g * 6 + b;

            c = Div(c, 10);

            pal[0] = RGB(c, c, c);
        }
    }
}
