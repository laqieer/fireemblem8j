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



void EfxTmAddPal(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 val;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            val = *_tm;
            if (pal != -1) val = TILEREF(val, pal);
            if (chr != -1) val += chr;

            *_tm = val;
            _tm++;
        }

        val = 0x20 - width;
        _tm += val;
    }
}
