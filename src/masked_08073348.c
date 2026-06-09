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



void EfxTmModifyPal(u16 * tm, u16 width, u16 height)
{
    int i, j;
    u16 tileref;
    u16 * _tm = tm;
#ifndef NONMATCHING
    register u32 _tileref asm("r0");
#else
    u32 _tileref;
#endif
    
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
        {
            tileref = _tileref = *_tm;
            tileref = (tileref & 0xFFF)
                    + gEfxTileRefPals_Efxutils_0[(u16)(((_tileref >> 0xC) & 0xF) - 6)];
            *_tm = tileref;
            _tm++;
        }

        len = 0x20 - width;
        _tm += len;
    }
}
