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



void EfxTmReplacePal(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 tileref, len;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            tileref = *_tm;
            if (pal != -1) tileref = TILEREF(tileref & 0xFFF, pal);
            if (chr != -1) tileref += chr;

            *_tm = tileref;
            _tm++;
        }

        tileref = 0x20 - width;
        _tm += tileref;
    }
}

void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 * _tm = tm;
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
            *(_tm++) = TILEREF(chr, pal);

        _tm += len;
    }
}
