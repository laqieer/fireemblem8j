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



void EkrModifyBarfx(u16 * tm, int arg)
{
    int i;

    if (arg > 5)
        *tm = 6;
    else
        *tm = gBarfxTileConf1[arg];

    tm = tm + 1;

    for (i = 0; i <= 0x57; i += 8)
    {
        if (arg >= i + 0xE)
            *tm = 0x10;
        else if (arg >= i + 0x6)
            *tm = gBarfxTileConf2[arg - (i + 0x6)];
        else
            *tm = 0x7;

        tm = tm + 1;
    }

    if (arg > 0x62)
        *tm = 0x17;
    else if (arg > 0x5D)
        *tm = gBarfxTileConf3[arg - 0x5E];
    else
        *tm = 0x11;
}
